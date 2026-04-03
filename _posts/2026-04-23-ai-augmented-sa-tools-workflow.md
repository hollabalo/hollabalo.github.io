---
layout: post
title: "AI-Augmented Solutions Architecture: Tools and Workflow"
short_title: "AI Tools and SA Workflow"
date: 2026-04-23
excerpt: "A comprehensive guide to selecting the right AI tools for solutions architecture work and implementing a five-phase workflow that leverages AI while protecting human judgment."
# image: /assets/images/ai-augmented-sa-tools-workflow.png
tags: [solutions-architecture, ai, productivity]
---

With the foundations of docs-as-code and proper organization in place, the next layer is the AI tools and workflow that make it all work. Different AI tools serve different purposes in solutions architecture — knowing when to use which tool, and in what sequence, is part of the approach.

This post covers the AI toolset and the five-phase workflow that protects human judgment while leveraging AI capabilities.

---

## Overview of AI Tools in SA Work

Different AI tools serve different purposes. Using the right tool for the right job — and knowing when to switch — is key.

The tools are grouped by role:

| Role                                                                 | Tools                              |
| -------------------------------------------------------------------- | ---------------------------------- |
| **Primary generation** (doc drafting, diagram creation, solutioning) | AI coding assistants               |
| **Technical deep research**                                          | Advanced AI research tools         |
| **Broad research with internal context**                             | Internal knowledge search tools    |
| **Platform-specific queries**                                        | Specialized platform AI assistants |
| **Third-party platform AI features**                                 | Whatever AI the platform provides  |

---

## Primary Generation Tool: AI Coding Assistants

**Type:** Integrated development environment AI

AI coding assistants are the primary tool for this workflow. They read your entire project folder and handle most doc generation and solutioning work.

### What makes them the primary tool

- **Opens the entire project folder** — sees all ADRs, solution docs, templates, and diagrams at once
- **Agent mode** handles iterative doc building, diagram code generation, and decision matrix scoring
- **File references** in prompts — reference templates and existing docs as context
- **Inline editing** — select text and ask the AI to rewrite, expand, or restructure it
- **Best for:** iterative doc building, diagram generation, and scoring decision matrices

### Usage strategy

Use AI coding assistants as primary. When needed, shift to other tools for research.

---

## Technical Research: Advanced AI Research Tools

**Type:** Deep research mode

Use advanced AI research tools for deep technical research — evaluating protocols, understanding platform capabilities, drafting option analyses for ADRs.

Use them directly when you want to conserve primary tool usage for generation work.

---

## Broad Research + Internal Knowledge: Search Tools

**Type:** Internal docs search

Internal knowledge search tools search across documentation, issues, and drives simultaneously — the fastest way to find anything that exists internally.

### When to use

- Finding platform documentation
- Searching for prior solution docs, architecture decisions, or design proposals
- Looking up related issues or project histories
- Finding a document you know exists but can't locate
- Before starting any ADR — check if the decision has already been made

> Search internal tools before asking colleagues or using external AI. If it's in the docs, they'll find it.

---

## Platform-Specific AI Assistants

**Type:** Platform-trained AI

Specialized AI assistants trained on specific platform documentation. The go-to for platform-specific questions.

### When to use

- Platform integration design questions
- Understanding API capabilities and constraints
- Validating assumptions about platforms

---

## Third-Party Platform AI Features

**Type:** Platform-provided AI

Many third-party platforms have built-in AI assistants. Use them for platform-specific questions when available.

### When to use

- Fast answers to platform-specific questions
- Implementation approach validation
- Exploring platform capabilities

### The broader principle

Get to accurate answers faster. If a platform's AI answers a question in 30 seconds, use it. Then verify with humans if it affects significant decisions.

---

## Tool Selection Guide

| Task                                | Best tool                                     |
| ----------------------------------- | --------------------------------------------- |
| Draft a full solution doc           | AI coding assistant (agent mode)              |
| Generate a diagram                  | AI coding assistant or advanced research tool |
| Draft an ADR with options analysis  | AI coding assistant or advanced research tool |
| Search for internal docs            | Internal knowledge search tool                |
| Platform design question            | Specialized platform AI                       |
| Third-party implementation question | Platform's built-in AI                        |
| Deep technical research for ADR     | Advanced research tool                        |
| Broad background research           | Advanced research tool                        |
| Cross-project question              | AI coding assistant (chat)                    |
| Review and refine existing doc      | AI coding assistant (inline edit)             |

---

## The Solutioning Process

The steps are ordered to protect human judgment.

AI enters only after you have gathered facts and consulted people. This sequence ensures AI is informed by real context, not the other way around.

