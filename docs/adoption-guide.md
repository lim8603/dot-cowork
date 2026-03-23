# Adoption Guide

This document explains how to adopt the framework in a new or existing project.
It focuses on the minimum practical setup for a first working session, not on the full lifecycle or the full document inventory.

Use `README.md` for the public overview.
Use `docs/feature-flow-overview.md` for the lifecycle flow.
Use `docs/document-map.md` when you need to find the right framework file quickly.

Path notation is based on an installed project by default.
When checking this repository itself, map `.cowork/...` paths to `frameworks/ko/.cowork/...` or `frameworks/en/.cowork/...` as needed.

## Update Policy

Update this document when the adoption path changes in a meaningful way:

- the minimum installation set changes
- the first-session contract changes
- the recommended greenfield or brownfield setup order changes
- the default contributor workspace setup changes

Do not update it for small wording refinements or routine edits inside the source documents it references.

## Before You Start

Choose the framework variant that matches the working language of the project you are setting up.
`frameworks/ko/` remains the Korean authoring baseline, and `frameworks/en/` is the published English install variant.

The recommended install set is:

- `.cowork/`
- `.github/`
- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`

You do not need to pre-create every possible project artifact before the first session.
The framework is designed to start small and deepen through real work.

## Choose Your Starting Path

| Situation | Recommended path | Main goal |
| --- | --- | --- |
| New project with little existing structure | Greenfield adoption | Establish the minimum project framing and begin in Define |
| Existing repository with docs, code, or backlog already present | Brownfield adoption | Recover the current phase and map existing artifacts without forced rewrites |
| One contributor for now | Solo-default setup | Use the member workspace model with the lightest possible structure |
| Multiple contributors or likely near-term collaboration | Team-ready setup | Keep shared state and member workspaces separate from the start |

Greenfield and brownfield are the primary choice.
Solo and team-ready describe how much member workspace structure you should initialize alongside that choice.

## Minimum Viable Setup

The framework can start working before every document is fully populated.
For the first real session, these are the minimum pieces that should exist and be usable.

| Item | Why it matters | Minimum expectation |
| --- | --- | --- |
| One tool entrypoint | Gives the active AI tool the project-specific rules | `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or `.github/copilot-instructions.md` is installed in the project root as appropriate |
| `.cowork/cowork.md` | Defines the shared operating model | Present and readable |
| `.cowork/06_evolution/project_state.md` | Gives the session a shared resume index | Present with at least project type, active phase, language and visualization settings, and a short current-state summary |
| `.cowork/02_project_definition/deliverable_plan.md` | Prevents delivery scope from staying implicit | Present, even if still incomplete |
| One contributor workspace | Gives the session a personal working area without polluting shared canon | `.cowork/members/<name>/workspace/` exists or is prepared to be created during the first session |
| One live session log | Gives the session a default temporary capture point | A new `session_*.md` log is opened at session start |

These can usually wait until later:

- ADRs that have not been earned yet
- milestone and task instance documents before real execution planning starts
- delivery documents that only matter near handoff or release
- imported context files when no outside source material is being brought in

## Greenfield Adoption

Use this path when the project is new enough that the framework can establish the initial structure cleanly.

### Recommended order

1. Copy the framework files into the project root from the variant you plan to install, typically `frameworks/en/` for English or `frameworks/ko/` for Korean.
2. Decide the initial conversation language, working document language, export language, and visualization mode.
3. Initialize `project_state.md` with `Greenfield`, the likely starting phase `Define`, and a short plain-language summary of the project.
4. Initialize one contributor workspace under `.cowork/members/<name>/workspace/`.
5. Start the first AI session from the tool entrypoint.
6. Let the first session establish the initial intent, rough requirements, deliverable scope, and next-step plan.

### What the first greenfield session should achieve

- Confirm the project archetype and scope shape
- Capture the initial project purpose in the Define area
- Record at least the first working assumptions and open questions
- Open the session log and leave a clean next-start point
- Leave `project_state.md` in a resumable state for the next session

### Greenfield prompt example

