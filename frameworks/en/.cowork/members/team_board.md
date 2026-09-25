# Team Board

> Shared board of roles and Task assignment for the whole team: who is doing what, and what the dependencies are

---

## Purpose

This board lets the entire team share who (or which role) owns each Task
and what the current progress and dependencies look like.

- `project_state.md` summarizes project-level state
- this document tracks **member-level assignment and progress**

---

## Team Setup Mode

- [ ] **Established Team**: real team members already exist -> assign roles directly
- [ ] **Role-Slot Planning**: team members are not finalized -> the AI proposes role slots and Task assignments -> register them after Human approval -> later match real members to those roles

> Even in Established Team mode, if the AI judges that more people are needed based on workload analysis,
> it may propose additional virtual role slots. Register them only after Human approval.

---

## Role Registry

| Role ID | Role Name | Required Skill | Ownership Area | Assigned Member | Status |
|---------|-----------|----------------|----------------|-----------------|--------|
| Role-A | | | | (unassigned) / name | unassigned / assigned |

> **Role-Slot Planning**: the AI proposes role slots based on tech-stack and feature analysis; register them after Human approval.
> **Established Team**: assign roles directly to the real team members who fit them.

---

## Active Task Assignment

| Task ID | Title | Parent Milestone | Assigned Role | Assignee | Status | Dependency | Start Date | Notes |
|---------|-------|------------------|---------------|----------|--------|-----------|------------|------|
| TASK-* | | MS-* | Role-A | (role assignee auto-filled) | Planned / In Progress / Review / Done | | | |

---

## Dependency Summary

<!-- Example: TASK-003 can start only after TASK-001 and TASK-002 are complete -->

---

## Role Matching History

| Date | Change | Before | After | Reason |
|------|--------|--------|-------|--------|
| | Role-A assigned | (unassigned) | name | |

---

## Workload Analysis Notes

<!-- Space where the AI records workload analysis, including the basis for additional-role proposals -->

---

## Task Distribution Readiness

In team projects, the right time to distribute work across people or roles is
**after architecture and module boundaries are confirmed**.

### Preconditions

| Condition | Basis | How To Check |
|-----------|------|--------------|
| Intent approved | project goal and scope are aligned | `INT-NNN` status: Approved |
| Architecture ADR approved | module boundaries, layering, and communication approach are confirmed | related ADR status: Approved |
| Module / feature decomposition complete | independently assignable work units are identified | `task_registry.md` contains the Task list |
| Interface contracts defined | dependencies and interfaces between modules are clear | `interface_contract.md` is at least in draft state |

### Task Distribution By Phase

| Phase | Distribution Readiness | Explanation |
|-------|------------------------|-------------|
| **Define** | Limited | Requirement collection can be split by area, but the overall direction must be aligned first |
| **Design** | Partial | Parallel detailed design is possible after architecture is confirmed |
| **Build** | **Best timing** | Independent implementation becomes possible once modules and interface contracts are defined |
| **Verify** | Available | Tests can be run in parallel by feature or module |
| **Deliver** | Available | Ownership can be split by deliverable |

### AI Automatic Judgment Criteria

The AI judges the project as `ready for task distribution` and informs the Human when **all** of the following are true:

1. at least one architecture ADR is in `Approved` state
2. `task_registry.md` contains 2 or more independent Tasks
3. the dependency relationship of each Task is written down

> **Solo project**: this section does not apply right now, but it can still be referenced if the team expands later.

---

## Progress Rules

- When an assignee changes Task status, update this document and personal `my_state.md` together.
- At session start, the AI reads this board to understand team-wide progress.
- Changing assignees, adding Tasks, or splitting Tasks requires Master approval.
- When role matching changes, the assignee for every Task under that role is updated together.
