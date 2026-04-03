---
layout: post
title: "AI-Augmented Solutions Architecture: Getting Started"
short_title: "Getting Started with AI-Augmented SA"
date: 2026-04-30
excerpt: "Practical steps to implement AI-augmented solutions architecture in your work, from initial setup to creating your first complete solution document."
# image: /assets/images/ai-augmented-sa-getting-started.png
tags: [solutions-architecture, ai, productivity]
---

With the foundations, organization, tools, and workflow in place, the final piece is getting started. This post covers the practical steps to implement AI-augmented solutions architecture in your work, from initial setup to your first complete solution document.

---

## Prerequisites

Before starting, you need:

- AI coding assistant installed (check with your team for enterprise access)
- Editor with PlantUML extension (for local diagram preview)
- Advanced AI research tool access
- Internal knowledge search tool access
- Specialized platform AI access (if applicable)
- 30 minutes to read the diagram design language guide once

---

## Day 1 Setup

### Step 1: Open your project folder in your AI editor

You have a structured project folder on your machine containing all your SA documents, templates, and diagrams. Open that folder as the workspace in your AI-assisted editor.

If using an alternative setup, open the same project folder and run the AI tool in the terminal.

### Step 2: Confirm your AI tool can see your templates

In the AI chat, type:

```
What templates are in the _Templates/ folder?
```

If it can list them correctly, it has indexed the folder and is ready.

### Step 3: Read the Diagram Design Language guide

Open the diagram design language guide and read it in full. This takes about 15–20 minutes and is the most important thing you can do for consistent AI output.

Key things to internalize:

- The semantic color palette and what each color means
- Which diagram type to use for which situation
- The title convention for each diagram type
- The publishing note (no local includes — use inline design blocks)

### Step 4: Skim the solution and ADR templates

Open the solution and ADR templates. You don't need to memorize them — the AI will apply them — but understanding the structure helps you review AI output effectively.

---

## Your First Solution Document

### Scenario

A new feature demand has arrived with requirements. You need to produce a solution document.

### Step 1: Create the folder structure

Create the following folders inside your project folder:

```
2-Projects/
└── 2026/
    └── {team}/
        └── {initiative}/
            └── {feature}/
                ├── solution-doc/
                │   ├── solution.md      ← create this file
                │   ├── diagrams/        ← AI will generate files here
                │   └── assets/          ← supporting files, if needed
                └── adrs/
                    └── {N}-{slug}/      ← one folder per ADR
                        ├── adr.md
                        ├── diagrams/    ← optional: per-option diagrams
                        └── assets/      ← optional: supporting docs
```

Or ask your AI assistant to do it:

```
Create the folder structure for a new solution:
Team: {team name}
Initiative: {initiative name}
Feature: {feature name}

Follow the conventions in the folder structure guide
```

### Step 2: Gather your facts (Phase 01)

Before touching AI for generation, make sure you have:

- The requirements or BRD (or a clear summary)
- Notes from any demand alignment meetings
- A list of open questions and uncertainties

Write these in a `notes.md` file in your feature folder, or paste them directly into your AI prompts in the next steps.

### Step 3: Consult the right people (Phase 02)

Before generating anything, consult the humans who have context AI does not:

- System owners for any systems your solution touches
- Product owners for requirement clarification
- Engineers for feasibility and existing patterns

Update your notes with what you learned.

### Step 4: Check internal docs for prior decisions

Before drafting ADRs, search internal tools for any prior decisions on the same topics:

```
[In internal search]: search for "{decision topic}" in docs
```

If prior ADRs or solution docs exist, review them before generating new ones.

### Step 5: Draft the solution document

```
Using the solution template as the document structure,
draft a solution document for the following feature:

Feature: {feature name}
Initiative: {initiative name}
Team: {team name}

Requirements:
{paste your requirements notes}

Core design topic for section 4.2: {e.g., Analytics Campaign Setup}

Leave these as explicit placeholders for me to complete:
- Section 3: Key Architecture Decisions (I will fill in after deciding)
- Risk score rationale (I will validate the scores)

Save to: 2-Projects/2026/{team}/{initiative}/{feature}/solution-doc/solution.md
```

### Step 6: Generate the system context diagram

```
Using the System Context design block from the diagram design language guide,
generate a PlantUML system context diagram for:

Feature: {feature name}

Actors:
- User (person)

Systems:
- Mobile App (existing frontend)
- {New Service Name} (new service, AWS) [use new_svc tag]

External systems:
- {External SaaS name} [use saas tag]
- {Partner name} [use partner tag]

Key flows:
- {describe main flow}

Save to: 2-Projects/2026/{team}/{initiative}/{feature}/solution-doc/diagrams/system-context.puml
```

