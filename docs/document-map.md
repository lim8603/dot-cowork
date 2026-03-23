# Document Map

This document is the location-and-timing map for the framework's major documents.
Use `docs/feature-flow-overview.md` when you want the lifecycle flow.
Use this document when you want to find the right file quickly and understand when it should be created, updated, and referenced.

Path notation is based on an installed project by default.
When checking this repository itself, map `.cowork/...` paths to `frameworks/ko/.cowork/...`.

## Update Policy

Update this document when the framework document layout changes in a meaningful way:

- a major document or directory is added, removed, renamed, or moved
- the normal creation point of a document changes
- the default reference order changes for a phase or workflow
- a document changes role between governance, canonical, registry, instance, template, or log

Do not update it for routine content edits inside the mapped documents.

## Reading Order

1. Start with the tool entrypoint, `.cowork/06_evolution/project_state.md`, `.cowork/02_project_definition/deliverable_plan.md`, the relevant `.cowork/members/<name>/workspace/my_state.md`, and the latest relevant session log.
2. Use `.cowork/cowork.md` and other governance documents on the first session or when workflow rules need clarification.
3. Move into the current phase's registry and canonical documents before opening instance documents.
4. Open instance documents only for the active `INT-*`, `US-*`, `ADR-*`, `MS-*`, or `TASK-*` items.
5. Treat templates, imported context, proposals, and older logs as on-demand material rather than default reading.

## Session Start Anchors

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Tool entrypoints | `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md` | Installed with the framework | Tool instructions, loading guidance, or shared workflow wording changes | Every session start, especially after tool switching |
| Framework root guide | `.cowork/README.md` | Installed with the framework | The top-level explanation or onboarding path changes | First-time adoption and framework orientation |
| Framework master guide | `.cowork/cowork.md` | Installed with the framework | The framework's core operating model or structure changes | First session, major workflow confusion, or rule lookup |
| Shared resume index | `.cowork/06_evolution/project_state.md` | Installed with the framework, then filled in during real use | Current phase, active work, next steps, language or visualization settings, or status changes | Every session start and every meaningful status change |
| Delivery scope anchor | `.cowork/02_project_definition/deliverable_plan.md` | Early Define work | Deliverable scope, required outputs, or omission decisions change | Early session loading, Define, Deliver, export planning |
| Personal resume index | `.cowork/members/<name>/workspace/my_state.md` | When a contributor workspace is initialized | Personal carry-over work, blockers, or individual next steps change | When a named contributor resumes work |
| Session log | `.cowork/members/<name>/workspace/session_logs/session_*.md` | At the start of each working session | Throughout the session as raw notes and outcomes accumulate | Session restoration, cleanup, and handoff |

## Governance And Structure

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Session protocol | `.cowork/01_cowork_protocol/session_protocol.md` | Installed with the framework | Session start, progress, finish, or gate behavior changes | First session, workflow disputes, automation checks |
| Tooling environment guide | `.cowork/01_cowork_protocol/tooling_environment_guide.md` | Installed with the framework | Tool-specific operating guidance, entrypoint sync rules, or environment-sensitive upgrade paths change | Tool setup, entrypoint sync review, upgrade planning |
| Decision authority matrix | `.cowork/01_cowork_protocol/decision_authority_matrix.md` | Installed with the framework | Approval boundaries or role ownership changes | Before structure changes, promotion, or approval-sensitive work |
| Document role inventory | `.cowork/01_cowork_protocol/document_role_inventory.md` | Installed with the framework | Document types, routing rules, or role definitions change | Whenever a new document or destination is being chosen |
| Document change impact matrix | `.cowork/01_cowork_protocol/document_change_impact_matrix.md` | Installed with the framework | Canonical relationships or sync obligations change | When adding or changing a canonical document |
| Communication convention | `.cowork/01_cowork_protocol/communication_convention.md` | Installed with the framework | Language, formatting, visualization-mode, or collaboration conventions change | Tool alignment, multilingual work, visualization-mode policy, or output-style drift |
| Escalation policy | `.cowork/01_cowork_protocol/escalation_policy.md` | Installed with the framework | Escalation triggers or conflict-handling rules change | Ambiguity, disagreement, or blocked approval flow |

