# Upgrade Manifest

> File classification table read by AI during framework upgrades

---

## Version Info

| Item | Value |
|------|------|
| Version | 1.5.1 |
| From | 1.5.0 |
| Date | 2026-09-25 |
> The `ADD` table under `## File Classification` below is still the full list for a **fresh baseline install** (including the 1.1.0 new file `state_archive.md`).
> A sequential `1.0.0 -> 1.1.0` upgrade follows the `## 1.1.0 Upgrade (from 1.0.0)` delta table.
> If you newly introduce it into a project that already contains an arbitrary `.cowork/` structure, treat that as a **migration**, not an automatic upgrade, and confirm with the Human first.

---

## Change Summary

- Carryover trigger watch restored (1.5.1) — arrived carryover triggers are raised in one line even in a session with a specified task
- Request-driven harness cleanup (1.5.0) — shorter entrypoints, task-specific context loading, authority-based approval, logs when needed, and intent-based document creation
- Field-driven improvements (1.4.0) — measurable state budgets and R1/R2 cleanup, shared-state entrypoint links, scoped verification evidence, and learning provenance

- Verification-fallout / open-question-divergence self-improvement (1.3.0) — end-to-end re-verification after a gate or invariant change (F-11), divergence-over-an-open-question check (F-12)
- Onboarding / decision integrity / enforcement self-improvement (1.2.0) — teammate onboarding runbook (F-08), decision reversal / drift detection (F-09), session discipline enforcement hooks (F-10)
- Hygiene / collaboration-model self-improvement (1.1.0) — triggered diet (R1/R2), `state_archive.md`, Carryover Backlog SSOT, Back-Port Queue, no-untriggered-accumulation, live state-document size budget, Collaboration Execution Mode (solo/team), role realization guide
- The `.cowork` structure follows the `Governance / Canonical / Registry / Instance / Template / Log-Archive` model
- The default work-breakdown axis is `Intent -> Milestone -> Task`
- Tool- and environment-dependent operating rules are managed separately in `tooling_environment_guide.md`
- Starting with `v1.1.0+`, sequential upgrades use the `From` field chain

---

## File Classification

> **ADD**: copy during a new baseline install
> **REPLACE**: not used for the baseline draft
> **MERGE**: not used for the baseline draft
> **SKIP**: not used for the baseline draft

> Because `v1.0.0` is a fresh-install baseline, every file included in the distribution starts as `ADD`.
> Beginning with later versions, file-specific `REPLACE / MERGE / SKIP` policy is introduced.

### Entry Point Files (Project Root)

| File | Class | Change |
|------|------|--------|
| `AGENTS.md` | ADD | Add the Codex / Cursor entrypoint |
| `CLAUDE.md` | ADD | Add the Claude Code entrypoint |
| `GEMINI.md` | ADD | Add the Gemini Code Assist entrypoint |
| `.github/copilot-instructions.md` | ADD | Add the GitHub Copilot entrypoint |

### `.cowork` Root

| File | Class | Change |
|------|------|--------|
| `.cowork/cowork.md` | ADD | Define framework principles and overall structure |
| `.cowork/README.md` | ADD | Explain `.cowork` usage |
| `.cowork/upgrade_manifest.md` | ADD | This baseline manifest |
| `.cowork/.upgrade/.gitkeep` | ADD | Scaffold for upgrade work |

### 01_cowork_protocol/

| File | Class | Change |
|------|------|--------|
| `.cowork/01_cowork_protocol/session_protocol.md` | ADD | Session start / in-progress / end protocol |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | ADD | Tool- and environment-dependent operations |
| `.cowork/01_cowork_protocol/communication_convention.md` | ADD | Communication rules |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | ADD | Decision authority matrix (1.1.0: Collaboration Execution Mode solo/team) |
| `.cowork/01_cowork_protocol/role_realization.md` | ADD | Role-seat realization guide (1.1.0 new, F-07) |
| `.cowork/01_cowork_protocol/onboarding_runbook.md` | ADD | Teammate onboarding runbook (1.2.0 new, F-08) |
| `.cowork/01_cowork_protocol/escalation_policy.md` | ADD | Escalation policy |
| `.cowork/01_cowork_protocol/document_role_inventory.md` | ADD | Document role inventory |
| `.cowork/01_cowork_protocol/document_change_impact_matrix.md` | ADD | Change impact matrix |

### 02_project_definition/