```text
Read AGENTS.md and start a greenfield adoption session from the current framework state.
Set up the minimum shared state for a first working session, open a session log, and propose the next approved step.
```

## Brownfield Adoption

Use this path when the repository already contains code, docs, tickets, notes, or operational history.

The goal is not to pretend the project started from zero.
The goal is to recover where the project actually is and place only the missing minimum structure around it.

### Recommended order

1. Copy the framework files from the variant you plan to install into the project root without rearranging the existing repository first.
2. Set `project_state.md` to `Brownfield` and record the best current guess of the active phase.
3. Point the AI at the existing high-value artifacts such as the project README, active backlog, current specs, architecture notes, and recent implementation areas.
4. Let the AI perform reverse discovery to identify current intent, probable milestones, active tasks, and missing shared documents.
5. Promote only the durable findings into the framework documents and keep raw outside material separate.
6. End the session with a clear current phase, one live session log, and explicit next actions.

### What the first brownfield session should achieve

- Identify the current project phase instead of assuming Define
- Preserve good existing documents instead of rewriting them for style alone
- Capture the minimum missing shared state needed for future sessions
- Separate stable facts from imported raw context
- Leave a realistic next-step entry point instead of claiming the framework is "complete"

### Brownfield prompt example

```text
Read AGENTS.md and start a brownfield adoption session from the current framework state.
Inspect the existing repository artifacts, infer the current phase, capture only the missing shared framework state, and propose the next approved step.
```

## Solo-Default Setup

A solo project should still use the member workspace model.
That keeps the project ready to scale later without forcing team complexity too early.

Recommended minimum:

- one member profile copied from `.cowork/members/profile_template.md`
- one personal state file copied from `.cowork/members/my_state_template.md`
- one personal session log path under `.cowork/members/<name>/workspace/session_logs/`
- shared state still recorded in `.cowork/06_evolution/project_state.md`

Use the contributor workspace for temporary planning, carry-over notes, and session logs.
Promote only durable project truth into shared canonical or registry documents.

## Team-Ready Setup

If multiple contributors are active or likely soon, initialize the shared and personal boundaries early.

Recommended minimum:

- keep shared state in `.cowork/` canonical and registry documents
- create one workspace per contributor under `.cowork/members/<name>/workspace/`
- use `.cowork/members/team_board.md` when ownership or coordination needs to be visible across people
- keep proposals in `.cowork/members/<name>/proposals/` when a change needs explicit review

This lets multiple tools or people work on the same project without turning session logs into the shared source of truth.

## First Session Checklist

The first session does not need to finish the framework.
It should leave the project in a state that the next session can resume without re-discovery.

By the end of the first session, you should usually have:

- the project classified as greenfield or brownfield
- the active phase recorded in `project_state.md`
- conversation, working-document, export-language, and visualization-mode alignment recorded
- a contributor workspace identified
- a fresh session log opened
- a first pass at deliverable scope in `deliverable_plan.md`
- enough Define or recovery state to know what the next session should do

If the project is truly at day zero, that may mean only an initial intent, a handful of open questions, and a clean next step.
If the project is brownfield, that may mean a recovered phase, mapped active work, and documented gaps rather than freshly written specs.

## What Not To Do

- Do not create every template-derived document before the work actually needs it.
- Do not rewrite healthy existing brownfield documents only to match framework wording.
- Do not treat imported chats or reference dumps as canonical project truth.
- Do not put temporary notes straight into canonical documents when a session log is enough.
- Do not force team-scale structure into a small solo project beyond one clean contributor workspace.

## Signs Adoption Is Working

Adoption is going well when these are true after a small number of sessions:

- the active AI tool can resume from files instead of from chat memory
- `project_state.md` stays short, current, and readable
- important outcomes start landing in the right phase documents
- session logs hold temporary detail without becoming the only memory store
- switching tools does not require rebuilding the project context from scratch

## Related Documents

- `README.md` explains what the framework is and how the repository is distributed
- `docs/feature-flow-overview.md` explains the framework in lifecycle order
- `docs/document-map.md` shows where the major framework documents live and when they are used
