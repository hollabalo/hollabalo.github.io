---
layout: post
title: "AI-Augmented Solutions Architecture: Organization and Structure"
short_title: "Organizing AI-Augmented SA Work"
date: 2026-04-16
tags: [solutions-architecture, ai, productivity]
---

In the previous post, I covered the foundational principles of AI-augmented solutions architecture: treating docs and diagrams as code. But to make AI truly effective, you need the right organizational structure — a workspace that AI can navigate like a human architect would.

This post dives into folder structures, master guides, and templates that create the consistency AI needs to produce useful output.

---

## The Concept: A Structured Project Folder

The foundation of this workflow is a **structured project folder on your machine**, opened directly in your AI-assisted editor.

This isn't about where the folder lives or how it's backed up — it's about how it's organized. AI tools read the entire folder when you open it. The more predictable and consistent the layout, the more useful the AI becomes, because it can find, cross-reference, and reason about any document without being told where things are.

---

## One Folder vs. Multiple Folders

When organizing your SA workspace, you have options:

| Option                             | Description                       | Trade-off                                             |
| ---------------------------------- | --------------------------------- | ----------------------------------------------------- |
| **Single folder for all projects** | All initiatives in one folder     | Full AI context across projects; single place to open |
| **One folder per team**            | Separate folder per delivery team | Cleaner separation; AI context limited to one team    |
| **One folder per project**         | Separate folder per initiative    | Most isolated; AI cannot cross-reference past work    |

The preferred approach: **one folder for all your SA work.**

### Why a single folder works

**Full AI context across all projects**

When your AI editor opens the workspace, it sees everything — not just the current project, but every past project, every template, every decision ever recorded.

Concrete benefits:

- "What did we decide about messaging patterns in the last project?" → AI scans past ADRs and answers
- "Generate a system context diagram consistent with previous ones" → AI references existing diagrams for style
- "Does this new API pattern conflict with anything we've done?" → AI cross-references across initiatives

None of this works if each initiative is in a separate, isolated folder.

**Single source of truth for templates and guides**

The `_Templates/` folder is the master. Every project references it. When templates are updated, that update is immediately reflected everywhere — no copying or syncing.

**Simpler tooling**

One folder to open in your editor, one folder to configure AI tools against.

---

## Folder Structure

The folder is organized to be predictable enough for AI tools to navigate without being told:

```
sa-workspace/
│
├── _AI-Augmented-SA/                  ← this playbook (ways of working)
│   ├── index.md
│   ├── 01-overview.md
│   └── ...
│
├── _Templates/                        ← master guides and templates
│   ├── diagram-design-language.md    ← single source of truth for diagram style
│   ├── puml-colors.iuml               ← authoritative color palette (local preview)
│   ├── solution-template.md           ← solution document template
│   ├── adr-template.md                ← ADR template
│   ├── daily-note.md
│   ├── review-session.md
│   ├── weekly-digest.md
│   └── onsite-day.md
│
├── 1-Daily-Notes/                     ← meeting and daily notes by context
│   └── {context}/
│       └── {year}/{year-month}/
│           └── {date}-{meeting}.md
│
└── 2-Projects/                        ← all SA project work
    └── {year}/
        └── {team}/
            └── {initiative}/
                └── {feature}/
                    ├── solution-doc/
                    │   ├── solution.md          ← working draft
                    │   ├── diagrams/
                    │   │   ├── system-context.puml
                    │   │   ├── logical-architecture.puml
                    │   │   ├── sequence-{flow}.puml
                    │   │   └── ...
                    │   └── assets/
                    │       └── {supporting analysis, screenshots, etc.}
                    └── adrs/
                        └── {N}-{decision}/        ← one folder per ADR
                            ├── adr.md
                            │   ├── diagrams/               ← optional: if ADR needs diagrams
                            │   │   ├── option1-flow.puml
                            │   │   ├── option2-flow.puml
                            │   │   └── ...
                            │   └── assets/                 ← optional: supporting docs
                            │       └── {supporting files}
```

The underscore-prefixed folders (`_Templates/`, `_AI-Augmented-SA/`) signal that they are shared resources, not project-specific.

---

## Naming Conventions

### Folders

- Team or context: lowercase, hyphen-separated (`account-management`, `user-experience`)
- Initiative: lowercase, hyphen-separated (`offer-takeover`, `journey-onboarding`)
- Feature: lowercase, hyphen-separated, descriptive (`voucher-offer-screen`, `ingestion-to-analytics`)

### Files

| File type                | Convention                       | Example                          |
| ------------------------ | -------------------------------- | -------------------------------- |
| Solution document        | `solution.md`                    | `solution.md`                    |
| ADR folder               | `{N}-{decision-slug}/`           | `04-per-user-daily-display-cap/` |
| ADR file (inside folder) | `adr.md`                         | `adr.md`                         |
| Sequence diagram         | `sequence-{flow-name}.puml`      | `sequence-registration.puml`     |
| Daily note               | `{YYYY-MM-DD}-{meeting-slug}.md` | `2026-02-19-design-sprint.md`    |

### ADR folder numbering

Number ADR folders sequentially within a feature: `01-`, `02-`, `03-`, etc. The number reflects the order decisions were made, not importance.

Example: `04-per-user-daily-display-cap/` = the fourth architectural decision recorded for this feature.

---

## How This Works With AI Tools

Your AI editor reads the entire folder when you open it. The structure above means:

- AI finds templates in `_Templates/` without being told
- AI finds all ADRs for a feature by navigating to the `adrs/` subfolder
- AI can cross-reference past project solutions when working on new ones
- AI generates files in the correct location when given the folder structure as context

The folder structure is, in effect, the AI's navigation map. Keep it consistent.