| File | Class | Change |
|------|------|--------|
| `.cowork/02_project_definition/intent_registry.md` | ADD | Intent index |
| `.cowork/02_project_definition/user_story_registry.md` | ADD | User Story index |
| `.cowork/02_project_definition/requirement_spec.md` | ADD | Requirement specification |
| `.cowork/02_project_definition/functional_spec.md` | ADD | Functional specification |
| `.cowork/02_project_definition/domain_glossary.md` | ADD | Domain glossary |
| `.cowork/02_project_definition/risk_register.md` | ADD | Risk register |
| `.cowork/02_project_definition/deliverable_plan.md` | ADD | Deliverable plan |
| `.cowork/02_project_definition/templates/intent_template.md` | ADD | Intent template |
| `.cowork/02_project_definition/templates/user_story_template.md` | ADD | User Story template |
| `.cowork/02_project_definition/intents/.gitkeep` | ADD | Intent instance folder scaffold |
| `.cowork/02_project_definition/user_stories/.gitkeep` | ADD | User Story instance folder scaffold |

### 03_design_artifacts/

| File | Class | Change |
|------|------|--------|
| `.cowork/03_design_artifacts/adr_registry.md` | ADD | ADR index |
| `.cowork/03_design_artifacts/domain_model.md` | ADD | Domain model |
| `.cowork/03_design_artifacts/interface_contract.md` | ADD | Interface contract |
| `.cowork/03_design_artifacts/data_model.md` | ADD | Data model |
| `.cowork/03_design_artifacts/ui_spec.md` | ADD | UI specification |
| `.cowork/03_design_artifacts/tech_stack.md` | ADD | Tech stack registry |
| `.cowork/03_design_artifacts/templates/adr_template.md` | ADD | ADR template |
| `.cowork/03_design_artifacts/adrs/.gitkeep` | ADD | ADR instance folder scaffold |

### 04_implementation/

| File | Class | Change |
|------|------|--------|
| `.cowork/04_implementation/milestone_registry.md` | ADD | Milestone index |
| `.cowork/04_implementation/task_registry.md` | ADD | Task index |
| `.cowork/04_implementation/coding_convention.md` | ADD | Coding conventions |
| `.cowork/04_implementation/review_checklist.md` | ADD | Review checklist |
| `.cowork/04_implementation/templates/milestone_template.md` | ADD | Milestone template |
| `.cowork/04_implementation/templates/task_template.md` | ADD | Task template |
| `.cowork/04_implementation/milestones/.gitkeep` | ADD | Milestone instance folder scaffold |
| `.cowork/04_implementation/tasks/.gitkeep` | ADD | Task instance folder scaffold |

### 05_verification/

| File | Class | Change |
|------|------|--------|
| `.cowork/05_verification/quality_gate.md` | ADD | Quality gate rules |
| `.cowork/05_verification/test_strategy.md` | ADD | Test strategy |
| `.cowork/05_verification/verification_evidence.md` | ADD | Verification evidence index |
| `.cowork/05_verification/test_case.md` | ADD | Test cases |

### 06_evolution/

| File | Class | Change |
|------|------|--------|
| `.cowork/06_evolution/project_state.md` | ADD | Shared state index (1.1.0: includes Carryover Backlog SSOT + R1/R2 rules) |
| `.cowork/06_evolution/state_archive.md` | ADD | Completion-narrative harvest archive (1.1.0 new, append-only) |
| `.cowork/06_evolution/knowledge_base.md` | ADD | Knowledge store |
| `.cowork/06_evolution/retrospective.md` | ADD | Retrospective (1.1.0: includes Framework Back-Port Queue) |
| `.cowork/06_evolution/templates/session_log_template.md` | ADD | Session log template |
| `.cowork/06_evolution/imported_context/.gitkeep` | ADD | External-context folder scaffold |

### 07_delivery/

| File | Class | Change |
|------|------|--------|
| `.cowork/07_delivery/export_spec.md` | ADD | Export rules |
| `.cowork/07_delivery/release_note.md` | ADD | Release notes |
| `.cowork/07_delivery/operation_guide.md` | ADD | Operation guide |
| `.cowork/07_delivery/user_manual.md` | ADD | User manual |

### members/

| File | Class | Change |
|------|------|--------|
| `.cowork/members/.gitkeep` | ADD | Members folder scaffold |
| `.cowork/members/profile_template.md` | ADD | Profile template |
| `.cowork/members/proposal_template.md` | ADD | Proposal template |
| `.cowork/members/my_state_template.md` | ADD | Personal-state template |
| `.cowork/members/team_board.md` | ADD | Team board |

---

## 1.5.1 Upgrade (from 1.5.0)

> Restores the carryover trigger-watch duty that 1.5.0 dropped together with the mandatory briefing. Arrived triggers are raised in one line even in a session with a specified task.