## Define

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Intent registry and intent instances | `.cowork/02_project_definition/intent_registry.md` and `.cowork/02_project_definition/intents/INT-*.md` | New project start, major direction change, or intent split | Intent approval, scope shifts, status changes, or new intent creation | Define work, project direction review, active intent lookup |
| Requirement specification | `.cowork/02_project_definition/requirement_spec.md` | Early Define work | Functional or non-functional requirements change materially | Define, Design, Verify, and release-readiness checks |
| Functional specification | `.cowork/02_project_definition/functional_spec.md` | Early Define work once behavior can be described concretely | User-visible behavior, flows, or scope boundaries change | Define, Design, Build, and delivery drafting |
| Domain glossary | `.cowork/02_project_definition/domain_glossary.md` | When shared terms start to matter | Terms, definitions, or naming boundaries change | Requirement clarification, design discussions, user-facing docs |
| User story registry and story instances | `.cowork/02_project_definition/user_story_registry.md` and `.cowork/02_project_definition/user_stories/US-*.md` | When story-based planning is needed | Story approval, prioritization, implementation status, or new story creation changes | Define, Build planning, and scope review |
| Risk register | `.cowork/02_project_definition/risk_register.md` | As soon as notable uncertainty or constraints appear | New risks appear, impact changes, or mitigation status changes | Define, gate reviews, release preparation |

## Design

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| ADR registry and ADR instances | `.cowork/03_design_artifacts/adr_registry.md` and `.cowork/03_design_artifacts/adrs/ADR-*.md` | When a technical decision has durable impact | Important decisions are approved, revised, superseded, or added | Design reviews, implementation rationale, upgrade and release context |
| Domain model | `.cowork/03_design_artifacts/domain_model.md` | Once requirements are stable enough to shape the domain | Domain boundaries, entities, or relationships change | Design, Build, and team alignment |
| Interface contract | `.cowork/03_design_artifacts/interface_contract.md` | When interfaces, APIs, or module boundaries are being defined | Interface shape, payloads, or boundary rules change | Design, Build, Verify, downstream integration |
| Data model | `.cowork/03_design_artifacts/data_model.md` | When persistent structure or schema design begins | Data shape, schema rules, or storage assumptions change | Design, Build, Verify, operations documentation |
| Tech stack | `.cowork/03_design_artifacts/tech_stack.md` | When implementation technology choices become explicit | Chosen technologies, rationale, or constraints change | Design decisions, onboarding, implementation alignment |
| UI specification | `.cowork/03_design_artifacts/ui_spec.md` | When user-facing flows need interface detail | Screens, interaction rules, or UI behavior change | Design, Build, QA, user documentation |

## Build

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Milestone registry and milestone instances | `.cowork/04_implementation/milestone_registry.md` and `.cowork/04_implementation/milestones/MS-*.md` | When approved work is broken into visible checkpoints | Milestone scope, sequence, status, or ownership changes | Build planning, progress review, handoff |
| Task registry and task instances | `.cowork/04_implementation/task_registry.md` and `.cowork/04_implementation/tasks/TASK-*.md` | When milestones are decomposed into executable work | Task state, ownership, linkage, or next actions change | Daily execution, resume, review, verification linkage |
| Coding convention | `.cowork/04_implementation/coding_convention.md` | Installed with the framework | Coding standards or implementation rules change | During implementation and code review |
| Review checklist | `.cowork/04_implementation/review_checklist.md` | Installed with the framework | Review expectations or quality checks change | Code review, self-review, pre-merge checks |

## Verify

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Test strategy | `.cowork/05_verification/test_strategy.md` | When implementation reaches verifiable scope | Validation approach, scenario coverage, or quality expectations change | Verify planning, gate preparation, release readiness |
| Test case set | `.cowork/05_verification/test_case.md` | When concrete test cases begin to accumulate | Cases, expected results, traceability, or outcome summaries change | Test execution, regression review, requirement coverage checks |
| Verification evidence index | `.cowork/05_verification/verification_evidence.md` | When review, test, NFR, or release evidence starts accumulating across sessions | New evidence is added, linked, or summarized | Gate review, release preparation, audit-style lookups |
| Quality gate | `.cowork/05_verification/quality_gate.md` | Installed with the framework | Gate criteria, review standards, or transition rules change | Phase transitions, release checks, readiness decisions |

