# Project State

> Shared state index: a summary of the current project state that the next AI session reads first

---

## Current State Summary

### Core Fields

| Item | Value |
|------|------|
| Project | |
| Project Type | |
| Team Setup | |
| Team Size | |
| Collaboration Mode | |
| Current Phase | |
| Active Intent | |
| Active Milestone | |
| Active Task | |
| Status | |
| Conversation Language | |
| Working Document Language | |
| Official Deliverable Language | |
| Visualization Mode | |
| Last Updated | |
| Last Updated By | |
| Reference Session Log | |

- `Project Type`: `Greenfield` / `Brownfield`
- `Team Setup`: `Solo` / `Established Team` / `Role-Slot Planning`
- `Team Size`: `Solo` / `Small (2 to 5)` / `Medium (6 to 15)` / `Large (16+)`
- `Collaboration Mode`: `Inactive (Setup)` / `Active (Tasks Assigned)`
- `Current Phase`: `Define` / `Design` / `Build` / `Verify` / `Evolve` / `Deliver`
- `Status`: `Green` / `Yellow` / `Red`
- `Visualization Mode`: `Disabled` / `Mermaid` (default for a new project is `Disabled`)
- For `Active Intent`, `Active Milestone`, and `Active Task`, write the actual current ID or `None`.
- `Last Updated By`: `Human` / `AI`
- `Reference Session Log`: latest `session_YYYY-MM-DD_NNN.md`

### One-Line Status
> Keep the current project state in one or two sentences only.

- Example: `Requirements draft approved, design elaboration in progress.`

### Current Workstreams
> Keep only the core workstreams within 3 to 5 lines.

- None

---

## Active Task Summary
> Leave only 1 to 3 Tasks that should resume immediately. Keep detailed background in registry documents, Task documents, or session logs.

| Task ID | Title | Owner | Status | Last Updated | Next Action |
|---------|-------|-------|--------|-------------|------------|
| None | - | - | - | - | - |

- `Status` values: `Planned` / `In Progress` / `Review` / `Done`
- Keep `Owner`, `Status`, `Last Updated`, and `Next Action` aligned in meaning with `task_registry.md` / `tasks/TASK-*.md`.

---

## Next Starting Point
> Leave only 1 to 3 priority actions so the next session can start immediately.

1. None

---

## AI Handoff Memo
> Keep only the core information the next session needs to continue, usually within 2 to 5 lines.

- None

---

## Items Requiring Human Confirmation
> Keep only open items. Leave resolved history in the session log or the related source documents.

| ID | Item | Priority | Related Document | Status |
|----|------|---------|------------------|--------|
| None | - | - | - | - |

- `Priority`: `High` / `Medium` / `Low`
- `Status`: `Open` / `Resolved` / `Deferred`

---

## Key Risks / Cautions
> Keep this focused on risks that currently matter. Leave closed risk history in separate source documents.

| ID | Content | Response Status | Notes |
|----|---------|-----------------|------|
| None | - | - | - |

- `Response Status`: `Open` / `Mitigating` / `Closed`

---

## Recently Approved Decisions

| ID | Decision | Source Document | Date |
|----|----------|----------------|------|
| None | - | - | - |

---

## Recently Changed Files / Deliverables
> Keep only recent high-signal changes here and let the session log keep the long history.

| File | Change Summary | Related Work |
|------|----------------|-------------|
| None | - | - |

---

## Active Deliverables
> Keep only currently active items here. Look up the relevant registry first, then open detail documents only when needed.

| Type | ID | Title | Status | Notes |
|------|----|-------|--------|------|
| None | - | - | - | - |

- `Intent`: `Draft` / `Approved` / `Superseded` / `Split` / `Closed`
- `Milestone`: `Planned` / `In Progress` / `Review` / `Done`
- `User Story`: `Draft` / `Approved` / `Implemented`
- `Task`: `Planned` / `In Progress` / `Review` / `Done`

---

## Context Loading Guide

### Core Rules

- Always load this document (`project_state.md`), `02_project_definition/deliverable_plan.md`, `members/<name>/workspace/my_state.md` (same path even in solo projects), and the latest session log.
- In team projects, load `members/team_board.md` as well.
- Read the registries related to the current phase first, then add needed canonical documents and detail documents.
- Do not load `templates/`, `imported_context/`, or old session logs by default.
- Rule documents such as `cowork.md` and `session_protocol.md` should be learned once in the first session and re-opened only when the relevant sections are needed.
- Imported context should be used only as supporting evidence after needed facts are extracted into source documents.

### Recommended Load Order

1. `project_state.md` -> `deliverable_plan.md`
2. `members/<name>/workspace/my_state.md` + latest session log
3. registries / canonical documents for the current phase
4. required detail documents (`INT-*`, `MS-*`, `TASK-*`, `ADR-*`)

### Phase Loading Map

| Phase | Load Immediately | Refer When Needed |
|-------|------------------|-------------------|
| **Define** | `02_project_definition/intent_registry.md`, `02_project_definition/user_story_registry.md`, `02_project_definition/requirement_spec.md`, `02_project_definition/functional_spec.md`, `02_project_definition/risk_register.md`, `02_project_definition/deliverable_plan.md` | `02_project_definition/intents/INT-*.md`, `02_project_definition/user_stories/US-*.md`, `02_project_definition/domain_glossary.md` |
| **Design** | `03_design_artifacts/adr_registry.md`, `03_design_artifacts/domain_model.md`, `03_design_artifacts/interface_contract.md`, `03_design_artifacts/data_model.md`, `03_design_artifacts/tech_stack.md` | `03_design_artifacts/adrs/ADR-*.md`, `02_project_definition/requirement_spec.md`, `02_project_definition/functional_spec.md`, `03_design_artifacts/ui_spec.md` |
| **Build** | `04_implementation/milestone_registry.md`, `04_implementation/task_registry.md`, `04_implementation/coding_convention.md`, `04_implementation/review_checklist.md` | `04_implementation/milestones/MS-*.md`, `04_implementation/tasks/TASK-*.md`, `03_design_artifacts/interface_contract.md`, `03_design_artifacts/data_model.md` |
| **Verify** | `05_verification/test_strategy.md`, `05_verification/test_case.md`, `05_verification/verification_evidence.md`, `04_implementation/task_registry.md`, `05_verification/quality_gate.md` | `04_implementation/tasks/TASK-*.md`, `02_project_definition/requirement_spec.md`, `03_design_artifacts/*` |
| **Evolve** | `06_evolution/*` | any project document as needed |
| **Deliver** | `07_delivery/*`, `05_verification/quality_gate.md`, `05_verification/verification_evidence.md` | `02_project_definition/deliverable_plan.md`, any project document |

---

## Writing / Maintenance Rules

- This document is a shared resume index, not a replacement for the session log.
- In tables and summary sections, write only the current real values, or `None` when a value does not exist.
- `INT-*`, `MS-*`, and `TASK-*` notation is only format guidance. Replace it immediately with the real value once it exists.
- Keep `One-Line Status`, `Current Workstreams`, `Next Starting Point`, and `AI Handoff Memo` within 3 to 5 lines in normal use.
- Do not repeat the same fact across multiple sections. Summarize it once and connect it through the related ID or document path.
- Do not copy raw notes, unconfirmed hypotheses, or one-off debugging traces from the session log into this document.
- If a section grows too long, compress it into a summary first and point readers to the relevant registry, detail document, session log, or canonical document for the deeper context.
- Keep `Recently Changed Files / Deliverables`, `Items Requiring Human Confirmation`, and `Key Risks` explicitly marked as `None` when there are no items.