### 1.5.1 File Classification

| File | Class | Change |
|------|-------|--------|
| `AGENTS.md` | MERGE | Add only the one-line arrived-trigger notice to the first start-and-resume item |
| `CLAUDE.md` | MERGE | Same as above |
| `GEMINI.md` | MERGE | Same as above |
| `.github/copilot-instructions.md` | MERGE | Same as above |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | Restore the trigger-watch duty in quick execution rule 1 and the §1D carryover paragraph |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | F-02 check also covers arrived triggers |
| `.cowork/06_evolution/project_state.md` | MERGE | Add only the trigger-watch sentence to the Carryover Backlog preamble; preserve the table and project data |

> Sentence additions only. If a `REPLACE` document is customized, merge just the added sentence.

---

## 1.5.0 Upgrade (from 1.4.0)

> Simplifies harness execution while preserving existing project state, approvals, assignments, and deliverable decisions.

### 1.5.0 File Classification

| File | Class | Change |
|------|-------|--------|
| `AGENTS.md` | MERGE | Shorten shared execution rules; preserve project identity, language, and tool-specific instructions |
| `CLAUDE.md` | MERGE | Same as above |
| `GEMINI.md` | MERGE | Same as above |
| `.github/copilot-instructions.md` | MERGE | Same as above |
| `.cowork/README.md` | MERGE | Merge request-based startup examples and conditional briefing guidance |
| `.cowork/cowork.md` | REPLACE | Authority-based execution and task-specific context loading |
| `.cowork/01_cowork_protocol/communication_convention.md` | REPLACE | Simplified questions and option presentation |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | Clarified H/J/A scope and autonomy within approved work |
| `.cowork/01_cowork_protocol/escalation_policy.md` | REPLACE | Raise a concern again only on new material evidence |
| `.cowork/01_cowork_protocol/role_realization.md` | REPLACE | Remove overconfident claims about independent review |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | Quick execution rules, conditional briefing and logs, ADR criteria, and intent-based request handling |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | Tool-example placement and entrypoint synchronization rules |
| `.cowork/04_implementation/templates/task_template.md` | MERGE | Remove blanket approval wording for every Task |
| `.cowork/06_evolution/project_state.md` | MERGE | Merge task-specific reading order only; preserve active IDs, constraints, carryovers, approvals, and project data |
| `.cowork/07_delivery/export_spec.md` | MERGE | Merge ADR/source-document reconciliation rules; preserve deliverable decisions |
| `.cowork/members/my_state_template.md` | MERGE | Handle a missing log in the first session; do not replace existing personal-state files |
| `.cowork/members/proposal_template.md` | MERGE | Do not generate proposals from word mentions alone |
| `.cowork/members/team_board.md` | MERGE | Merge role-slot approval rules; preserve current assignments and task state |

> `MERGE` preserves existing project data and customizations. Treat a customized `REPLACE` document as MERGE and resolve conflicts before applying. Do not create logs or member files for a read-only request alone.

---

## 1.4.0 Upgrade (from 1.3.0)

> Sequential upgrade that updates operating rules while preserving project state and verification records.

### 1.4.0 File Classification

| File | Class | Change |
|------|------|--------|
| `.cowork/01_cowork_protocol/document_role_inventory.md` | REPLACE | Current-state and archive responsibilities |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | Session size checks, lossless state cleanup, solo links, and evidence updates |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | Stable entrypoints referencing shared state |
| `.cowork/05_verification/quality_gate.md` | REPLACE | Revision/environment applicability for gate decisions |
| `.cowork/05_verification/verification_evidence.md` | MERGE | Merge scope rules and evidence/gap columns; preserve all EV/GAP records and gate history |
| `.cowork/06_evolution/knowledge_base.md` | MERGE | Merge concise-promotion rules; preserve existing lessons and source links |
| `.cowork/06_evolution/project_state.md` | MERGE | Merge maintenance rules only; preserve active IDs, approvals, constraints, backlog, and current state |
| `.cowork/06_evolution/retrospective.md` | MERGE | Merge provenance and candidate criteria; preserve existing retrospectives and queue |
| `.cowork/06_evolution/state_archive.md` | MERGE | Merge operating rules only; preserve all archived raw text |
| `.cowork/cowork.md` | REPLACE | R1/R2 and measurable state budgets |
| `.cowork/members/my_state_template.md` | MERGE | Merge solo guidance; preserve template customization; existing member states remain untouched |
| `.github/copilot-instructions.md` | MERGE | Replace phase/milestone copies with the shared-state reference; preserve project identity and tool-specific instructions |
| `AGENTS.md` | MERGE | Replace phase/milestone copies with the shared-state reference; preserve project identity and tool-specific instructions |
| `CLAUDE.md` | MERGE | Replace phase/milestone copies with the shared-state reference; preserve project identity and tool-specific instructions |
| `GEMINI.md` | MERGE | Replace phase/milestone copies with the shared-state reference; preserve project identity and tool-specific instructions |

