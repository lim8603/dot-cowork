# Feature Flow Check

This document expands `docs/feature-flow-overview.md` into an actual execution checklist.
It is used to verify, in order, whether each framework capability starts correctly, operates reliably, and leaves the expected result when an AI follows this framework to start, progress, verify, and hand off a project.

The path notation in this document is based on an installed project by default.
When checking this repository itself, map `.cowork/...` paths to `frameworks/ko/.cowork/...` as needed.

## Usage Criteria

- `[ ] Start`: Check whether the trigger, prerequisite documents, minimum inputs, and approval boundary are in place.
- `[ ] Behavior`: Check whether the AI performs the capability consistently in a real session without excessive guesswork.
- `[ ] Result`: Check whether the output remains in the correct document and is left in a state that can continue into the next step.
- If an item is blocked, leave it as a blocker in the appropriate place among the session log, `project_state.md`, or a proposal document.

## Always-Loaded Common

### Selective context loading
Check against: root entrypoint files, `cowork.md`, `06_evolution/project_state.md` including its `Context Loading Guide` section, `02_project_definition/deliverable_plan.md`, relevant `members/<name>/workspace/my_state.md`, related registry/canonical documents
- [ ] Start: Immediately after session start, the AI can begin from the minimum core documents designated by the entrypoint instead of reading the entire repository.
- [ ] Behavior: Based on the current phase and the scope of the question, it loads logs, templates, and imported material only when needed.
- [ ] Result: A short initial restoration is enough to explain the current state and propose the next action, without causing context saturation.

### Document role model
Check against: `01_cowork_protocol/document_role_inventory.md`
- [ ] Start: Before writing, the AI can distinguish documents as governance, canonical, registry, instance, template, and log, and judge the correct destination.
- [ ] Behavior: Whenever new information appears, it consistently decides whether it belongs in a temporary record, an index, or a formal document.
- [ ] Result: Long-term reference documents and temporary working records do not get mixed together, and a human can later understand each document's role immediately.

### Authority and approval boundaries
Check against: `01_cowork_protocol/decision_authority_matrix.md`, `01_cowork_protocol/document_role_inventory.md`, entrypoint files
- [ ] Start: The human approval boundary is clear for approval-sensitive work such as structure changes, adding a new canonical document, registry promotion, or governance changes.
- [ ] Behavior: The AI does not change structure or redefine rules without approval, and pauses for a proposal and confirmation step when needed.
- [ ] Result: Change history remains collaborative and traceable, and the framework does not silently reshape itself.

### Shared multi-tool workspace
Check against: root entrypoint files, `.cowork/`, `.github/copilot-instructions.md`
- [ ] Start: The documentation consistently establishes that Codex, Claude Code, Gemini, and Copilot all read the same `.cowork/` state.
- [ ] Behavior: Even when the tool changes, the AI does not create separate tool-specific memory and continues working from the same document state.
- [ ] Result: After a tool switch, session restoration, progress state, and next-action suggestions can be reproduced at nearly the same quality.

## Every Session Start

### Session state restore
Check against: root entrypoint file, `06_evolution/project_state.md`, `02_project_definition/deliverable_plan.md`, relevant `members/<name>/workspace/my_state.md`, latest session log, `cowork.md`
- [ ] Start: At session start, the AI can easily find the core documents it should read first, the contributor-specific resume document, and the location of the latest log.
- [ ] Behavior: The AI can restore and briefly explain the current phase, active work, deliverable constraints, recent decisions, and carry-over items.
- [ ] Result: The human and AI start from the same project picture instead of losing time re-explaining previous conversation.

### Session briefing
Check against: `06_evolution/project_state.md`, latest session log, active registries
- [ ] Start: Enough up-to-date information remains to briefly explain the current phase and the active Intent, Milestone, and Task.
- [ ] Behavior: Instead of dumping documents at length, the AI concisely presents the current state, priorities, and the very next action to start.
- [ ] Result: Session start becomes an immediately actionable brief, and early alignment cost stays low.

### Phase-aware loading
Check against: `06_evolution/project_state.md`, `02_project_definition/deliverable_plan.md`, phase source documents, loading guidance in entrypoint files
- [ ] Start: The current active phase is clearly visible in `project_state.md` and the entrypoints.
- [ ] Behavior: The AI expands loading first into only the registry and canonical documents relevant to the phase, and defers unrelated areas.
- [ ] Result: The reading scope stays focused and repeatable, so restoration quality is consistently similar within the same phase.

