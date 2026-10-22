# Task Registry

> Task index and lightweight WBS for registering and tracking real execution units

---

## Purpose

- see active Tasks and dependencies quickly
- use this as the base index for the WBS
- expand Tasks that need detailed execution plans into `tasks/TASK-*.md`

---

## Recording Rules

- Do not leave dummy IDs such as `TASK-000` in the registry.
- When there are no items, do not keep example rows in the table; leave only `No registered Task yet`.
- Record only real operating values in `Owner`, `Status`, and `Dependency`.
- Fill `Document Path` only when `tasks/TASK-*.md` exists. It may stay blank in lightweight operation.

---

## Minimum Sync Rules

- Keep the active Task summary across `task_registry.md`, `tasks/TASK-*.md`, and `project_state.md` aligned at least for `Owner`, `Status`, `Last Updated`, and `Next Action`.
- Keep detailed execution context, decision basis, and work logs in `tasks/TASK-*.md` or the session log; keep only the core resume information in the registry.
- Summarize only currently active Tasks or Tasks that should resume immediately in the next session inside `project_state.md`.

---

## Task List

| Task ID | Title | Related Milestone | Related Intent | Related User Story | Owner | Status | Last Updated | Next Action | Dependency | Document Path | Notes |
|---------|-------|------------------|----------------|--------------------|-------|--------|-------------|------------|-----------|---------------|------|

> No registered Task yet

- `Owner`: `Human` / `AI` / `Role-*` / `(Role-* assignee)`
- `Status`: `Planned` / `In Progress` / `Review` / `Done`
- `Last Updated`: `YYYY-MM-DD`
- `Next Action`: a one-line instruction that the next session can resume immediately
- `Dependency`: actual linked `TASK-*` value or `None`

---

## Lightweight Operation Rules

- Short work can be managed only with this document and the session log.
- Long-running work, work with many approval points, or work that is likely to be resumed should get a `tasks/TASK-*.md` file.
- In `deliverable_plan.md` and `export_spec.md`, use this document first as the WBS source.
- Keep `Next Action` as a one-line instruction the next session can pick up immediately; move multi-step detailed plans into the detail Task document.
- Split a Task that cannot finish in one session and is hard to split further into `Work Steps (Step, S)` in its detail document. Keep the step list only in the Task document, and start the registry `Next Action` with the current step (`S2 — ...`).
- Do not pile work pushed out of scope, or work waiting on a precondition, into the Task document; register it in the `project_state.md` carryover backlog as `B*` / `T*`.