> MERGE preserves project data, approvals, and evidence while merging rules/fields. Do not invent missing revisions/environments for historical evidence. Treat customized REPLACE documents as MERGE. State cleanup and existing-member updates are separate from upgrade file replacement and follow the new R1/R2 with evidence checks. The repository-only audit script and field review are not included in consumer archives.

---

## 1.3.0 Upgrade (from 1.2.0)

> The delta applied on a sequential `1.2.0 → 1.3.0` upgrade. A P3 self-improvement release closing **two classes verification keeps missing**: fallout from a tightened gate landing on a different path (F-11), and documents diverging over an open question (F-12).

### 1.3.0 Change Summary

- **End-to-end re-verification after a gate or invariant change (F-11)** — new section in `quality_gate.md` plus a Gate 4 judgment row, and `session_protocol.md` §2 (write the consumer list) / §4 (session-end checklist). A change that **tightens** a verification rule, gate, invariant, or contract changes not itself but **the meaning of the existing paths through that gate**. Write the consumer list at the moment of tightening, confirm it with the end-to-end suite before closing, and register anything left unverified in the carry-over rather than staying silent.
- **Divergence over an open question (F-12)** — new section in `decision_authority_matrix.md` plus a `session_protocol.md` §6 gate trigger. An open Open Question is not a blank; it is **the place where two documents harden around different answers**. Because neither violates an ADR, the F-09 reversal check never catches it — so at phase transitions, before releases, and immediately before work starts in that area, compare whether the referencing documents are writing the same answer.

### 1.3.0 File Classification

| File | Class | Change |
|------|-------|--------|
| `.cowork/05_verification/quality_gate.md` | REPLACE | Rule document. Adds the End-To-End Re-Verification (F-11) section plus one Gate 4 judgment row |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | Rule document. Adds the Divergence Over An Open Question (F-12) section plus one authority row |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | Rule document. §2 F-11 consumer list, §4 session-end F-11 item, §6 gate F-12 trigger |

> `REPLACE` entries are framework-owned rule documents. If an instance has customized one, treat it as MERGE and apply after Human approval.

---

## 1.2.0 Upgrade (from 1.1.0)

> The delta applied on a sequential `1.1.0 -> 1.2.0` upgrade. A P2 self-improvement release that adds the onboarding, decision-integrity, and enforcement layers.

### 1.2.0 Change Summary

- **Teammate onboarding runbook (F-08)** — new `onboarding_runbook.md`. The procedure for a person joining a seat (seat selection -> mode transition -> assignment -> handoff). Turns the `solo` seat definition into a prepaid onboarding path.
- **Decision reversal & drift detection (F-09)** — new section in `decision_authority_matrix.md` + a trigger in `session_protocol.md` §6. Catches ungrounded reversals / drift by comparing Accepted ADRs vs code / documents, with a decision-cohort review principle.
- **Session discipline enforcement hooks (F-10)** — new section in `tooling_environment_guide.md`. Mechanically enforce the session-start self-checks through tool / git / CI hooks (easing the reliance on voluntary compliance).

### 1.2.0 File Classification

| File | Class | Change |
|------|------|--------|
| `.cowork/01_cowork_protocol/onboarding_runbook.md` | ADD | New runbook. Add if absent |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | Rule document. Add the §Decision Reversal & Drift Detection (F-09) section |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | Rule document. Add the §Session Discipline Enforcement (F-10) section |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | Rule document. Reflect the F-09 gate trigger, the F-10 hook note, and the 1B-3 runbook pointer |
| `.cowork/cowork.md` | REPLACE | Rule document. Register `onboarding_runbook.md` in the governance map |
| `.cowork/01_cowork_protocol/document_role_inventory.md` | REPLACE | Rule document. Register `onboarding_runbook.md` |

> `REPLACE` items are framework-owned rule documents. If an instance has customized such a document, treat it as MERGE and apply only after Human approval.

---

## 1.1.0 Upgrade (from 1.0.0)

> The delta applied on a sequential `1.0.0 -> 1.1.0` upgrade. A self-improvement release that promotes state-document hygiene rules proven in instance operation into framework defaults.

### 1.1.0 Change Summary