### Step 7: Identify decision points and draft ADRs

```
Based on the feature requirements below and the solution document I am drafting,
identify the top 3 architectural decision points that should be documented as ADRs.
For each, suggest 2-3 options.

Requirements: {paste or reference your notes}
```

Then for each decision:

```
Using the ADR template, draft an ADR for:

Decision: {decision}
Context: {context from your notes}
Options to analyze: {option 1}, {option 2}, {option 3}

Include a weighted scoring matrix with these criteria:
- {Criterion 1} (weight: high)
- {Criterion 2} (weight: medium)
- {Criterion 3} (weight: low)

ADR number: {N} (next sequential number in adrs/)
Save to: 2-Projects/2026/{team}/{initiative}/{feature}/adrs/{N}-{slug}/adr.md

Leave the Decision Outcome section as [SA DECISION REQUIRED].
```

### Step 8: Triple-check, decide, and fill in the outcomes

For each ADR:

1. Read the options analysis the AI drafted
2. Verify any surprising implications with the relevant humans or via internal search
3. Make the decision yourself
4. Write the decision outcome and rationale in your own words

### Step 9: Update the solution doc decisions table

Update Section 3 of the solution doc to reference each finalized ADR:

```markdown
| 1 | {Decision title} | 2026-04-30 | ACCEPTED | [ADR-{N}](../adrs/{N}-{slug}/adr.md) |
```

### Step 10: Generate remaining diagrams, review, and publish

For each integration flow, generate a sequence diagram using the design language. Then:

1. Preview all diagrams locally in your editor with the PlantUML extension
2. Review the full solution document — fix anything AI got wrong
3. Add nuance that only you know (from meetings and conversations not captured in requirements)
4. Copy the final Markdown and paste into your documentation platform
5. Paste each PlantUML file's content into the platform's diagram macro (inline design block, no includes)

---

## Starter Prompt Reference Card

| Task                          | Anchor                                                                                  |
| ----------------------------- | --------------------------------------------------------------------------------------- |
| Draft solution doc            | `Using the solution template as the document structure...`                              |
| Draft ADR with scoring matrix | `Using the ADR template...`                                                             |
| System context diagram        | `Using the System Context design block from the diagram design language guide...`       |
| Logical architecture diagram  | `Using the Logical Architecture design block from the diagram design language guide...` |
| Sequence diagram              | `Using the sequence diagram design block from the diagram design language guide...`     |
| Check diagram conformance     | `Review this diagram against the conventions in the diagram design language guide...`   |
| Cross-project question        | `Scan the 2-Projects/ folder and find any prior decisions about {topic}...`             |

---

## Common Pitfalls

| Pitfall                                                                           | Fix                                                                                                       |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| AI generates a diagram without the design language → wrong colors, no stereotypes | Always anchor the prompt to the design language file                                                      |
| AI invents a decision in the ADR Decision Outcome section                         | Explicitly instruct AI to leave it as `[SA DECISION REQUIRED]`                                            |
| Diagram macro fails to render in documentation platform                           | Replace local includes with the inline design block from the guide                                        |
| AI result contradicts what a system owner told you                                | Verify with the system owner — don't assume AI is right                                                   |
| Skipping Phase 02 and going straight to AI Research                               | Go back. Consult humans first. AI research should be informed by human context, not the other way around. |

---

## Measuring Success

After a few projects, you should see:

- **Faster drafting:** AI handles 70–80% of document structure and boilerplate
- **Better decisions:** Structured ADRs with explicit options analysis lead to more defensible choices
- **Consistent artifacts:** All diagrams and documents follow the same visual and structural language
- **Easier reviews:** Reviewers know exactly where to look for each type of information
- **More time for thinking:** Less time pixel-pushing, more time solutioning

The goal isn't to work faster — it's to work deeper. With AI handling the repetitive parts, you can focus on the architectural judgment that only humans can provide.

---

## Final Thoughts

AI-augmented solutions architecture isn't about replacing the architect — it's about amplifying their capabilities. By creating structured foundations, choosing the right tools, and following a workflow that protects human judgment, you can produce better architecture work with the same time investment.

The key insight: AI is most powerful when it has consistency to anchor on and human context to inform it. Build those foundations, and the rest follows.

If you've implemented any of these practices or have questions about getting started, I'd love to hear about it in the comments.