### Language and visualization alignment
Check against: root entrypoint files, project context fields, delivery planning docs
- [ ] Start: There are early clues that make it possible to confirm the conversation language, working document language, export language, and visualization mode.
- [ ] Behavior: When contributor language, output language, and visualization expectations diverge, the AI aligns document language, delivery language, and visualization mode early.
- [ ] Result: Silent drift does not happen, such as the conversation staying in Korean while the documents quietly drift into English or Mermaid appearing even though the project left visualization disabled.

### Personal workspace recall
Check against: `members/<name>/workspace/session_logs/`, `members/<name>/workspace/my_state.md`, root entrypoint files
- [ ] Start: The AI can identify which contributor name is currently in use and where that person's workspace lives.
- [ ] Behavior: The AI restores personal carry-over context without confusing it with shared canonical state.
- [ ] Result: Personal working context remains alive while the shared project source of truth stays clean.

### Session log bootstrap
Check against: `members/<name>/workspace/session_logs/`, `06_evolution/templates/session_log_template.md`
- [ ] Start: The path and template for opening or creating a new session log are ready.
- [ ] Behavior: Before full execution begins, the AI establishes the current session log as the default capture point and leaves a trace of work.
- [ ] Result: Temporary judgments, notes, and follow-up cleanup are kept together as a single session-level record instead of scattering.

### Session log ignore hygiene
Check against: `.gitignore`, session log path rules
- [ ] Start: The policy and path rules for excluding local session logs from tracking are clear.
- [ ] Behavior: The AI checks for or suggests a missing ignore rule once, and keeps session logs from creating noisy diffs.
- [ ] Result: Session records can accumulate sufficiently without dirtying normal working branches with unnecessary changes.

### Pending proposal surfacing
Check against: `members/*/proposals/`, authority rules
- [ ] Start: Unresolved proposal locations and approval owners are visible at session start.
- [ ] Behavior: The AI surfaces unresolved proposals first and does not bypass them without approval.
- [ ] Result: Decision debt is visible, and important structural changes do not proceed under missing approval.

## In-Session Automation

### Auto-recording
Check against: session log, current phase source documents, `06_evolution/project_state.md`
- [ ] Start: The AI knows the rule that important decisions and approved changes must be documented immediately during work.
- [ ] Behavior: When a meaningful state change occurs, it updates the appropriate phase document and `project_state.md` together instead of leaving only a session log entry.
- [ ] Result: Core context survives outside the conversation and can be reused in the next session.

### Passive extraction
Check against: phase source documents, registries, canonical documents, session logs
- [ ] Start: After an execution cycle ends, the AI can identify which outcomes count as stable facts.
- [ ] Behavior: It promotes only stabilized results into phase documents and registries, while leaving raw notes untouched and preserving the boundary.
- [ ] Result: Project documents deepen a little each session, and the loss of knowledge without manual transcription is reduced.

### Document routing
Check against: `01_cowork_protocol/document_role_inventory.md`, phase source docs
- [ ] Start: When new information appears, the AI can immediately judge which document types are candidates.
- [ ] Behavior: The AI consistently routes new information to the correct destination among canonical, registry, instance, delivery artifact, and session log.
- [ ] Result: Information does not scatter into arbitrary files, and future retrieval cost stays low.

### Project state synchronization
Check against: `06_evolution/project_state.md`
- [ ] Start: The rule is clear that `project_state.md` must be updated when the active focus, current work, or next steps change.
- [ ] Behavior: The AI synchronizes the resume index to the latest state when a major status change occurs.
- [ ] Result: The next session resumes from the real latest state rather than from stale information.

### Keyword-triggered automation
Check against: entrypoint keyword tables, `01_cowork_protocol/tooling_environment_guide.md`, proposal paths, gate docs, release and upgrade docs
- [ ] Start: Keywords such as `finish`, `proposal`, `phase transition`, `release`, and `upgrade`, and the actions connected to them, are documented.
- [ ] Behavior: When the AI hears a keyword, it connects it to a structured framework procedure instead of reacting ad hoc every time.
- [ ] Result: Frequently repeated transition work becomes faster and more consistent, and the same pattern can be reproduced across tools.

### Change proposal capture
Check against: `members/*/proposals/`, proposal templates, session log
- [ ] Start: The path and template for entering proposal mode are prepared.
- [ ] Behavior: The AI turns conversational ideas into proposal artifacts that structure scope, reason, and approval needs.
- [ ] Result: Proposals do not disappear as floating conversation fragments and remain as reviewable objects.