---

## Master Guides: Rules and Vocabulary

Master guides are the **single source of truth** documents that govern how all SA deliverables look and behave. They define **rules and vocabulary** that apply across all documents and diagrams.

When an AI is given a master guide as context, it can produce output that conforms to the standard without the SA having to re-specify every rule in each prompt.

### Current Master Guides

**Diagram Design Language**

**File:** `_Templates/diagram-design-language.md`

This is the most critical guide. It governs:

- Semantic color palette — colors encode ownership and system type
- Canvas and connector settings — background, fonts, arrow styles
- Shape-to-role mappings and stereotypes
- Layout conventions and density controls
- Title conventions for each diagram type
- Starter templates — copy-paste-ready code
- Versioning and updates

**Key rule:** For publishing, copy the inline design block from this guide into each diagram. Don't use local includes — they're not supported in documentation platforms.

**Color Palette (Local Use)**

**File:** `_Templates/puml-colors.iuml`

Authoritative hex values for all semantic roles, for use in local PlantUML preview.

### How to Use Master Guides With AI

Reference the guide explicitly in every relevant prompt:

```
Using the design language defined in _Templates/diagram-design-language.md,
generate a [diagram type] for the following:
[description]
```

```
Review this diagram and confirm it follows the conventions in
_Templates/diagram-design-language.md. Flag any deviations.
```

The guide is the contract. AI enforces it when you reference it; without the reference, it defaults to its own style.

---

## Master Templates: Required Structure

Master templates define the **required structure** for each type of document. They are the schema — every document of a given type must conform.

Templates serve two purposes:

1. **For humans:** consistent structure reviewers know how to navigate
2. **For AI:** contract that constrains and guides generation, making output immediately usable

### Solution Document Template

**When to use:** For every feature or initiative requiring a formal solution document

**Structure:**

| Section                       | Purpose                                                                                                           |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| 1. Overview                   | Initiative metadata, summary, risk score                                                                          |
| 2. Context                    | Problem statement, requirements reference, capabilities affected, system context diagram, scope                   |
| 3. Key Architecture Decisions | Decision table linking to ADRs                                                                                    |
| 4. Solution Design            | Logical architecture, core design content, business rules, integration flows, data model, APIs, failure scenarios |
| 5. Review History             | Review rounds, outcomes, reviewer notes                                                                           |

**Template notes:**

- Section 4.2 is intentionally unnamed — rename it to match the solution (e.g., "Analytics Setup", "New Events Introduction")
- Sections 4.3, 4.4.2, and 4.4.6 are optional — include only when applicable
- Diagrams go in `diagrams/`, referenced via include for local preview
- Supporting files in `assets/`

**AI prompt pattern:**

```
Using _Templates/solution-template.md as the document structure,
draft a solution document for the following feature:
[feature description / requirements summary]

For section 4.2, the core design topic is: [e.g., Analytics Campaign Setup]
Leave decision rationale in section 3 as placeholder.
```

### Architecture Decision Record (ADR) Template

**When to use:** For every significant architectural decision — when multiple options were considered and a deliberate choice was made

**Structure:**

| Section                       | Purpose                                                         |
| ----------------------------- | --------------------------------------------------------------- |
| Header                        | ADR ID, status, deciders, review level, date, links             |
| Change Log                    | Version history                                                 |
| Context and Problem Statement | Business problem, key constraints, assumptions                  |
| Decision Drivers              | Criteria that shaped the decision                               |
| Considered Options            | Summary table of all options                                    |
| Decision Outcome              | Chosen option, rationale, positive/negative consequences, risks |
| Pros and Cons of the Options  | Detailed breakdown per option with diagrams                     |
| Related Documents             | Links to solution doc, requirements, related ADRs               |
| Review History                | Review rounds and outcomes                                      |

**ADR folder structure:**

Each ADR lives in its own numbered folder under `adrs/`. The `diagrams/` and `assets/` subfolders are optional.

```
adrs/
└── {N}-{decision-slug}/
    ├── adr.md               ← the ADR document
    ├── diagrams/            ← optional: per-option flow diagrams
    │   ├── option1-flow.puml
    │   ├── option2-flow.puml
    │   └── ...
    └── assets/              ← optional: supporting docs, data exports
        └── {supporting files}
```

**When to add diagrams to an ADR:**

Add a `diagrams/` folder when options are architecturally different enough that a visual comparison helps. A sequence diagram per option makes differences concrete.

**AI prompt pattern:**

```
Using _Templates/adr-template.md as the structure,
draft an ADR for the following decision:

Decision: [what the decision is about]
Context: [situation]
Options to analyze: [option 1], [option 2], [option 3]

Leave the "Decision Outcome" section as [SA DECISION REQUIRED].
Draft the pros/cons and setup-at-a-glance tables for each option.
```

### Other Templates

- **Daily Note Template** — for meeting and daily capture
- **Review Session Template** — for structured review notes
- **Weekly Digest Template** — summary of SA work
- **Onsite Day Template** — notes from engagement days
- **Meeting Exit Protocol** — end-of-meeting summary

---

## Template Governance

Templates are living documents. When a structural change is needed:

1. Edit the template file in `_Templates/`
2. Update the version or last-updated field
3. Apply the change to any in-progress documents that need to conform
4. Note the change in the template's own change log

Do not create project-specific variants. If a template needs adjustment for a specific project type, update the master template and add an optional section — don't fork it.

---

## Why This Matters

The folder structure, guides, and templates aren't bureaucratic overhead — they're the infrastructure that makes AI augmentation possible. They create the consistency that turns AI from a generic drafting tool into a specialized architecture assistant.

In the next post, I'll cover the AI tools and workflow that bring this all together into a cohesive practice.
