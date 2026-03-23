# Feature Flow Overview

This document is a lightweight navigation guide to the framework's main capabilities in time order.
It is organized by session stage and lifecycle phase, not by folder alone.
Within each section, features are ordered from the highest operational priority to more specialized supporting behaviors.

It intentionally includes distinctive operating features such as selective context loading, passive extraction, document promotion, and controlled artifact placement.
Detailed rules still live in the root maintainer docs, the published framework entrypoints, and the `.cowork/` documents themselves.

Unless noted otherwise, `Primary artifacts` are shown using installed project paths.

## Update Policy

Update this document when the framework flow changes in a meaningful way:

- a major capability is added, removed, renamed, or re-scoped
- the primary trigger or expected outcome of a capability changes
- the lifecycle order or document flow changes in a durable way

Do not update it for minor wording edits or local refinements inside a source document.

## Always-Loaded Common

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Selective context loading | Loads the minimum high-value context first and keeps logs, templates, and imported material out of the default read path unless needed | Every session, before detailed work begins | `cowork.md`, `project_state.md` including its `Context Loading Guide` section, registry and canonical documents | The framework restores context quickly without reading the entire workspace every time |
| Document role model | Distinguishes governance, canonical, registry, instance, template, and log artifacts so new information can be placed intentionally | Every session and every document update | `01_cowork_protocol/document_role_inventory.md` | The team can tell which document should hold durable truth, index state, temporary notes, or reusable templates |
| Authority and approval boundaries | Keeps approval-sensitive operations such as structure change, registry promotion, and new canonical creation inside an explicit human approval boundary | Whenever structure or governance changes are proposed | `01_cowork_protocol/decision_authority_matrix.md`, `01_cowork_protocol/document_role_inventory.md`, entrypoint files | The framework stays collaborative and traceable instead of silently reshaping itself |
| Shared multi-tool workspace | Lets Codex, Claude Code, Gemini, and Copilot operate on the same durable project memory instead of maintaining separate assistant-specific states | Whenever the active AI tool changes or multiple tools are used on one project | Root entrypoint files, `.cowork/`, `.github/copilot-instructions.md` | Tool switching does not reset the collaboration model or lose durable project context |

## Every Session Start

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Session state restore | Restores current phase, active work, recent decisions, and carry-over context at the start of a normal session | Every session start | Root entrypoint file, `cowork.md`, `06_evolution/project_state.md`, latest session log | Human and assistant begin from the same project picture instead of from chat memory |
| Session briefing | Produces a short working brief of current phase, active Intent or Milestone or Task, and the next recommended starting point | Immediately after state restore | `06_evolution/project_state.md`, latest session log, active registries | The session starts with a compact, actionable briefing instead of raw document dumping |
| Phase-aware loading | Expands loading only into the registry and canonical documents most relevant to the current phase | After the initial briefing confirms the active phase | `06_evolution/project_state.md`, phase source documents, loading guidance in entrypoint files | The reading scope stays focused and repeatable across sessions and tools |
| Language and visualization alignment | Confirms conversation language, working document language, export language, and visualization mode before active work diverges | Early in session start, especially when contributors or outputs vary | Root entrypoint files, project context fields, delivery planning docs | The session avoids silent drift between discussion language, source language, delivery language, and visualization expectations |
| Personal workspace recall | Restores contributor-specific context without confusing it with shared project state | When a named member or tool user resumes work | `members/<name>/workspace/session_logs/`, `members/<name>/workspace/my_state.md` | Personal carry-over context is available without polluting shared canonical documents |
| Session log bootstrap | Opens a fresh session log as a default capture point for active work, transient notes, and end-of-session enrichment | Every session start | `members/<name>/workspace/session_logs/`, `06_evolution/templates/session_log_template.md` | The session has a live working record before execution begins |
| Session log ignore hygiene | Adds or verifies the ignore rule that keeps local session logs from turning into noisy repository diffs when that rule is expected | Session start, one-time if the ignore rule is missing | `.gitignore`, session log path rules | Session history can accumulate without polluting normal tracked changes |
| Pending proposal surfacing | Detects unresolved proposals that may require a master or human decision before work continues | When pending proposals exist at session start | `members/*/proposals/`, authority rules | Open proposal debt is visible before the session accidentally bypasses it |