### External context intake with extracted facts only
Check against: `06_evolution/imported_context/`, relevant canonical or registry docs
- [ ] Start: A separate location and promotion rule are defined for storing raw external conversations or reference material.
- [ ] Behavior: The AI does not treat raw outside material as the source of truth and promotes only the needed facts into related documents.
- [ ] Result: External context helps the project without making the project source document system lose control.

### Context saturation handoff
Check against: session log, `project_state.md`, end-of-session protocol
- [ ] Start: There are signals and a procedure for cleaning up and handing off the session when context quality drops.
- [ ] Behavior: In an over-saturated state, the AI does not force work forward and instead shifts toward enrichment and handoff preparation.
- [ ] Result: Long-running work crosses into a clean next-session boundary before context collapse.

## First Session Start

### Project archetype kickoff
Check against: `01_cowork_protocol/session_protocol.md`, `cowork.md`
- [ ] Start: The minimum project type, scope, and base assumptions that must be confirmed in the first session are organized in the documentation.
- [ ] Behavior: Instead of firing random questions, the AI gathers only the necessary minimum framing and establishes the initial structure.
- [ ] Result: Before the first session ends, a usable starting line is in place for continuing later work.

### Brownfield reverse discovery kickoff
Check against: existing repository artifacts, `cowork.md`, `06_evolution/project_state.md`, Define and Design source docs
- [ ] Start: The AI can analyze an existing repository and infer the current outputs and phase position in reverse.
- [ ] Behavior: The AI does not force an existing project into a greenfield shape, and instead rearranges existing material into the proper phase or adds only minimal reinforcement.
- [ ] Result: Brownfield projects can also be brought into the framework without excessive rewriting.

### Minimum onboarding completeness check
Check against: `01_cowork_protocol/session_protocol.md`, `05_verification/quality_gate.md`, `06_evolution/imported_context/`
- [ ] Start: Before closing the first session, the baseline information that must be secured and the standard for what counts as missing are visible.
- [ ] Behavior: The AI checks for missing core information, undefined scope, and unclear input, and explicitly records the remaining gaps.
- [ ] Result: Even after the first session ends, critical undefined items do not remain hidden while the project moves to the next step.

### Solo-default member bootstrap
Check against: `members/profile_template.md`, `members/my_state_template.md`, session protocol guidance
- [ ] Start: Even in a solo project, templates and default rules exist for creating a member workspace.
- [ ] Behavior: The AI initializes a single-contributor setup in a team-compatible structure without adding unnecessary complexity.
- [ ] Result: Even if the project is solo now, it can later expand naturally into a team structure.

## Define

### Intent definition
Check against: `02_project_definition/intent_registry.md`, `02_project_definition/intents/`, `02_project_definition/requirement_spec.md`
- [ ] Start: The conditions that require intent to be redefined are clear for a new project, a major direction change, or an unclear purpose state.
- [ ] Behavior: The AI structures and records why the work exists, what problem it addresses, and which outcomes matter.
- [ ] Result: The reason the project exists and its direction remain stable so later design and build work do not drift.

### Requirement shaping
Check against: `02_project_definition/requirement_spec.md`, `02_project_definition/functional_spec.md`, `02_project_definition/domain_glossary.md`, `02_project_definition/user_story_registry.md`
- [ ] Start: The timing and target documents for refining rough requirements are clear.
- [ ] Behavior: The AI structures requirements, functional scope, terminology, and user stories to reduce conversation-based guessing.
- [ ] Result: Later design and implementation proceed on explicit expectations, and different interpretations decrease.

### Deliverable negotiation
Check against: `02_project_definition/deliverable_plan.md`
- [ ] Start: There is a signal that the team must agree early on which official deliverables are needed.
- [ ] Behavior: The AI distinguishes required, recommended, and omitted deliverables and pulls that agreement forward into the early stage.
- [ ] Result: It reduces the chance that delivery and verification scope suddenly expand later.

### Risk capture
Check against: `02_project_definition/risk_register.md`
- [ ] Start: There is a rule that uncertainty, constraints, and failure concerns should be registered as risks when they appear.
- [ ] Behavior: In the definition stage, the AI records surfaced risks without missing them and uses them as later decision inputs.
- [ ] Result: Risk remains a planning input that can adjust direction, rather than becoming a late surprise factor.