**P0 — State-document hygiene (back-ported from instance-validated learning)**
- **Triggered diet rules (R1/R2)** — replace the triggerless "compress when it gets long" with completion-narrative harvest (last 3 sessions + move on `wrap up`) and table-cell overgrowth split.
- **`state_archive.md` new** — the append-only target artifact of the R1 harvest (Log/Archive role).
- **Carryover Backlog SSOT table** — gather scattered carry-overs into a single table in `project_state.md`, include it in every session's briefing (§1D), and have the AI actively watch triggers.
- **Framework Back-Port Queue** — add a queue in `retrospective.md` §4 that flows instance learning back into the framework (the execution mechanism of principle #6).

**P1 — New hygiene / collaboration-model design**
- **No untriggered accumulation (F-04)** — promoted to a general principle in `cowork.md` invariant rules.
- **Live state-document size budget (F-05)** — the health metric is the absolute size of the always-loaded state documents, not the docs-to-code ratio. Session-start self-check in `cowork.md` + `session_protocol.md`.
- **Collaboration Execution Mode solo/team (F-06)** — separate seat definitions from per-session bookkeeping. `project_state.md` field + `decision_authority_matrix.md` definition.
- **Role realization guide (F-07)** — new `role_realization.md`. Criteria for realizing seats as person / AI persona / independent sub-agent, and the error-decorrelation rationale for independent execution.

### 1.1.0 File Classification

| File | Class | Change |
|------|------|--------|
| `.cowork/06_evolution/state_archive.md` | ADD | New artifact. Add if absent in the target project; SKIP if already present (preserve the instance's own adoption) |
| `.cowork/01_cowork_protocol/role_realization.md` | ADD | New guide. Add if absent |
| `.cowork/06_evolution/project_state.md` | MERGE | Preserve project data. Merge only the `Carryover Backlog` section, the `Collaboration Execution Mode` field, and the `Writing / Maintenance Rules` (R1/R2); add `state_archive` to the loading guide |
| `.cowork/06_evolution/retrospective.md` | MERGE | Preserve existing retrospectives. Expand-merge §4 into `Framework Back-Port Queue` |
| `.cowork/cowork.md` | REPLACE | Rule document. Reflect F-04 invariant rule, F-05 size budget, F-06 mode, and the governance map |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | Rule document. Reflect R1/R2, harvest, backlog briefing, back-port, F-05 self-check, and F-06 mode check |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | Rule document. Add the Collaboration Execution Mode (solo/team) section |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | Rule document. Add one row on role-realization placement principle |
| `.cowork/01_cowork_protocol/document_role_inventory.md` | REPLACE | Rule document. Register `state_archive.md` / `role_realization.md` + R1/R2 operating note |

> `MERGE` items do not overwrite data the project filled in. On conflict or ambiguity, apply only after Human approval (§`session_protocol.md` 16).

---

## Application Notes

- In `v1.0.0`, the framework does not inherit the old `cowork-context-template` release chain, legacy `From` inference, or earlier zip naming.
- Starting with `v1.1.0+`, enforce the `From = previous version` rule on top of this baseline.
- The English variant under `frameworks/en` is published on the same release line as the Korean baseline under `frameworks/ko`.

---

<!-- CUMULATIVE:START -->
## Cumulative Change Index (Auto-generated)

> Auto-updated during release to support sequential upgrades.

| Version | Key Change Summary |
|---------|--------------------|
| 1.0.0 | First official baseline of the `cowork-context-framework` repository |
| 1.1.0 | Hygiene / collaboration-model self-improvement (1.1.0) — triggered diet (R1/R2), `state_archive.md`, Carryover Backlog SSOT, Back-Port Queue, no-untriggered-accumulation, live state-document size budget, Collaboration Execution Mode (solo/team), role realization guide |
| 1.2.0 | Onboarding / decision integrity / enforcement self-improvement (1.2.0) — teammate onboarding runbook (F-08), decision reversal / drift detection (F-09), session discipline enforcement hooks (F-10) |
| 1.3.0 | Verification-fallout / open-question-divergence self-improvement (1.3.0) — end-to-end re-verification after a gate or invariant change (F-11), divergence-over-an-open-question check (F-12) |
| 1.4.0 | Field-driven improvements (1.4.0) — measurable state budgets and R1/R2 cleanup, shared-state entrypoint links, scoped verification evidence, and learning provenance |
| 1.5.0 | Request-driven harness cleanup (1.5.0) — shorter entrypoints, task-specific context loading, authority-based approval, logs when needed, and intent-based document creation |
| 1.5.1 | Carryover trigger watch restored (1.5.1) — arrived carryover triggers are raised in one line even in a session with a specified task |
<!-- CUMULATIVE:END -->