The five phases:

```
01 Gather Facts          Requirements, scope, timeline.
                         Write for human and AI readability.
         ↓
02 Consult People        System owners, product owners, engineers.
                         Humans first — always.
         ↓
03 AI Research           Fill gaps, explore options.
                         Use the right tool for the right question.
         ↓
04 Solutioning + ADRs    List options, let AI enrich each one,
                         triple-check everything, generate decisions.
         ↓
05 Generate Docs         AI drafts docs and diagrams.
                         SA reviews, corrects, owns the output.
```

Steps 1 and 2 are human-only. AI enters in Step 3 — informed by everything before it.

**Prerequisites:** The three foundational pillars must be in place — docs as code, diagrams as code, and folder structure. Without consistent structure, AI output degrades to generic drafts.

---

## Phase 1 — Gather Facts

**You own this entirely. No AI involvement yet.**

Capture everything you know about the demand before doing anything else. Write for both human and AI readability from day one — clear notes improve AI output quality later.

| Activity                | What it means                                          |
| ----------------------- | ------------------------------------------------------ |
| **Requirements**        | Capture all functional and non-functional requirements |
| **Scope & Timeline**    | Define project boundaries and delivery targets         |
| **Document Everything** | Write notes in Markdown — readable by you and AI tools |
| **Note Uncertainties**  | Flag unknowns explicitly — they become ADR candidates  |

**What to produce:** Meeting notes, requirement summaries, and a list of open questions — all in Markdown in your project folder.

---

## Phase 2 — Consult the Right People

**You own this entirely. AI cannot do this.**

Reach out to humans who have context that no document contains. Colleagues carry institutional knowledge that AI tools cannot access. They know how systems actually behave. They know unrecorded constraints. They know what business actually needs.

**This step comes before AI research.** If you reverse the order, AI shapes your questions before colleagues can.

| Role                     | Why                                                               |
| ------------------------ | ----------------------------------------------------------------- |
| **System Owners**        | Understand actual system behavior, limits, history                |
| **Product Owners**       | Clarify requirements, priorities, what "done" actually looks like |
| **Solutions Architects** | Peer review of problem framing; catch blind spots                 |
| **Designers**            | UX and flow considerations affecting architecture                 |
| **Engineers**            | Implementation feasibility, existing patterns, constraints        |

> Reach out to the RIGHT and RELEVANT people — not everyone, but never the wrong ones.

**What to produce:** Updated notes reflecting what you learned. Flag any new uncertainties.

**Important:** After consulting humans, verify any surprising information before treating it as fact. If a system owner tells you something that contradicts your understanding, confirm it with documentation or another source.

---

## Phase 3 — AI Research

**AI enters here — informed by everything you gathered in Phases 1 and 2.**

Use AI tools to research, fill gaps, and explore options. Because you came in with structured notes and real human context, AI has something concrete to work from. This makes its output useful rather than generic.

| Question type                                             | Tool to use                   |
| --------------------------------------------------------- | ----------------------------- |
| Internal system behavior, existing docs, past decisions   | **Internal knowledge search** |
| Platform-specific questions                               | **Specialized platform AI**   |
| Third-party implementation validation                     | **Platform's built-in AI**    |
| Deep technical research (protocols, patterns, trade-offs) | **Advanced research tool**    |
| Broad background research                                 | **Advanced research tool**    |
| Generation within your project folder                     | **AI coding assistant**       |

**Key rule: triple-check AI responses.**

AI research may surface options, implications, or possibilities you hadn't considered. This is valuable — but surprising results must be verified:

1. Verify with the relevant humans
2. Check internal documentation
3. Validate platform-specific claims

Never accept AI research results at face value if they contradict what you heard from humans or know from experience.

**What to produce:** Updated notes with research findings. A clearer picture of options. A list of ADR candidates.

---

## Phase 4 — Solutioning + ADRs

**Human-AI collaboration. You list the options; AI enriches them; you decide.**

This is where human judgment and AI capability integrate most directly. You bring the problem framing, constraints, and options you're considering. AI fills in the analysis. You make every decision.

### The process

**List your options**

You don't need 100% certainty. Uncertainties are welcome. List the options you're considering, even if you're not sure about all of them.

**AI enriches each option**

Feed your gathered facts to AI. Ask it to fill in pros, cons, and implications per option. Ask it to identify edge cases.

```
I am designing [feature]. These are the options I am considering:
- Option A: [description]
- Option B: [description]
- Option C: [description]

For each option, fill in:
- Pros and cons
- Technical implications
- Risk assessment
- Edge cases or failure modes I should consider
```

**Triple-check the responses**