### Define completion checks
Check against: `01_cowork_protocol/session_protocol.md`, `05_verification/quality_gate.md`, `06_evolution/project_state.md`
- [ ] Start: Before closing Define, the required questions and the document readiness state that must be checked are visible.
- [ ] Behavior: The AI compares the quality gate criteria with the current document state and reveals the remaining gaps.
- [ ] Result: The end of Define is handled as a verifiable state transition rather than a feeling.

## Design

### Architecture and model design
Check against: `03_design_artifacts/domain_model.md`, `03_design_artifacts/data_model.md`, `03_design_artifacts/interface_contract.md`, `03_design_artifacts/tech_stack.md`, `03_design_artifacts/ui_spec.md`
- [ ] Start: Requirements have stabilized enough to be designable, and it is clear which design documents should be written.
- [ ] Behavior: The AI explicitly organizes system shape, domain boundaries, interfaces, UI, data model, and technology choices.
- [ ] Result: Implementation can begin from a design baseline rather than from guesswork.

### New artifact placement checklist
Check against: `01_cowork_protocol/document_role_inventory.md`
- [ ] Start: When a new document seems necessary, there is a standard for judging whether it should extend an existing document, become a new registry, or remain delivery-only.
- [ ] Behavior: The AI does not grow files out of habit and instead chooses the correct path between absorption into existing canonical docs and creation of an approved new artifact.
- [ ] Result: The framework structure grows intentionally, and arbitrary file sprawl stays suppressed.

### New canonical sync checklist
Check against: `01_cowork_protocol/document_change_impact_matrix.md`, `02_project_definition/deliverable_plan.md`, `06_evolution/project_state.md`, `05_verification/quality_gate.md`, `07_delivery/export_spec.md`
- [ ] Start: When a new canonical artifact is approved, the related set of documents that must be reviewed together is clear.
- [ ] Behavior: The AI does not stop after adding only the new canonical document and also aligns planning, loading, verification, and delivery-impact documents.
- [ ] Result: Even after a structural change, related rules and indexes do not fall out of sync.

### ADR escalation by impact axis
Check against: `03_design_artifacts/templates/adr_template.md`, `03_design_artifacts/adr_registry.md`, session protocol guidance
- [ ] Start: The decision axes that determine whether a technical decision has enough durable impact to become an ADR are documented.
- [ ] Behavior: The AI does not turn every small choice into an ADR, and escalates only decisions with major impact in constraints, cost, scalability, security, or operations.
- [ ] Result: Important design judgments remain durable, and the ADR store does not become saturated with noise.

## Build

### Milestone planning
Check against: `04_implementation/milestone_registry.md`, `04_implementation/milestones/`, milestone template
- [ ] Start: There is a standard and a place for breaking approved intent and design into implementable checkpoints.
- [ ] Behavior: The AI does not leave build as one giant task and instead breaks it down into milestones.
- [ ] Result: Implementation progress becomes visible step by step, and later task decomposition and verification linkage become easier.

### Task decomposition and tracking
Check against: `04_implementation/task_registry.md`, `04_implementation/tasks/`, task template
- [ ] Start: The registry and instance document structure for breaking milestones down into working-level tasks is ready.
- [ ] Behavior: The AI divides tasks to a level that can be resumed and reviewed, and records their connection to higher-level goals.
- [ ] Result: Everyday work remains traceably tied to intent and milestone.

### Registry-instance sync fields
Check against: `04_implementation/task_registry.md`, `04_implementation/templates/task_template.md`, `06_evolution/project_state.md`
- [ ] Start: The minimum shared field set across the task registry, task instance, and resume index is defined.
- [ ] Behavior: When state changes, the AI updates the core fields in all three places without letting them drift apart.
- [ ] Result: No matter which document is opened first, the current task state can be restored at a similar quality.

### Temporary note parking
Check against: latest session log, `06_evolution/templates/session_log_template.md`, routing guidance
- [ ] Start: A temporary location is defined for first parking boundary issues, migration notes, and temporary diagnostics.
- [ ] Behavior: The AI does not prematurely promote immature implementation notes into canonical form and instead parks them in the session log.
- [ ] Result: Mid-build notes do not clutter the document system, yet they also do not disappear.

### Review guidance
Check against: `04_implementation/coding_convention.md`, `04_implementation/review_checklist.md`
- [ ] Start: Shared expectations for implementation and review are documented.
- [ ] Behavior: When writing or reviewing code, the AI applies readability, consistency, and review criteria from the same baseline.
- [ ] Result: Even across sessions and tools, output quality and review perspective do not drift significantly.

