# Changelog

All notable changes to `cowork-context-framework` will be documented in this file.

The project follows semantic versioning.

## [1.5.0] - 2026-09-25

### Changed
- Shortened Korean and English tool entrypoints to prioritize the current request, task-specific loading, and H/J/A authority boundaries.
- Made briefing, onboarding, session logs, and handoff records conditional on the work instead of mandatory at every session start.
- Replaced word-triggered ADR, proposal, deliverable, and upgrade actions with intent-based routing and ADR impact criteria.
- Moved practical loading guidance toward the front of `project_state.md` and the session protocol; aligned shared docs and softened unsupported claims about context detection and independent reviewers.
- Clarified root maintenance entrypoints so routine edits do not trigger release preparation.

## [1.4.0] - 2026-09-20

### Changed
- Tightened R1/R2 to keep current values and short completion summaries while preserving constraints and raw evidence in existing detail documents or archives. Added configurable default live-state warnings of 24 KiB shared / 12 KiB per member and an 800-character row/paragraph review trigger.
- Replaced phase/milestone copies in all Korean and English tool entrypoints with a shared-state reference.
- Bound verification evidence to revisions, environments, scenarios, and executors; record deferred coverage and update evidence indexes when results change.
- Shortened knowledge promotion to applicability, reusable rule, and evidence; require provenance and observed results for framework back-port candidates.

### Added
- Read-only `scripts/audit-cowork-state.ps1` for installed-project state size and long-line warnings, with an optional `-Check` exit status.
- Field review of dot-probe and dot-tools in `docs/field-review-2026-09.md`, including limits and follow-up validation criteria. Includes the 1.3.0 → 1.4.0 upgrade delta with MERGE handling for project-owned data and entrypoints.

## [1.3.0] - 2026-07-25

Third self-improvement release (P3). Closes two classes of failure that the existing checklists never ask about: fallout from a tightened gate landing somewhere other than the tightening code, and documents hardening around different answers to a still-open question. Both were promoted from real instance operation. Applies to `frameworks/ko` and `frameworks/en` on the same release line.

### Added
- End-To-End Re-Verification After A Gate Or Invariant Change section in `quality_gate.md` (F-11) — a change that **tightens** a verification rule, gate, invariant, or contract does not only change itself; it changes the meaning of the existing paths that already ran through that gate. The rule: write the consumer list at the moment of tightening, confirm it with the end-to-end suite before the session closes, and never pass over unverified consumers silently. Wired into `session_protocol.md` §2 / §4 and the Gate 4 judgment table.
- Divergence Over An Open Question section in `decision_authority_matrix.md` (F-12) — where F-09 watches drift in what *was* decided, this watches divergence over what was *not*. An open Open Question is a place where two documents each fill in a provisional answer and harden separately; because neither violates an ADR, the reversal check cannot see it. Triggered at phase transitions, before releases, and immediately before implementation starts in the affected area; wired into `session_protocol.md` §6.

### Changed
- `session_protocol.md` §2 (in-progress rules), §4 (session-end checklist), and §6 (automatic quality gate check) carry the F-11 and F-12 triggers.

## [1.2.0] - 2026-07-23

Second self-improvement release (P2). Adds the onboarding, decision-integrity, and enforcement mechanisms that 1.1.0 left open. Applies to `frameworks/ko` and `frameworks/en` on the same release line.

### Added
- `01_cowork_protocol/onboarding_runbook.md` (F-08) — the detailed procedure for bringing a human into a role seat: seat selection → `solo → team` mode switch → team_board assignment → Task reassignment → member folder / permissions / execution mode → handoff briefing. Turns the `solo`-mode seat definitions into a prepaid onboarding path.
- Decision Reversal & Drift Detection section in `decision_authority_matrix.md` (F-09) — a triggered check (on phase transition and before release) that compares Accepted ADRs against code / `tech_stack.md` / design canon to catch un-ADR'd reversals and drift, plus a decision-cohort review principle; wired into `session_protocol.md` §6.
- Session Discipline Enforcement (Enforcement Hooks) section in `tooling_environment_guide.md` (F-10) — which self-checks (session-log creation, live-state size budget, carryover-table-in-briefing, schema drift, commit convention) can be mechanically enforced via tool/git/CI hooks, so discipline no longer depends only on the AI voluntarily complying; referenced from the `session_protocol.md` session-start checklist.

### Changed
- `cowork.md` Governance Map and `document_role_inventory.md` register `onboarding_runbook.md`.
- `session_protocol.md` 1B-3 (teammate matching) points to the onboarding runbook; the session-start checklist notes hook-enforceability of the self-checks.

## [1.1.0] - 2026-07-23

First self-improvement release: hygiene and collaboration-model rules proven in real instance operation are promoted into the framework baseline. Applies to `frameworks/ko` and `frameworks/en` (release line kept in sync).

### Added
- `06_evolution/state_archive.md` (F-03) — new append-only Log/Archive artifact that harvested completion narratives are moved into, keeping `project_state.md` / `my_state.md` lean without losing history.
- Carryover Backlog single-SSOT table in `project_state.md` (F-02) — collects scattered carryover notes into one table, included in every session briefing (§1D), with the AI actively watching triggers rather than waiting to be asked.
- Framework Back-Port Queue in `retrospective.md` §4 (F-00) — a triggered pipeline that routes instance-discovered rules/patterns back into the framework (execution mechanism for principle #6), so later projects don't rediscover them.
- `01_cowork_protocol/role_realization.md` (F-07) — guide for how a role seat is executed (human / AI persona / independent subagent), why independent subagents decorrelate errors, and when to materialize a seat (especially adversarial review).
- Collaboration Execution Mode `solo | team` (F-06) — a `project_state.md` field, defined in `decision_authority_matrix.md`, that separates *seat definition* from per-session *bookkeeping*: `solo` keeps seat definitions as onboarding scaffold while dropping role bookkeeping.

### Changed
- Replaced the untriggered "compress when long" rule with triggered diet rules R1 (harvest completion narrative beyond the last 3 sessions on `마무리`) and R2 (split bloated table cells, but keep cells that still affect current work — no churn). Reflected in `session_protocol.md`, `project_state.md`, and `document_role_inventory.md` (F-01).
- Added the "no untriggered accumulation" invariant to `cowork.md` (F-04): every accumulating loaded document must declare a harvest/split trigger.
- Added the live-state-document size budget to `cowork.md` + a session-start self-check in `session_protocol.md` (F-05): the health metric is the absolute size of always-loaded state docs, not a doc:code ratio.
- `document_role_inventory.md` now registers `state_archive.md` (Log/Archive) and `role_realization.md`, and documents the R1/R2 operating rules.
- `upgrade_manifest.md` bumped to `Version = 1.1.0`, `From = 1.0.0`, with a `1.0.0 → 1.1.0` delta table (new files=ADD/SKIP, project_state & retrospective=MERGE, governance docs=REPLACE).

## [1.0.0] - 2026-03-20

- Initial clean baseline for the new `cowork-context-framework` repository.
- Source root moved to `frameworks/ko`.
- Published English install variant aligned under `frameworks/en` on the same release line.
- Upgrade manifest baseline reset to `Version = 1.0.0`, `From = 0.0.0`.
- Archive name reset to `cowork-context-framework-kr.zip`.
