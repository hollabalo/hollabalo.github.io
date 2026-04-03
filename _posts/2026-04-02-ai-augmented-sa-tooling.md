---
layout: post
title: "I Built an AI-Augmented Workspace So I Can Stop Context-Switching"
short_title: "AI-Augmented SA Tooling"
date: 2026-04-02
tags: [solutions-architecture, ai, productivity, tooling]
---

I'm a Solutions Architect. My job is to think deeply about systems — but the meta-work of _tracking_ that thinking was quietly eating me alive.

Every evening I'd open my calendar, manually log what I worked on, copy artifact links into a tracker, and try to remember which Jira ticket that three-hour rabbit hole belonged to. It was death by context-switch. So I stopped doing it manually and built something instead.

This is the story of that build.

---

## The Problem, Precisely

My work produces a few types of outputs:

- **Markdown documents** — solution docs, ADRs, sequence diagrams (PlantUML/C4)
- **Time entries** — solutioning sessions that need to land on my work calendar and JIRA
- **Activity logs** — a Google Sheet my team uses for status reporting

The gap: none of these systems talk to each other. I'd finish a session, then manually bridge four different tools to record it. That's not a workflow — it's a chore.

The goal was simple: **run one command at the end of the day, and have everything recorded correctly.**

---

## The Architecture

I built the tooling as a Python suite living alongside my solution artifacts in a single git repo. Everything is exposed via a `Makefile`. The repo structure reflects how I actually work:

```
sa-workspace/
├── 0-inbox/          # Incoming / staging
├── 1-Daily-Notes/    # Daily notes by project (key context source)
├── 2-projects/       # Solution docs, ADRs, diagrams
├── scripts/          # The automation suite
├── tracker/          # Activity logs, sprint context (markdown + synced to Sheets)
└── Makefile          # The single entry point
```

The commit convention is load-bearing throughout the whole system:

```
[ProjectName][ActivityType]: description
# e.g. [Broom][Diagram]: KYC sequence diagram with OTP flow
```

Because once you have structured commits, you can _mine_ them.

---

## The End-of-Day Pipeline

The crown jewel is `make eod`. One command triggers three sequential steps:

### Step 1: Publish changed artifacts

`publish_artifact.py` detects which Markdown files changed since the last run (via `git diff`), converts them to PDF using `pandoc`, and uploads them to Google Drive. It writes the shareable link back into the file's frontmatter so it's permanently attached to the document.

```bash
make eod
# → Detected 2 changed artifacts
# → Published: broom/solution.md → Drive (link saved)
# → Published: mystique/adr-01.md → Drive (link saved)
```

### Step 2: Infer solutioning time blocks

`infer_solutioning.py` reads my git history for the day and reconstructs what I actually worked on. It cross-references my calendar (pulling accepted meetings first) so the inferred blocks don't overlap with real meetings. Then it pushes enriched time blocks to a dedicated "JM Gerona Tasks" Google Calendar.

The enrichment is the interesting part. Each block gets annotated with:

- The commit messages from that session
- References to Jira tickets (parsed from branch names and commit bodies)
- Links to any artifacts published in Step 1
- Context pulled from that day's daily notes

With `SUMMARIZE=1`, it uses a local Ollama model to write a human-readable description instead of just dumping raw commit messages. More on that below.

### Step 3: Auto-generate activity log entries

`sync_log_from_calendar.py` reads the calendar blocks written in Step 2, groups them by project, and appends one SA activity log entry per project to both `tracker/activities.md` and the Google Sheet.

The whole pipeline handles one day's work in about 30 seconds.

---

## The Offline LLM Integration

Running everything through Claude Code or Cursor is great — but credits aren't free. For repetitive summarization tasks (commit messages, solutioning block descriptions), I wired in **Ollama** running locally via Apple Intelligence.

Two places this helps:

**1. Commit message generation**

```bash
make commit-msg
```