## Verify

### Test planning
Check against: `05_verification/test_strategy.md`, `05_verification/test_case.md`
- [ ] Start: When implementation reaches a verifiable scope, it is clear which test planning documents should be written.
- [ ] Behavior: The AI plans scenarios, expected behavior, and quality validation methods in advance rather than handling testing improvisationally.
- [ ] Result: Verification activity becomes structured, and it becomes possible to explain what is being verified and why.

### Verification evidence index
Check against: `05_verification/verification_evidence.md`
- [ ] Start: A canonical index exists for collecting evidence for review, testing, NFRs, and release readiness.
- [ ] Behavior: The AI accumulates evidence around the index instead of scattering it across session logs and individual execution outputs.
- [ ] Result: Verification results remain rediscoverable and reusable for gates and release preparation.

### Requirement-to-verification traceability
Check against: `05_verification/test_strategy.md`, `05_verification/test_case.md`, `02_project_definition/requirement_spec.md`
- [ ] Start: There is a reference basis for linking FRs and NFRs with test documents.
- [ ] Behavior: The AI connects verification scenarios, cases, and latest outcomes to each requirement and exposes coverage and gaps.
- [ ] Result: It becomes possible to explain, by requirement, what has been verified and what remains.

### Quality gate review
Check against: `05_verification/quality_gate.md`, supporting evidence docs
- [ ] Start: Before a phase transition or release preparation, the gate criteria and evidence documents to check are clear.
- [ ] Behavior: The AI evaluates readiness through explicit checks rather than vague confidence.
- [ ] Result: Movement into the next phase or release becomes an explainable decision.

### Test case split trigger
Check against: `05_verification/test_case.md`, document role guidance
- [ ] Start: There is a standard for when a single `test_case.md` has become too large and should be split.
- [ ] Behavior: The AI detects the timing to promote into a split structure before the document becomes excessively bloated.
- [ ] Result: Even as verification documents scale, searchability and retrieval quality remain intact.

## Evolve

### Session end enrichment
Check against: session log, `members/<name>/workspace/my_state.md`, session protocol guidance
- [ ] Start: The summary, carry-over, and next-start items that must be left at session end are defined.
- [ ] Behavior: The AI does not stop work abruptly and instead organizes handoff information for the next session.
- [ ] Result: Later sessions can begin in a clean relay-ready state.

### Document promotion from logs
Check against: `06_evolution/templates/session_log_template.md`, `06_evolution/project_state.md`, relevant destination docs
- [ ] Start: There is a standard for judging which content in a session log is eligible for promotion.
- [ ] Behavior: The AI promotes only repeatedly reused or durable information into canonical, registry, knowledge, or delivery documents.
- [ ] Result: Logs remain raw records, and only valuable information is reflected into official documents.

### Project state summary guardrails
Check against: `06_evolution/project_state.md`
- [ ] Start: The size and role standard that says `project_state.md` must remain a resume index is clear.
- [ ] Behavior: When adding new state, the AI leaves only high-signal summaries instead of stacking detailed records.
- [ ] Result: `project_state.md` remains a fast-to-read restoration document.

### Knowledge versus retrospective split triggers
Check against: `06_evolution/knowledge_base.md`, `06_evolution/retrospective.md`
- [ ] Start: There is a standard for separating reusable knowledge from reflective retrospective records.
- [ ] Behavior: As documents accumulate, the AI correctly branches reusable knowledge and reflective lessons.
- [ ] Result: Learned content does not get mixed together, and both reference knowledge and retrospective archives remain easy to read.

### Durable knowledge harvest
Check against: `06_evolution/knowledge_base.md`, `06_evolution/retrospective.md`, destination docs as needed
- [ ] Start: The moment when repeatable patterns or lessons learned should be captured is recognized.
- [ ] Behavior: The AI does not move raw conversation wholesale and leaves only refined insights with reusable value.
- [ ] Result: Useful learning does not vanish when the session ends and becomes an asset for later work.

## Deliver

### Export planning
Check against: `07_delivery/export_spec.md`, `02_project_definition/deliverable_plan.md`
- [ ] Start: There is an agreement standard for which official outputs must be produced when preparing handoff or release.
- [ ] Behavior: The AI plans delivery work against an explicit target set rather than implied expectations.
- [ ] Result: Output generation proceeds with controlled scope, and both omission and overproduction are reduced.

