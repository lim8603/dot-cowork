# Use Case Scenarios

This document turns the framework from a set of rules into visible working flows.
Each scenario is intentionally concrete: a person starts with a real project situation, the framework guides what gets read and written, and the next session becomes easier because the state now lives in files rather than in chat memory.

Use `README.md` for the public overview.
Use `docs/adoption-guide.md` for installation and first-session setup.
Use `docs/feature-flow-overview.md` for the lifecycle feature map.
Use `docs/document-map.md` when you want to locate the exact files involved in a scenario.

Path notation is based on an installed project by default.
When checking this repository itself, map `.cowork/...` paths to `frameworks/ko/.cowork/...`.

## Update Policy

Update this document when the framework's real working patterns change in a meaningful way:

- a common adoption or collaboration flow changes shape
- a scenario would now touch a different set of primary artifacts
- the framework starts encouraging a different handoff, team, tool-switching, or release pattern

Do not update it for small wording changes or for minor refinements inside the individual source documents it mentions.

## How To Read This Document

These scenarios are not mandatory scripts.
They are compressed examples of what a healthy framework-guided workflow looks like in practice.

Each scenario shows:

- the starting situation
- what the people and AI tools do next
- which framework documents move from empty, rough, or stale into usable state
- what a later session gains from that work

## Scenario Index

| Scenario | Best for | Highlights |
| --- | --- | --- |
| Solo greenfield kickoff | New project, one contributor | First-session framing, minimum viable setup, resumable start |
| Brownfield recovery without forced rewrites | Existing repository | Reverse discovery, selective promotion, phase recovery |
| Shared team workspace with separate personal context | Multi-contributor work | Shared truth, personal workspaces, proposal boundaries |
| Tool switching without context reset | Multiple AI tools on one project | Common `.cowork/` state, consistent resume quality, no assistant-specific memory |
| Release preparation from source state | Handoff or release week | Pre-release harvest, verification evidence, export planning |
| Clean handoff before context saturation | Long or messy sessions | Session-end enrichment, project-state guardrails, durable next start |

## Solo Greenfield Kickoff

### Situation

Mina is starting a small internal automation tool.
There is no backlog yet, no architecture yet, and no useful chat history to preserve.
What she wants is not a fully documented project on day one.
She wants the second session to begin faster than the first.

### Starting state

- The framework files have been copied into the project root from `frameworks/ko/`
- `AGENTS.md` is available to the active tool
- `.cowork/06_evolution/project_state.md` exists but still contains only minimal setup information
- No `INT-*`, `MS-*`, `TASK-*`, or `ADR-*` instances have been created yet

### What happens

1. Mina starts a session through the tool entrypoint and asks the AI to restore the framework state.
2. The AI reads the smallest useful set first: `AGENTS.md`, `.cowork/cowork.md`, `.cowork/06_evolution/project_state.md`, and `.cowork/02_project_definition/deliverable_plan.md`.
3. Because this is a first greenfield session, the AI does not demand every document up front. It asks only enough questions to establish project type, language choices, visualization mode, likely scope shape, and the first useful objective.
4. The first durable project purpose lands in `.cowork/02_project_definition/intent_registry.md` and, if needed, the first `INT-*` instance.
5. Rough needs settle into early entries in `.cowork/02_project_definition/requirement_spec.md` and possibly `.cowork/02_project_definition/functional_spec.md`.
6. A fresh session log is opened under `.cowork/members/<name>/workspace/session_logs/` so temporary thinking, open questions, and loose notes have a home that is not mistaken for canon.
7. Before the session ends, `.cowork/06_evolution/project_state.md` is updated with the active phase, the first active intent, and the next recommended starting point.

### Primary artifacts that visibly move

- `.cowork/06_evolution/project_state.md`
- `.cowork/02_project_definition/intent_registry.md`
- `.cowork/02_project_definition/intents/INT-*.md`
- `.cowork/02_project_definition/requirement_spec.md`
- `.cowork/02_project_definition/deliverable_plan.md`
- `.cowork/members/<name>/workspace/session_logs/session_*.md`

### What the next session gains

The next session does not start by re-explaining the project.
It starts with a visible intent, an initial phase, a live session log, and a short next-step trail.
The framework has not made the project heavy.
It has made the project resumable.

## Brownfield Recovery Without Forced Rewrites

### Situation

Jae installs the framework into an existing repository that already contains code, a partial README, some issue notes, and a few architecture sketches.
The team is already building, but nobody can confidently say whether the project is still in Design, already in Build, or halfway into Verify.

### Starting state

