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
| Collaboration Execution Mode | |
| Current Phase | |
| Active Intent | |
| Active Milestone | |
| Active Task | |
| Status | |
| Conversation Language | |
| Working Document Language | |
| Official Deliverable Language | |
| Last Updated | |
| Last Updated By | |
| Reference Session Log | |

- `Project Type`: `Greenfield` / `Brownfield`
- `Team Setup`: `Solo` / `Established Team` / `Role-Slot Planning`
- `Team Size`: `Solo` / `Small (2 to 5)` / `Medium (6 to 15)` / `Large (16+)`
- `Collaboration Mode`: `Inactive (Setup)` / `Active (Tasks Assigned)`
- `Collaboration Execution Mode`: `solo` (keep seat definitions + skip per-role bookkeeping) / `team` (run all per-role bookkeeping) — details in `decision_authority_matrix.md` §Collaboration Execution Mode (F-06)
- `Current Phase`: `Define` / `Design` / `Build` / `Verify` / `Evolve` / `Deliver`
- `Status`: `Green` / `Yellow` / `Red`
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

## Carryover Backlog

> **The single SSOT for carry-overs.** Gather scattered carry-over notes (Next Starting Point, my_state, session logs) into this one set of tables. Include it in every session's briefing (§1D), and update it when items are added or resolved and on `wrap up`. Keep detailed background in the source session log. Watching carry-over triggers is the AI's responsibility — before the Human hunts them down and asks, the AI cross-checks this table during the briefing and during work and raises them on its own.

**Ready to start on request (no trigger)**

| # | Item | Detail | Source |
|---|------|--------|--------|
| None | - | - | - |

**Trigger-waiting (absorbed by the session where the trigger arrives)**

| # | Item | Trigger | Source |
|---|------|---------|--------|
| None | - | - | - |

**Low-severity / recorded (only on request)**

| # | Item | Source |
|---|------|--------|
| None | - | - |

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
- Do not load `templates/`, `imported_context/`, `06_evolution/state_archive.md`, or old session logs by default.
- `06_evolution/state_archive.md` is an archive (Log/Archive) of past-session completion narratives and handoff history. This document's summary points to it, and you open the relevant `#NNN harvest` section only when you need a specific past-session context.
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
- **Completion-narrative harvest rule (R1 — triggered diet).** The old rule ("compress when it gets long") has no trigger, so completion narratives easily accumulate every session. -> **Keep the completion narratives (the ✅-done and handoff blocks) of `Next Starting Point` and `AI Handoff Memo` in-body for the last N sessions only (default 3).** On `wrap up`, move older completion narratives **as raw text (append-only)** into [state_archive.md](state_archive.md) `#NNN harvest`, and leave only a one-line pointer in the body. (Details: `session_protocol.md` §Shared State Index Management.)
- **Table-cell overgrowth split rule (R2).** When a table cell such as `Active Task Summary` swells with multiple sessions of narrative, split the detail into `tasks/TASK-*.md` (in progress) or a session-log pointer (Done + no longer affecting context) and keep only the resume essentials in the cell. **However, keep an item in the cell even when it is large if it still affects the current work's context** (no churn). The cleanup gate is "does it no longer affect the current-work context?".
- Keep `Recently Changed Files / Deliverables`, `Items Requiring Human Confirmation`, and `Key Risks` explicitly marked as `None` when there are no items.
