# Document Role Inventory

> At-a-glance inventory of every Markdown document in `.cowork`, including role, operating style, and accumulation scale

---

> When you change content here, also check cascading impact through `document_change_impact_matrix.md`.

---

## Core Notes

- Scope: `.cowork/**/*.md`
- The full inventory is based on the markdown files included in the framework by default.
- Actual accumulated detail documents and personal session logs are generated as the project proceeds.
- Detail-document examples not included by default: `intents/INT-*.md`, `user_stories/US-*.md`, `adrs/ADR-*.md`, `milestones/MS-*.md`, `tasks/TASK-*.md`
- Log / archive examples not included by default: `06_evolution/imported_context/imported_*.md`, `members/<name>/workspace/session_logs/session_*.md`

---

## Classification Standard

| Class | Meaning | Default Operating Style |
|------|---------|-------------------------|
| Governance | Rules, protocols, gates, operating guides | Update directly, but keep short |
| Canonical | Current body-style source document for the project | Accumulate directly in one document |
| Registry | Index and summary of active items | Operate the registry and the detail-document folder together |
| Instance | ID-based detail document | Create a new file and load only active items as needed |
| Template | Copy source used when creating new documents | Do not operate directly; use only copied instances |
| Log / Archive | Session logs, imported context, raw evidence | Keep append-only and refer only when needed |

---

## Deciding Where New Deliverables Belong

### Default Choice

- The default choice is **to absorb the content into an existing canonical document**, not to add a new file.
- Thoughts that are not settled yet, one-off notes, external raw text, and scratch work should stay in log / archive documents, not be promoted to canonical documents.
- Boundary work notes such as migration notes, rollout memos, and integration memos should usually be written into the latest session log first instead of a temporary standalone file.
- A new canonical source document should be created only when the AI proposes the need and the Human approves it.

### Quick Branching Rules

1. If an existing shared source document already has the same responsibility, absorb the content into that document first through a section, table, column, or appendix.
2. If many objects of the same kind accumulate and need IDs, state, or selective loading, consider a registry + instance structure.
3. If the document is not a project working-source document but a release or delivery-time final output, treat it as a delivery-only candidate and handle it in `deliverable_plan.md` and `export_spec.md`.
4. If it is a stable source document that will be referenced repeatedly across sessions and it would become overly mixed or oversized inside the existing source documents, consider it a new canonical-document candidate.
5. If you are not sure, do not create a new file immediately. Temporarily place the content in an existing canonical document or in the log / archive layer, then decide again once a repeated reference pattern appears.

### Placement Summary

| Placement | Good Fit | Avoid When |
|------|---------|------------|
| Absorb into existing canonical document | A section or table addition solves the problem within the document's responsibility | Roles would mix or a key always-loaded document would become unnecessarily large |
| Registry + instance | Many items with ID, state, owner, and lifecycle are repeatedly created | A one-off explanation is fully handled in a single body document |
| Delivery-only | Needed only in the final output, such as release deliverables, public docs, or generated official documents | The project needs a working source document before the final output exists |
| New canonical document | It will be referenced across multiple sessions and absorption into existing documents causes role collision or overgrowth | It is a one-off note, temporary cleanup, or a structure expansion without Human approval |

### Before Proposing A New Canonical Document

- Would adding a section to an existing canonical document solve the problem?
- Is there a high chance it will be referenced in two or more future sessions?
- Does operation become more stable if `project_state.md`, gate decisions, or export interpretation can point to it as a separate source document?
- After approval, should the "new canonical source document added" row in `document_change_impact_matrix.md` be reviewed together with `deliverable_plan.md`, `project_state.md`, and optionally `quality_gate.md` / `export_spec.md`?

---

## High-Accumulation Canonical Documents To Watch First