## Evolve, Team Workspace, And Raw Stores

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Knowledge base | `.cowork/06_evolution/knowledge_base.md` | When reusable lessons start to accumulate | Repeatable patterns, decisions, or lessons become durable knowledge | Later similar work, onboarding, framework refinement |
| Retrospective | `.cowork/06_evolution/retrospective.md` | After meaningful iterations, milestones, or release cycles | Reflection, lessons learned, or improvement actions change | Evolve work, post-milestone review, process improvement |
| Team board | `.cowork/members/team_board.md` | When multiple contributors or explicit role coordination matter | Ownership, allocation, or team-level status changes | Team coordination, workload checks, role handoff |
| Proposal documents | `.cowork/members/<name>/proposals/*.md` | When a change needs structured approval | Proposal scope, discussion, or approval state changes | Structural change review, governance approval, unresolved proposal checks |
| Imported context store | `.cowork/06_evolution/imported_context/imported_*.md` | When outside material is brought into the project | Additional raw source material is captured or annotated | Only when raw external context must be inspected directly |
| Session log template | `.cowork/06_evolution/templates/session_log_template.md` | Installed with the framework | Session logging structure changes | When opening a new session log |

## Deliver And Upgrade

| Document or path | Lives at | Created when | Updated when | Referenced when |
| --- | --- | --- | --- | --- |
| Export specification | `.cowork/07_delivery/export_spec.md` | Installed with the framework | Delivery mapping rules, output policy, or generation targets change | Deliver work, docs generation, release packaging |
| Release note | `.cowork/07_delivery/release_note.md` | When release-facing output is needed | Delivered changes, release scope, or final summary changes | Milestone closure, release prep, downstream communication |
| Operation guide | `.cowork/07_delivery/operation_guide.md` | When operating or supporting the project matters | Operational setup, maintenance, or runbook guidance changes | Handoff, production readiness, support workflows |
| User manual | `.cowork/07_delivery/user_manual.md` | When downstream users need product guidance | User flows, usage instructions, or supported behavior changes | Delivery, onboarding, support, release packaging |
| Tooling environment guide | `.cowork/01_cowork_protocol/tooling_environment_guide.md` | Installed with the framework | Tool-sensitive upgrade flow, archive fallback rules, or entrypoint sync expectations change | Consumer upgrades, tool operating review, entrypoint maintenance |
| Upgrade manifest | `.cowork/upgrade_manifest.md` | Installed with each framework release | Version, `From` chain, or file action rules change | Consumer upgrades, release preparation, publish verification |
| Upgrade staging plan | `.cowork/.upgrade/upgrade_plan_v<from>_to_v<to>.md` | Only during an actual consumer upgrade staging flow | The staged upgrade plan is regenerated or refined | Upgrade review before applying changes |

## Templates And Generated Instance Paths

These paths matter, but they are usually copied from or written into rather than read first:

| Path or pattern | Use | Referenced when |
| --- | --- | --- |
| `.cowork/02_project_definition/templates/*.md` | Create new intents and user stories | When a new Define artifact is being created |
| `.cowork/03_design_artifacts/templates/adr_template.md` | Create new ADRs | When a design decision is promoted into an ADR |
| `.cowork/04_implementation/templates/*.md` | Create milestones and tasks | When Build work is decomposed into new tracked items |
| `.cowork/members/profile_template.md` | Create a member profile | When onboarding a new contributor |
| `.cowork/members/my_state_template.md` | Create a personal resume document | When initializing a contributor workspace |
| `.cowork/members/proposal_template.md` | Create a structured proposal | When entering proposal mode |

## Boundary Note

This document maps the installed framework and its published entrypoints.
Repository maintainer documents such as the root `README.md`, `DESIGN.md`, `CHANGELOG.md`, and release scripts stay outside this map unless they directly change the framework contract.