## In-Session Automation

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Auto-recording | Writes approved or meaningful changes back into the right project documents while work is happening | Important decisions, accepted changes, or meaningful progress during the session | Session log, current phase source documents, `06_evolution/project_state.md` | Important context survives beyond the conversation |
| Passive extraction | Harvests stable outcomes from the execute cycle and reflects them into the relevant phase documents instead of leaving them only in chat or raw notes | After an execution cycle or meaningful work unit completes | Phase source documents, registries, canonical documents, session logs | The framework gradually accumulates durable state without requiring manual transcription each time |
| Document routing | Decides whether new information belongs in a canonical document, registry, instance document, delivery artifact, or session log | Whenever new information is created | `01_cowork_protocol/document_role_inventory.md`, phase source docs | New information lands in the right place instead of scattering across arbitrary files |
| Project state synchronization | Updates the shared resume index whenever current focus, active work, or next steps materially change | Major status changes during a session | `06_evolution/project_state.md` | The next session can recover the latest real status from one trusted index |
| Keyword-triggered automation | Maps common workflow phrases such as finish, proposal, phase transition, release, and upgrade into structured framework actions | When the user invokes recognized session keywords | Entrypoint keyword tables, `01_cowork_protocol/tooling_environment_guide.md`, proposal paths, gate docs, release and upgrade docs | Common workflow transitions become faster, more predictable, and easier to repeat across tools |
| Change proposal capture | Turns explicit proposals into structured proposal artifacts instead of letting them remain vague conversational branches | When the conversation enters proposal mode | `members/*/proposals/`, proposal templates, session log | Suggested changes become reviewable and traceable objects |
| External context intake with extracted facts only | Stores raw outside material separately and promotes only the needed facts into source documents | When external chat notes, briefs, or imported references are brought in | `06_evolution/imported_context/`, relevant canonical or registry docs | Imported context supports the project without becoming an uncontrolled source of truth |
| Context saturation handoff | Detects when context quality is degrading and steers the work toward enrichment and a clean next session boundary | When the working context becomes too full or unstable | Session log, `project_state.md`, end-of-session protocol | Long-running work can be handed off cleanly before context collapse |

## First Session Start

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Project archetype kickoff | Establishes the minimum framing needed to start correctly, such as project type, scope shape, and initial working assumptions | First project session or first AI-assisted session | `01_cowork_protocol/session_protocol.md`, `cowork.md` | The project starts with enough structure to avoid random questioning and blind execution |
| Brownfield reverse discovery kickoff | Adapts the framework to an existing project by discovering current artifacts, aligning them to phases, and filling only the minimum missing structure | First framework-guided session in an existing project | Existing repository artifacts, `cowork.md`, `06_evolution/project_state.md`, Define and Design source docs | Existing projects can adopt the framework without pretending they started from a clean greenfield baseline |
| Minimum onboarding completeness check | Ensures the first session collects enough baseline information to close responsibly and continue later | End of the first session or when required kickoff inputs are still missing | `01_cowork_protocol/session_protocol.md`, `05_verification/quality_gate.md`, `06_evolution/imported_context/` | The project does not leave the first session with critical context still undefined |
| Solo-default member bootstrap | Initializes a single-person project using the same durable member workspace model as team setups, but with simpler defaults | First contributor setup in a solo project | `members/profile_template.md`, `members/my_state_template.md`, session protocol guidance | Solo projects can scale into team structure later without redoing the workspace model |

## Define

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Intent definition | Captures why the work exists, what problem it solves, and what outcomes matter | New project start, major scope shift, or unclear purpose | `02_project_definition/intent_registry.md`, `02_project_definition/intents/`, `02_project_definition/requirement_spec.md` | The project has a stable reason for existing and a clear direction to design against |
| Requirement shaping | Turns rough needs into structured requirements, functional scope, glossary terms, and working definitions | Scope clarification and early planning | `02_project_definition/requirement_spec.md`, `02_project_definition/functional_spec.md`, `02_project_definition/domain_glossary.md`, `02_project_definition/user_story_registry.md` | The team can design and implement against explicit expectations rather than ad hoc conversation |
| Deliverable negotiation | Defines which official outputs matter for this project, including required, recommended, and omitted deliverables | Early planning and scope negotiation | `02_project_definition/deliverable_plan.md` | Delivery expectations are decided early enough to influence later design and verification |
| Risk capture | Records uncertainties, constraints, and failure concerns early enough to influence direction | Whenever notable uncertainty appears during Define | `02_project_definition/risk_register.md` | Risks become visible planning inputs instead of late surprises |
| Define completion checks | Connects mandatory Define questions and document readiness to later quality gates | Before leaving Define or entering Design | `01_cowork_protocol/session_protocol.md`, `05_verification/quality_gate.md`, `06_evolution/project_state.md` | Define does not close with major unknowns silently left behind |