Unexpected possibilities may surface. Verify surprises with humans or internal tools before accepting. If AI suggests an option you hadn't considered, treat it as a hypothesis — validate it before building your ADR around it.

> Ask AI if uncertain parts of your solution need their own ADR. Let AI surface edge cases you haven't thought of.

**Generate the ADR**

Ask AI to draft the ADR using the template. It should populate the options, pros/cons, and risk table based on your facts.

```
Using the ADR template, generate an ADR for the following decision.
For each option, fill in:
- Pros and cons
- Setup at a glance
- Flow (one line)
- Risk table

Leave the Decision Outcome section as [SA DECISION REQUIRED].
```

**The SA fills in the decision and rationale.** The pros/cons analysis informs the decision; it doesn't make it.

**What to produce:** Completed ADRs with options analysis and SA-authored decision outcomes.

---

## Phase 5 — Generate Docs

**AI drafts. You review, correct, and own the output.**

Once all ADRs are solid and reviewed, the solution doc can be generated. AI handles the scaffolding; the SA signs off before anything ships.

### Solution document generation

1. All ADRs are complete and decisions are made
2. Feed all gathered facts to the AI agent
3. AI generates the full solution document using the solution template
4. **Review and correct the output** — check for wrong logic, incorrect flows, inaccurate technical specs. Fix anything AI got wrong.
5. Copy the final Markdown and paste into your documentation platform

> AI produces a first draft, not a final document. The SA is responsible for the accuracy of everything in it.

**Prompt pattern:**

```
Using the solution template as the document structure, generate a solution document for:

Feature: [feature name]
Context: [paste your gathered facts and requirements notes]
Decisions: [list the decisions made in each ADR and link to the ADR files]
Core design topic for section 4.2: [e.g., Analytics Campaign Configuration]

Leave any section where you are uncertain as an explicit placeholder.
```

### Diagram generation

For each diagram needed, generate it separately using the design language as context:

```
Using the [diagram type] design block from the design language guide,
generate a PlantUML [diagram type] for:
[describe the systems, actors, and flows]

Save to: 2-Projects/{year}/{team}/{initiative}/{feature}/solution-doc/diagrams/{filename}.puml
```

After generation, preview locally and review thoroughly — correct any wrong flows, missing steps, incorrect actors, or bad technical logic. Layout and styling are secondary; accuracy comes first.

### Publishing

1. Review the full solution document
2. Copy the Markdown content into your documentation platform
3. For each diagram: copy the PlantUML content into the platform's diagram macro
4. Update the page and submit for review

---

## General Prompting Principles

### 1. Always anchor to your templates and guides

```
Using the solution template as the document structure...
Following the design language in the diagram guide...
```

Without this anchor, AI produces generic output that deviates from your standards.

### 2. Separate what you want generated from what you will fill in

```
Draft the solution document with all required sections. Leave the following
as placeholder text for me to complete:
- The actual architectural decisions and rationale in section 3
- The failure scenario table in section 4.4.6
```

### 3. Give the AI the requirements, not the solution

```
The feature requirements are:
[paste requirements]

Based on these, identify the key architectural decision points and draft
ADRs for each, including pros/cons and a risk table per option.
```

Let AI surface the options. You make the call.

### 4. Triple-check everything

AI may surface options or implications you hadn't considered. Before accepting:

- Verify with the relevant humans
- Check internal docs
- Do manual doc lookup
- Validate platform-specific details

Never ship without reviewing.

---

## Anticipated Question: Why Not Use One AI Tool for Everything?

All of these tools are used. They serve different jobs.

**Research and knowledge tools** are excellent at answering questions, summarizing information, and giving context.

**AI coding assistants are generation and authoring tools.** Their advantage is specific:

| What you want to do                           | Why AI coding assistants win here                                                       |
| --------------------------------------------- | --------------------------------------------------------------------------------------- |
| Draft a solution doc from your local template | They read your templates directly — no uploading. They work with the file in real time. |
| Generate a diagram from the design language   | Same — they read your design language live and generate conformant output immediately.  |
| Publish to documentation platform             | With this workflow: copy the Markdown, paste into the platform. No conversion.          |
| Cross-reference past ADRs                     | They can search your entire project folder. No upload required.                         |

Using research tools for these tasks would require uploading your template files, design language guide, existing ADRs each time — or maintaining a notebook you keep in sync manually. That friction defeats the purpose.

**The workflow:**

- Research → internal search tools, advanced research tools, specialized platform AIs
- Generation and authoring → AI coding assistants

Each tool in its lane.

In the final post, I'll cover how to get started with this approach and common pitfalls to avoid.