- The repository already has meaningful artifacts outside `.cowork/`
- The framework has been copied in, but the framework documents are mostly empty or generic
- The most urgent need is phase recovery and shared orientation, not perfect re-documentation

### What happens

1. The AI is asked to treat the project as brownfield and inspect the existing repository before inventing new structure.
2. It restores framework context first, then reads the high-value brownfield signals: the project README, current backlog or task list, recent implementation areas, architecture notes, and any existing release or operational material.
3. Instead of rewriting old documents for style alone, the AI extracts stable facts and promotes only those facts into the right framework destinations.
4. The current phase is recorded in `.cowork/06_evolution/project_state.md` as the best present reading of the project, even if some uncertainty remains.
5. The first recovered intent, milestone direction, and active tasks are reflected into the appropriate registries.
6. Any raw imported material that still matters but is not yet trusted as project truth is parked in `.cowork/06_evolution/imported_context/` rather than copied directly into canonical documents.
7. The session ends with a smaller number of reliable shared facts, plus a clear list of what still needs confirmation.

### Primary artifacts that visibly move

- `.cowork/06_evolution/project_state.md`
- `.cowork/02_project_definition/intent_registry.md`
- `.cowork/04_implementation/milestone_registry.md`
- `.cowork/04_implementation/task_registry.md`
- `.cowork/06_evolution/imported_context/imported_*.md`
- `.cowork/members/<name>/workspace/session_logs/session_*.md`

### What makes this scenario valuable

The framework does not win by replacing the old project history.
It wins by making the next session less ambiguous than the previous one.
Brownfield adoption succeeds when the team can finally answer, "Where are we now, what is active, and what is still uncertain?"

## Shared Team Workspace With Separate Personal Context

### Situation

Mina is shaping the design.
Jae is implementing the current milestone.
Ara is reviewing quality and verification gaps.
They all touch the same repository, but they should not overwrite one another's temporary thinking.

### Starting state

- Shared framework state already exists under `.cowork/`
- Each contributor has or is ready to receive a personal workspace under `.cowork/members/<name>/workspace/`
- The current milestone has enough shape that parallel work is realistic

### What happens

1. The shared project view remains in canonical and registry documents such as `.cowork/06_evolution/project_state.md`, `.cowork/04_implementation/milestone_registry.md`, and `.cowork/04_implementation/task_registry.md`.
2. Each contributor keeps temporary notes, carry-over work, and session logs in a personal workspace instead of crowding the shared documents.
3. Mina records a durable design choice in `.cowork/03_design_artifacts/interface_contract.md` and, if the impact is large enough, in `.cowork/03_design_artifacts/adr_registry.md` plus an `ADR-*` instance.
4. Jae updates task state in the task registry and task instance, while implementation-side scratch notes stay in the current session log until they deserve promotion.
5. Ara adds validation direction to `.cowork/05_verification/test_strategy.md` and links concrete outcomes into `.cowork/05_verification/verification_evidence.md`.
6. If someone wants to change structure or introduce a new canonical artifact, the work pauses for proposal mode instead of quietly changing the framework's shape.
7. At session end, important accepted outcomes flow back into shared documents, while personal notes remain personal unless they become durable project truth.

### Primary artifacts that visibly move

- `.cowork/06_evolution/project_state.md`
- `.cowork/04_implementation/task_registry.md`
- `.cowork/04_implementation/tasks/TASK-*.md`
- `.cowork/03_design_artifacts/interface_contract.md`
- `.cowork/03_design_artifacts/adr_registry.md`
- `.cowork/05_verification/test_strategy.md`
- `.cowork/05_verification/verification_evidence.md`
- `.cowork/members/team_board.md`
- `.cowork/members/<name>/workspace/my_state.md`
- `.cowork/members/<name>/workspace/session_logs/session_*.md`

### What the team gains

The project has one shared memory without forcing one shared scratchpad.
That is the important separation.
Shared truth remains readable.
Personal working context remains useful.
Collaboration becomes additive instead of noisy.

## Tool Switching Without Context Reset

### Situation

Mina starts the day in Codex on her desktop.
Later she opens the same repository in Gemini on a laptop while traveling.
That evening she checks one more detail in Claude Code.
The framework only works if all three sessions feel like the same project rather than three separate conversations.

### Starting state

- The repository already has synchronized entrypoint files
- `.cowork/06_evolution/project_state.md` is current
- The latest session log contains the most recent temporary context

### What happens

