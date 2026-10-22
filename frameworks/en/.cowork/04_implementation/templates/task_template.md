# Task Template

> Work-breakdown specification: apply approval rules to H/J decisions and report A-level work afterward

---

## Template Usage Rules

- This file is a copy source. When you create a real Task document, replace `TASK-000`, `INT-000`, `MS-000`, `US-000`, and `ADR-000` with real IDs.
- For unrelated documents, do not keep placeholders. Use `None` or mark them not applicable.
- Keep only the approved real work-plan steps and delete unused step and checklist rows.
- Remove `<!-- -->` guide comments after drafting, and keep only real records in the execution log.
- Keep `Owner`, `Status`, `Last Updated`, and `Next Action` aligned with `task_registry.md` and the active Task summary in `project_state.md`.

---

## Task ID
`TASK-000`

## Related Documents
| Item | Reference |
|------|-----------|
| Related Intent | `INT-000` |
| Related Milestone | `MS-000` |
| Related User Story | `US-000` |
| Related ADR | `ADR-000` (if applicable) |

---

## Sync Fields

| Item | Value |
|------|------|
| Owner | Human / AI / Role-* / (Role-* assignee) |
| Status | Planned / In Progress / Review / Done |
| Last Updated | YYYY-MM-DD |
| Next Action | One-line summary or None |

> Keep these 4 fields aligned in meaning with the registry and the active Task summary in `project_state.md`.

---

## Goal
<!-- What will be achieved when this task is complete -->

## Work Steps (Step, S)
<!-- Use only when the Task cannot finish in one session and is hard to split further because it shares one goal and completion criteria. Delete this section for a Task that finishes in one go. -->

| Step | Goal | Exit State (verifiable) | Status |
|------|------|-------------------------|--------|
| S1 | | | Planned |
| S2 | | | Planned |

- `Status`: `Planned` / `In Progress` / `Done` / `Dropped` (leave the reason in `Goal`)
- Steps run in order. If they are independent and can run in parallel, split them into separate Tasks.
- Each step ends in a state that is safe to pause or hand off (build and tests pass, etc.), written as its `Exit State`.
- Append steps discovered during work at the end. Do not reuse or renumber step numbers.
- Refer to a step from other documents as `TASK-000/S2`, and start the sync field `Next Action` with the current step (`S2 — ...`).

## Work Plan

Written by the AI and executed after Human approval. When steps (S) are used, detail the checklist only for the current step.

- [ ]
- [ ]

## Items Requiring Human Confirmation
<!-- Points that require Human judgment during this task -->
-

## Definition Of Done
- [ ] Implementation complete
- [ ] Tests passed
- [ ] Documentation updated
- [ ] Human review complete

## Estimated Effort
<!-- S(< 1h) / M(1-4h) / L(4h-1d) / XL(> 1d) -->

---

## Execution Log
<!-- Record actual work while executing -->

| Time | Work | Result | Notes |
|------|------|--------|------|
| | | | |