`gen_commit_msg.py` reads staged and unstaged git changes, sends them to the local model, and suggests a commit message in the `[ProjectTag][ActivityType]: description` format. I review and accept (or edit) before committing. Zero cloud credits spent on a task that's 90% boilerplate.

**2. Solutioning block enrichment**

```bash
make eod SUMMARIZE=1
# or
make sol-preview SUMMARIZE=1
```

When `SUMMARIZE=1` is set, the inferred solutioning blocks get richer natural-language descriptions instead of raw commit messages. The local model synthesizes the git diffs, daily notes, and Jira context into something a human would actually write. Good enough for the activity log; no round-trip to a cloud API.

The `ollama_lifecycle.sh` script handles starting/stopping the Ollama daemon so it's not burning memory when I'm not using it.

---

## The Sync Problem

My company's setup means I work across two folders: `gc-solutions` (git-tracked, personal) and `work-solutioning` (a shadow copy, no git, for shared tooling access). Keeping them in sync without accidentally clobbering work in either direction was annoying.

`sync.sh` handles this with three modes:

- `down` — gc-solutions wins, deletions propagate (full sync)
- `up` — push gc-solutions changes to work-solutioning
- `merge` — merge results back without deleting (for inbound data from scripts)

The `Makefile.work` in the shadow folder proxies all targets back to the real Makefile, syncing before outbound operations and merging after inbound ones. The user never thinks about it.

---

## The Meeting Detection Problem

Early versions of the EOD pipeline had a subtle bug: it would create solutioning blocks that overlapped with meeting invites I hadn't responded to yet. If I hadn't accepted a meeting, it still blocked that time.

The fix: `infer_solutioning.py` now:

1. Subtracts pending (unanswered) invites from available time, not just accepted ones
2. Allows overlap with meetings I explicitly _declined_ (declined = that time is free)

Small detail, but it made the inferred blocks much more accurate for days with a lot of meeting churn.

---

## What the Daily Workflow Actually Looks Like

```bash
# Morning — pull latest sprint context
make pull

# During the day — author solution docs in 2-projects/, commit with structure
git add 2-projects/broom/solution.md
make commit-msg   # → suggests "[Broom][Documentation]: sequence diagram for..."
git commit -m "..."

# End of day
make eod          # everything above happens automatically
# or
make eod SUMMARIZE=1   # use local LLM for richer descriptions
```

For backfilling a day I missed:

```bash
make eod DATE=2026-04-01
```

For generating a JIRA worklog at month end:

```bash
make worklog MONTH=2026-04
```

---

## What I Learned

A few things stood out:

**Structured commits are an investment that pays compounding returns.** Once my commits are parseable, I can mine them for calendar blocks, activity logs, status reports, and commit messages. The discipline is cheap; the upside is large.

**Local LLMs are good enough for low-stakes summarization.** I don't need GPT-4 to rephrase "Fixed OTP retry logic" into "Investigated and resolved retry behavior in the OTP verification flow." A quantized 8B model running on-device does it fine, in ~2 seconds, for free.

**A Makefile is a surprisingly good UX surface.** `make help` gives me a self-documenting command reference. Targets compose naturally. The learning curve for new workflows is "add a target, write a comment above it."

**The sync problem is always messier than it looks.** Two-directory workflows with different git states are a footgun. Investing early in a robust sync script (with explicit directionality) saved me from several "wait, which version is canonical?" moments.

---

## What's Next

A few things I still want to add:

- **Confluence publishing round-trip:** I can already push Markdown → Confluence, but I want to detect when a Confluence page was edited externally and pull those changes back.
- **Status report automation:** `make status` exists but still needs some manual polish before the output is send-ready.
- **Smarter artifact detection:** Currently based on `git diff`. I want to layer in "was this file actually _meaningfully_ changed, or just whitespace-touched?"

---

The scripts assume my specific Google Workspace setup — but the architecture is straightforward enough to adapt to any similar stack.

If you're an SA (or any knowledge worker) spending a non-trivial chunk of time bridging your own tools, it might be worth asking: what if that was one command?