### Extensible deliverable model
Check against: `02_project_definition/deliverable_plan.md`, `07_delivery/export_spec.md`
- [ ] Start: There is an approval path for allowing project-specific deliverables beyond the default recommended outputs.
- [ ] Behavior: The AI does not ignore the baseline and still reflects approved extended outputs into the delivery set.
- [ ] Result: The delivery model can expand flexibly to match real project needs.

### User and operations documentation
Check against: `07_delivery/user_manual.md`, `07_delivery/operation_guide.md`
- [ ] Start: The conditions requiring user-facing and operations-facing documents during release, handoff, and operational readiness are clear.
- [ ] Behavior: The AI writes the guidance needed for real use and operation based on the internal framework state.
- [ ] Result: Consumers receive not only source documents but also practical guides they can actually use.

### Release note drafting
Check against: `07_delivery/release_note.md`, `CHANGELOG.md`
- [ ] Start: There is a rule that change summaries must be organized in a release-facing format when a milestone is completed or a release is packaged.
- [ ] Behavior: The AI summarizes delivered change around meaning and links it to traceable evidence.
- [ ] Result: Release communication stays concise without drifting away from the actual delivered content.

### Docs generation target
Check against: `07_delivery/export_spec.md`, `docs/`
- [ ] Start: The conditions under which `docs/` may be used as the generation location for delivery-supporting documents are clear.
- [ ] Behavior: The AI creates generated supporting docs in approved locations without confusing them with framework source.
- [ ] Result: Supporting documents are generated properly without mixing into the framework's source system.

## Special Flows

### Pre-gate harvest
Check against: relevant source docs, `05_verification/quality_gate.md`, session log
- [ ] Start: There is a rule that source harvesting is needed before the gate when the team signals it wants to move to the next phase.
- [ ] Behavior: Before a quality gate decision, the AI gathers missing source updates and reflects the latest state.
- [ ] Result: Gate review is performed against the actual latest documents rather than stale state.

### Pre-release harvest
Check against: `07_delivery/export_spec.md`, `02_project_definition/deliverable_plan.md`, verification docs, session log
- [ ] Start: When release, export, or docs generation begins, the list of materials that must be collected first is visible.
- [ ] Behavior: Before generating release-facing output, the AI organizes the required verification, planning, and session outcomes into source state.
- [ ] Result: Release documents and packaging come from a prepared official state rather than from half-organized notes.

### Consumer upgrade staging
Check against: `01_cowork_protocol/tooling_environment_guide.md`, `.cowork/upgrade_manifest.md`, `scripts/prepare-consumer-upgrade.ps1`, `.cowork/.upgrade/`
- [ ] Start: During a downstream consumer upgrade, the manifest and staging procedure can be checked first.
- [ ] Behavior: The AI does not overwrite project-owned content blindly and reviews changes according to the `ADD`, `REPLACE`, `MERGE`, and `SKIP` rules.
- [ ] Result: Upgrade intent and file-handling rules are clearly visible before application.

### Release preparation
Check against: `VERSION`, `frameworks/ko/.cowork/upgrade_manifest.md`, `CHANGELOG.md`, `scripts/release.ps1`
- [ ] Start: For `!build` or maintainer release preparation, the files that must be aligned for versioning and the command order are clear.
- [ ] Behavior: The AI aligns `VERSION`, the manifest, changelog, and release metadata together and connects them to the `prepare` verification flow.
- [ ] Result: Release-critical repository state is aligned in a verifiable form.

### Framework publishing
Check against: `scripts/release.ps1`, `dist/`, Git tags and releases
- [ ] Start: The rule that publishing must happen only from merged, clean `main` is enforced.
- [ ] Behavior: The AI follows the `publish` procedure correctly for dist outputs, tags, and release creation.
- [ ] Result: The maintained framework is published reliably as an official release artifact.

## Quick Judgment Guide

- If `Start` items are blocked: fix the trigger, prerequisite documents, approval boundary, and file location first.
- If `Behavior` items are blocked: check document role conflicts, excessive phase loading, missing records, and missing keyword mappings first.
- If `Result` items are blocked: check output destination errors, unsynchronized `project_state.md`, and missing gate/evidence records first.
- If multiple items are blocked in sequence: do not re-check only that phase; revisit `Always-Loaded Common` and `Every Session Start` first.