1. Codex begins by restoring from `AGENTS.md`, `.cowork/cowork.md`, `.cowork/06_evolution/project_state.md`, and the latest session log.
2. During the session, meaningful outcomes are written back into the right phase documents instead of staying trapped in the Codex conversation alone.
3. When Mina later opens Gemini, Gemini reads `GEMINI.md` but lands on the same `.cowork/` state, not on a Gemini-specific memory store.
4. The same active phase, active task, language and visualization settings, and next-start point appear again because they live in files, not only in the previous assistant's context window.
5. If Claude Code joins later, Claude sees the same durable state and continues from the same project memory model.

### Primary artifacts that visibly matter

- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.github/copilot-instructions.md`
- `.cowork/06_evolution/project_state.md`
- `.cowork/members/<name>/workspace/session_logs/session_*.md`
- The currently active phase documents

### What the team gains

Tool switching stops being a reset event.
Different assistants may still differ in style or strength, but they are no longer forced to rediscover the project from zero.
The project context becomes portable because the memory lives in the repository.

## Release Preparation From Source State

### Situation

The team has reached the end of a milestone.
Implementation is mostly done, but release week always creates the same anxiety:
which requirements were actually verified, which documents are required for handoff, and which changes are important enough to summarize?

### Starting state

- Tasks are mostly done, but some results may still live only in session logs or review notes
- Verification evidence exists, but may not yet be fully consolidated
- Deliverables have been negotiated earlier in `.cowork/02_project_definition/deliverable_plan.md`

### What happens

1. The team signals that release or handoff preparation is beginning.
2. Before generating release-facing output, the AI performs a pre-release harvest: missing accepted outcomes are pulled out of logs and reflected into source documents.
3. `.cowork/05_verification/verification_evidence.md` becomes the visible index of what the team can actually prove, not just what the team believes.
4. `.cowork/05_verification/quality_gate.md` is used to evaluate readiness explicitly instead of relying on a vague sense that things are probably fine.
5. `.cowork/07_delivery/export_spec.md` and `.cowork/02_project_definition/deliverable_plan.md` determine which official outputs should actually be produced.
6. Release communication is drafted in `.cowork/07_delivery/release_note.md`.
7. User-facing and operations-facing outputs are produced only if the project's deliverable plan says they matter.

### Primary artifacts that visibly move

- `.cowork/05_verification/verification_evidence.md`
- `.cowork/05_verification/quality_gate.md`
- `.cowork/07_delivery/export_spec.md`
- `.cowork/02_project_definition/deliverable_plan.md`
- `.cowork/07_delivery/release_note.md`
- `.cowork/07_delivery/user_manual.md`
- `.cowork/07_delivery/operation_guide.md`
- `.cowork/members/<name>/workspace/session_logs/session_*.md`

### What the team gains

Release preparation becomes a structured harvesting and verification exercise, not a last-minute scramble across old chat threads.
The framework does not promise a frictionless release.
It promises a release built from inspectable project state.

## Clean Handoff Before Context Saturation

### Situation

A debugging session has gone long.
Three hypotheses have failed.
There are partial fixes, temporary logs, and too many details in short-term memory.
The danger is not only fatigue.
The danger is that the next session will inherit confusion instead of clarity.

### Starting state

- The active session log contains a large amount of transient detail
- Some findings are stable, others are still speculative
- The AI can feel retrieval quality starting to degrade

### What happens

1. Instead of forcing one more leap forward, the AI shifts into handoff mode.
2. Stable outcomes are promoted into the right destination documents.
3. Unresolved hypotheses remain in the session log or in clearly marked follow-up questions rather than being promoted as fact.
4. `.cowork/06_evolution/project_state.md` is reduced to a high-signal summary: current status, active blockers, and the next best start.
5. If the session produced a durable lesson that will matter again, the insight is harvested into `.cowork/06_evolution/knowledge_base.md` rather than left buried in raw notes.
6. If the work exposed a process problem rather than only a technical one, the reflective lesson can land in `.cowork/06_evolution/retrospective.md`.

### Primary artifacts that visibly move

- `.cowork/members/<name>/workspace/session_logs/session_*.md`
- `.cowork/06_evolution/project_state.md`
- `.cowork/06_evolution/knowledge_base.md`
- `.cowork/06_evolution/retrospective.md`
- The active task or verification documents if stable facts were confirmed

### What the next session gains

The next session does not inherit the full emotional and cognitive mess of the previous one.
It inherits a cleaned boundary:
what is known, what is not known, and where to resume first.

## Pattern Across All Scenarios

Across all of these flows, the framework keeps repeating the same discipline:

- restore only the highest-value context first
- route information to the right document type
- promote durable facts, not raw conversation
- keep shared truth separate from personal scratch work
- leave every session in a state that a different tool or a future teammate can resume

That is the real promise behind the framework.
It is not that every session becomes shorter.
It is that fewer sessions are wasted rebuilding what the project already knew.