## Design

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Architecture and model design | Defines the system shape, domain boundaries, interfaces, UI, data model, and technology choices | Once requirements are stable enough to design against | `03_design_artifacts/domain_model.md`, `03_design_artifacts/data_model.md`, `03_design_artifacts/interface_contract.md`, `03_design_artifacts/tech_stack.md`, `03_design_artifacts/ui_spec.md` | Implementation can proceed from an explicit design baseline |
| New artifact placement checklist | Decides whether emerging material should be absorbed into an existing canonical doc, promoted to registry plus instance form, treated as delivery-only, or proposed as a new canonical artifact | When a new document seems necessary | `01_cowork_protocol/document_role_inventory.md` | The framework can grow intentionally without spawning arbitrary files |
| New canonical sync checklist | Forces related documents to be reviewed together when a new canonical artifact is approved | After a new canonical addition is accepted | `01_cowork_protocol/document_change_impact_matrix.md`, `02_project_definition/deliverable_plan.md`, `06_evolution/project_state.md`, `05_verification/quality_gate.md`, `07_delivery/export_spec.md` | New structure does not drift out of sync with planning, loading, verification, and delivery rules |
| ADR escalation by impact axis | Promotes only the right class of decisions into ADRs based on durable impact such as constraint, cost, scalability, security, or operational effect | When a technical decision is being recorded | `03_design_artifacts/templates/adr_template.md`, `03_design_artifacts/adr_registry.md`, session protocol guidance | Important decisions become durable ADRs without over-promoting every small design choice |

## Build

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Milestone planning | Breaks approved intent and design into visible implementation checkpoints | When planning execution after design | `04_implementation/milestone_registry.md`, `04_implementation/milestones/`, milestone template | Execution has meaningful checkpoints instead of one undifferentiated build phase |
| Task decomposition and tracking | Converts milestones into concrete tasks that can be resumed, reviewed, and connected back to project intent | During active implementation work | `04_implementation/task_registry.md`, `04_implementation/tasks/`, task template | Daily work stays traceable to higher-level goals |
| Registry-instance sync fields | Keeps task registries, task instances, and the resume index aligned through a minimum shared field set | Whenever task state is updated | `04_implementation/task_registry.md`, `04_implementation/templates/task_template.md`, `06_evolution/project_state.md` | Task progress can be recovered reliably without duplicating every detail everywhere |
| Temporary note parking | Gives boundary or in-progress implementation notes a default temporary home before they earn promotion | During migration work, rollout planning, integration work, or temporary diagnostics | Latest session log, `06_evolution/templates/session_log_template.md`, routing guidance | Build-time notes do not fragment the document system or become fake canon too early |
| Review guidance | Provides shared implementation and review expectations so build output stays legible and reviewable across sessions and tools | During coding and review | `04_implementation/coding_convention.md`, `04_implementation/review_checklist.md` | Implementation quality follows a shared baseline |

## Verify

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Test planning | Defines how behavior, scenarios, and quality expectations will be validated | When implementation reaches verifiable scope | `05_verification/test_strategy.md`, `05_verification/test_case.md` | Validation has an explicit plan instead of relying on ad hoc testing |
| Verification evidence index | Collects review, test, NFR, and release-readiness evidence into a reusable canonical index rather than letting it remain scattered in logs | As validation evidence accumulates across sessions | `05_verification/verification_evidence.md` | Verification results stay discoverable, gate-ready, and reusable |
| Requirement-to-verification traceability | Connects FR and NFR expectations to scenarios, cases, and the latest known outcomes | When test strategy and cases are updated | `05_verification/test_strategy.md`, `05_verification/test_case.md`, `02_project_definition/requirement_spec.md` | The team can explain what was verified, what remains open, and what requirement each result supports |
| Quality gate review | Uses explicit gate checks to decide whether the project is ready to move into the next phase or release step | Before phase transitions and release preparation | `05_verification/quality_gate.md`, supporting evidence docs | Phase movement becomes a deliberate decision instead of a vague feeling of readiness |
| Test case split trigger | Watches for the point where one growing verification document should be promoted into a split test case structure | When `test_case.md` becomes too large or too reference-heavy | `05_verification/test_case.md`, document role guidance | Verification detail can scale without burying retrieval quality |

