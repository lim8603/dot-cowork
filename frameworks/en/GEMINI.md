# [Project Name] — GEMINI.md

This is the project entrypoint for Gemini Code Assist. Prioritize the user's current request and read only the `.cowork/` documents needed for the task. For other tool entrypoints and usage, see `.cowork/README.md`.

## Start and resume

- If the requested task is clear, check active work and constraints in `.cowork/06_evolution/project_state.md`, read only the relevant registries, canonical documents, and instances, and proceed. Do not require a general briefing or another task selection. Still raise, in one line, any carryover item whose trigger has arrived, even if it is unrelated to the current task (watching carryover triggers is the AI's responsibility).
- If no task is specified, briefly present the active Intent, Milestone, Task, next starting point, and carryover items from `project_state.md`, then ask the user to choose work.
- For project setup or resumption work, ask only necessary `.cowork/01_cowork_protocol/session_protocol.md` §1A questions when state is empty or core information conflicts. Do not onboard for a read-only request.
- Read the relevant personal `my_state.md`, latest session log, or accepted ADR only when earlier decisions or unfinished work require that evidence. Follow the Context Loading Guide in `project_state.md` for details.

## Execution and authority

- Follow the H/J/A levels in `.cowork/01_cowork_protocol/decision_authority_matrix.md`. Obtain a Human decision or approval for H/J decisions; perform A-level work and report the result. Do not request approval again for an already approved scope.
- Apply the ADR promotion criteria in `.cowork/01_cowork_protocol/session_protocol.md` §Automatic ADR Creation to major design decisions. Record smaller decisions in the relevant canonical document or session log.
- Do not create files, publish a release, or change the framework merely because words such as `proposal`, `release`, or `upgrade` appear. Determine whether the user requested that action in context, then follow the relevant procedure.
- Investigate code and documents before asking about an uncertainty. Ask when the uncertainty affects the outcome and requires a Human decision.
- Respect the Human's decision. Do not repeat a concern on the same evidence; report new material evidence if it appears.

## Documents and records

- Follow `.cowork/01_cowork_protocol/document_role_inventory.md` for document roles. Read registries and canonical documents first; open templates, logs, and archives only when needed.
- When actual work changes state or decisions, update the relevant source documents and `project_state.md`. Use a session log for decisions, changes, and unfinished work needed for continuity. Do not create logs or member files for a read-only request alone.
- When creating the first session log, check the required `.gitignore` rules. On a session-end request or work handoff, synchronize next steps and unfinished items.
- A new canonical document or registry promotion requires Human approval. Ordinary edits to existing documents and work files follow the authority matrix.
- Follow `.cowork/01_cowork_protocol/communication_convention.md` for language and expression, and `.cowork/04_implementation/coding_convention.md` for coding style.

## Project sources

- **Project:** [Project Name]
- **Current state and next action:** `.cowork/06_evolution/project_state.md`
- **Technology stack:** `.cowork/03_design_artifacts/tech_stack.md`
- **Deliverable scope:** `.cowork/02_project_definition/deliverable_plan.md`
- **Session, gate, and upgrade procedures:** `.cowork/01_cowork_protocol/session_protocol.md`, `.cowork/05_verification/quality_gate.md`, `.cowork/01_cowork_protocol/tooling_environment_guide.md`
