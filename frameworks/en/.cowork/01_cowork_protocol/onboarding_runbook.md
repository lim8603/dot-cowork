# Teammate Onboarding Runbook — F-08

> The procedure to run when a person joins a role seat. This is the detailed execution version of `session_protocol.md` 1B-3 (matching when adding a member), and it fills a seat definition (`decision_authority_matrix.md` §Collaboration Execution Mode) with a real person.

---

## Purpose

The seat definitions kept while operating in `solo` mode are the **blueprint of the chairs future teammates will sit in**. When a person joins, this runbook settles the onboarding cost — because the seat is already defined, you just "plug a person into an existing org chart."

---

## Preconditions

- Identify the joining person's name / identifier, desired ownership area, and capability.
- Confirm the target seat is defined in `decision_authority_matrix.md` (if not, define the seat first — Human approval).

## Onboarding Procedure (Fixed Order)

1. **Seat selection** — pick the seat (Role-ID) to assign from the seat definitions in `decision_authority_matrix.md`. If splitting a combined seat, confirm the seat split first.
2. **Collaboration Execution Mode transition** — `solo -> team`. Change the `Collaboration Execution Mode` field in `project_state.md` to `team` (the transition is a Human-approved matter, `decision_authority_matrix.md` §Collaboration Execution Mode §Mode Transition).
3. **Create / update team_board.md** — if absent, create `members/team_board.md` and assign the person to the seat.
4. **Reflect Task assignees** — bulk-update the assignee of every Task linked to that seat to the new person (`task_registry.md` + active `tasks/TASK-*.md`).
5. **Create member folder** — under `members/<name>/`, create `profile.md` (<- `profile_template.md`), `workspace/my_state.md` (<- `my_state_template.md`), `workspace/session_logs/.gitkeep`, and `proposals/`.
6. **Grant authority** — decide `Master` (merge authority over shared areas) or `Member`, and apply the H/J/A of `decision_authority_matrix.md` per seat.
7. **Update role realization** — per `role_realization.md`, switch the executor of that seat to "person" (hand off from the prior AI persona / independent sub-agent execution). For a verification seat, agree on whether human review and independent sub-agent verification run in parallel.
8. **Handoff briefing** — hand over the current state of the seat's ownership area: `project_state.md` (current phase, active Tasks, Carryover Backlog) + the registry / canonical documents related to that seat + the latest session logs. State the open decisions and the items waiting on triggers explicitly.

## After Onboarding

- The new person's first session receives the `session_protocol.md` §1D briefing in the Member view.
- Even after a person sits in the seat, the seat definition is kept — on departure, revert to `team -> solo` but do not archive the definition (`decision_authority_matrix.md` §Mode Transition).
- If the onboarding itself is worth keeping as a retrospective subject, record it in `retrospective.md`, and treat procedure improvements as §4 Framework Back-Port Queue candidates.

---

## Related Documents

- `session_protocol.md` 1B-3 (matching when adding a member), 1B-1 / 1B-2 (team setup)
- `decision_authority_matrix.md` §Collaboration Execution Mode (F-06)
- `role_realization.md` (F-07)
- `members/profile_template.md` · `members/my_state_template.md` · `members/team_board.md`