## Evolve

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Session end enrichment | Closes the session with a useful summary, carry-over list, and next starting point instead of an abrupt stop | Session end or explicit finish signal | Session log, `members/<name>/workspace/my_state.md`, session protocol guidance | The next session can resume quickly from a clean handoff |
| Document promotion from logs | Decides what deserves promotion from raw session notes into canonical, registry, knowledge, or delivery documents | During cleanup, review, or repeated reuse of session content | `06_evolution/templates/session_log_template.md`, `06_evolution/project_state.md`, relevant destination docs | Only durable, reusable, or blocking information graduates out of logs |
| Project state summary guardrails | Keeps `project_state.md` small enough to remain a resume index rather than a dumping ground | Whenever `project_state.md` grows or gets updated | `06_evolution/project_state.md` | The framework preserves a high-signal always-load resume document |
| Knowledge versus retrospective split triggers | Defines when reusable knowledge and reflective lessons should be split, reorganized, or promoted as they accumulate | When high-accumulation evolution docs grow or become reference-heavy | `06_evolution/knowledge_base.md`, `06_evolution/retrospective.md` | Durable learning stays navigable instead of becoming an undifferentiated archive |
| Durable knowledge harvest | Captures reusable insights without promoting raw conversation wholesale | When a repeatable lesson or pattern appears | `06_evolution/knowledge_base.md`, `06_evolution/retrospective.md`, destination docs as needed | Useful learning survives beyond the session that produced it |

## Deliver

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Export planning | Defines which official delivery documents should actually be produced for handoff or release | When preparing outputs for delivery or release | `07_delivery/export_spec.md`, `02_project_definition/deliverable_plan.md` | Delivery work starts from an explicit target set instead of implied expectations |
| Extensible deliverable model | Supports the default recommended output set while allowing approved project-specific extensions beyond the baseline | When the project needs outputs beyond the default model | `02_project_definition/deliverable_plan.md`, `07_delivery/export_spec.md` | The framework can adapt to real projects without pretending every delivery set is identical |
| User and operations documentation | Produces downstream-facing guidance for usage and operation from the framework state | When release, handoff, or support readiness matters | `07_delivery/user_manual.md`, `07_delivery/operation_guide.md` | Consumers receive practical guidance, not just source artifacts |
| Release note drafting | Summarizes meaningful delivered changes in a release-facing form | During milestone completion or release packaging | `07_delivery/release_note.md`, `CHANGELOG.md` | Release communication is concise and traceable to delivered work |
| Docs generation target | Treats `docs/` as a valid output location for approved supporting deliverables generated from the framework | When export or documentation generation is explicitly requested | `07_delivery/export_spec.md`, `docs/` | Supporting documents can be generated without confusing them with the framework source itself |

## Special Flows

| Feature | What it does | Trigger | Primary artifacts | Expected outcome |
| --- | --- | --- | --- | --- |
| Pre-gate harvest | Collects missing source updates before a phase transition is judged | When the team says it wants to move to the next phase | Relevant source docs, `05_verification/quality_gate.md`, session log | Gate review happens against fresher documents instead of stale state |
| Pre-release harvest | Pulls together the material needed for release outputs before document generation or release packaging | When release, export, or documentation generation begins | `07_delivery/export_spec.md`, `02_project_definition/deliverable_plan.md`, verification docs, session log | Release-facing outputs are generated from prepared source state |
| Consumer upgrade staging | Evaluates and stages framework upgrades without blindly overwriting project-owned content | Upgrade work for downstream consumers | `01_cowork_protocol/tooling_environment_guide.md`, `.cowork/upgrade_manifest.md`, `scripts/prepare-consumer-upgrade.ps1`, `.cowork/.upgrade/` | Upgrade intent and file handling rules are explicit before changes are applied |
| Release preparation | Aligns repository versioning, manifests, and release metadata before a release branch or verification step | `!build`, maintainer release prep, or version alignment work | `VERSION`, `frameworks/ko/.cowork/upgrade_manifest.md`, `CHANGELOG.md`, `scripts/release.ps1` | Release-critical repository state is aligned and ready for verification |
| Framework publishing | Publishes an already merged release as an official framework artifact | `!release` or maintainer publish step | `scripts/release.ps1`, `dist/`, Git tags and releases | The maintained framework becomes an official published release |