| Document | Current Class | Accumulation Scale | Follow-Up Judgment |
|------|---------------|-------------------|-------------------|
| `02_project_definition/functional_spec.md` | Canonical | High | Consider splitting by domain if many functions accumulate |
| `03_design_artifacts/ui_spec.md` | Canonical | High | Consider splitting by screen group if many screens accumulate |
| `05_verification/test_case.md` | Canonical | High | Consider `test_cases/` if real `TC-*` cases exceed 12, execution-summary rows exceed 15, or the last 3 sessions repeatedly reference only the same subset |
| `06_evolution/knowledge_base.md` | Canonical | High | Consider topic-based split if real items exceed 15 or the last 3 sessions repeatedly reference only the same topic |
| `06_evolution/retrospective.md` | Canonical | Medium to High | Consider split by round or scope if completed retrospectives accumulate beyond 4 or recent sessions repeatedly reference only the latest 1 to 2 retrospectives |
| `07_delivery/release_note.md` | Canonical | High | Consider version-based split or external release-system integration when releases become frequent |
| `07_delivery/user_manual.md` | Canonical | Medium to High | Consider split by user role when feature breadth grows |
| `07_delivery/operation_guide.md` | Canonical | Medium to High | Consider split by environment when operation environments multiply |
| `members/team_board.md` | Canonical | Medium to High | Consider separating role board / sprint board as the team grows |

---

## Full Inventory

> The operating style follows the classification standard above. The table below lists only path, class, accumulation scale, and exception notes.

### Root

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `cowork.md` | Governance | Low | Master document for principles, structure, and lifecycle |
| `README.md` | Governance | Low | Quick start and intro guide for `.cowork` |
| `upgrade_manifest.md` | Governance | Low | Version-specific upgrade classification table |

### 01_cowork_protocol

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `01_cowork_protocol/communication_convention.md` | Governance | Low | Single source for language, tone, and visualization |
| `01_cowork_protocol/decision_authority_matrix.md` | Governance | Low | Rarely changes. Includes Collaboration Execution Mode (solo/team) |
| `01_cowork_protocol/role_realization.md` | Governance | Low | Role-seat realization guide (F-07) |
| `01_cowork_protocol/onboarding_runbook.md` | Governance | Low | Teammate onboarding procedure (F-08) |
| `01_cowork_protocol/escalation_policy.md` | Governance | Low | Rarely changes |
| `01_cowork_protocol/session_protocol.md` | Governance | Medium | Shared session protocol |
| `01_cowork_protocol/tooling_environment_guide.md` | Governance | Low to Medium | Split-out document for tool/environment-dependent operation |
| `01_cowork_protocol/document_role_inventory.md` | Governance | Medium | Update when structure changes |
| `01_cowork_protocol/document_change_impact_matrix.md` | Governance | Medium | Update when structure changes cascade |

### 02_project_definition

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `02_project_definition/deliverable_plan.md` | Canonical | Medium | Includes deliverable interpretation plan |
| `02_project_definition/domain_glossary.md` | Canonical | Medium | Consider topic split if terminology grows heavily |
| `02_project_definition/functional_spec.md` | Canonical | High | High-accumulation candidate |
| `02_project_definition/intent_registry.md` | Registry | Medium | Active intent index |
| `02_project_definition/requirement_spec.md` | Canonical | Medium to High | Can split by chapter if scope becomes large |
| `02_project_definition/risk_register.md` | Canonical | Medium to High | Can remain a single document because it behaves like a register |
| `02_project_definition/user_story_registry.md` | Registry | Medium | User story index |
| `02_project_definition/templates/intent_template.md` | Template | Low | Do not operate directly |
| `02_project_definition/templates/user_story_template.md` | Template | Low | Do not operate directly |

### 03_design_artifacts

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `03_design_artifacts/adr_registry.md` | Registry | Medium | Index of approved decisions |
| `03_design_artifacts/data_model.md` | Canonical | Medium | Data-structure authority |
| `03_design_artifacts/domain_model.md` | Canonical | Medium | Domain-structure authority |
| `03_design_artifacts/interface_contract.md` | Canonical | Medium | Interface-contract authority |
| `03_design_artifacts/tech_stack.md` | Canonical | Medium | Tech stack registry linked to ADRs |
| `03_design_artifacts/ui_spec.md` | Canonical | High | High-accumulation candidate |
| `03_design_artifacts/templates/adr_template.md` | Template | Low | Do not operate directly |

### 04_implementation

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `04_implementation/coding_convention.md` | Canonical | Medium | Update when the tech stack changes |
| `04_implementation/milestone_registry.md` | Registry | Medium | Index of intermediate completion points |
| `04_implementation/review_checklist.md` | Canonical | Low to Medium | Quality-review criteria |
| `04_implementation/task_registry.md` | Registry | High | Index of active execution units |
| `04_implementation/templates/milestone_template.md` | Template | Low | Do not operate directly |
| `04_implementation/templates/task_template.md` | Template | Low | Do not operate directly |

### 05_verification

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `05_verification/quality_gate.md` | Governance | Medium | Includes structure-validation rules |
| `05_verification/test_case.md` | Canonical | High | Consider split if real `TC-*` cases exceed 12, execution-summary rows exceed 15, or recent sessions repeatedly reference only the same subset |
| `05_verification/test_strategy.md` | Canonical | Medium | Policy document above the case level |
| `05_verification/verification_evidence.md` | Canonical | Medium to High | Index of test / review / NFR / release evidence |

### 06_evolution

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `06_evolution/knowledge_base.md` | Canonical | High | Consider topic-based split if real items exceed 15 or recent sessions repeatedly reference only the same topic |
| `06_evolution/project_state.md` | Canonical | Medium | Default-loading target. Narrative completion history stays in-body for the last 3 sessions only (R1) |
| `06_evolution/state_archive.md` | Log / Archive | High (cumulative) | R1 harvest target. Append-only, not a default-loading target, never compressed |
| `06_evolution/retrospective.md` | Canonical | Medium to High | Consider split by round or scope when accumulation patterns appear |
| `06_evolution/templates/session_log_template.md` | Template | Low | Real logs are created under `members/<name>/workspace/session_logs/` |

### 07_delivery

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `07_delivery/export_spec.md` | Governance | Medium | Includes source-priority rules |
| `07_delivery/operation_guide.md` | Canonical | Medium to High | Consider split when multiple operation environments appear |
| `07_delivery/release_note.md` | Canonical | High | High-accumulation candidate |
| `07_delivery/user_manual.md` | Canonical | Medium to High | Can split by feature or user role |

### members

| Path | Class | Accumulation Scale | Notes |
|------|------|--------------------|------|
| `members/my_state_template.md` | Template | Low | Generates `my_state.md` in real use |
| `members/profile_template.md` | Template | Low | Copied for each team member |
| `members/proposal_template.md` | Template | Low | Used for approval workflow |
| `members/team_board.md` | Canonical | Medium to High | Consider board split as team size grows |

---

## Current Summary Judgment

- Areas that already require a `Registry + Instance` structure are `Intent`, `User Story`, `ADR`, `Milestone`, and `Task`.
- Among the remaining documents, the first candidates for renewed structure review are `functional_spec.md`, `ui_spec.md`, `test_case.md`, `knowledge_base.md`, `release_note.md`, and `team_board.md`.
- Register-like documents such as `risk_register.md` and `tech_stack.md` usually work well as a single canonical document.
- Keep raw accumulated logs in `members/<name>/workspace/session_logs/`, `imported_context/`, and `06_evolution/state_archive.md`, and keep the rule that only refined results are promoted into canonical documents.
- `project_state.md` and `my_state.md` are loading documents where completion narratives easily accumulate append-only. Continuously manage their loading size with the triggered diet rules (R1: keep the last 3 sessions in-body + on `wrap up` move the overflow to `state_archive.md`; R2: when a table cell swells, split the detail into a detail document or a session-log pointer). Details in `session_protocol.md` §Shared State Index Management.
