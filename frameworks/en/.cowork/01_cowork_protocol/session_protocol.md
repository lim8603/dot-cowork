# Session Protocol

> Protocol for session start, in-progress work, pause, and end that preserves continuity of work

---

## Purpose

AI session memory resets between sessions. This protocol defines context-preservation and handoff rules so the team can **continue work from any point**.

---

## Operating Principles: Invariant Rules And AI Discretion

### Invariant Rules

- The Human has final decision authority.
- Treat `.cowork/` documents as the project's shared source documents.
- Record confirmed facts, working assumptions, and open items separately.
- Major decisions and release deliverables must remain traceable through related documents, ADRs, and session logs.

### AI Discretion Area

- The AI may improve document structure, summary style, question order, and official-deliverable wording.
- As model capability improves, it may suggest better planning, documentation, and official deliverable generation methods.
- If documents become oversized or selective loading becomes necessary, the AI may propose promotion into a registry + instance structure, but the actual structure change still requires Human approval.
- Better approved ways of working should be reflected back into the cowork documents so the framework itself can evolve.

---

## Document Role Operating Rules

| Role | Representative Examples | Operating Rule |
|---|---|---|
| Governance | `cowork.md`, `session_protocol.md`, `quality_gate.md` | Use only as rule documents, not as storage for project data |
| Canonical | `requirement_spec.md`, `domain_model.md`, `deliverable_plan.md`, `project_state.md` | Accumulate updates directly in the same path |
| Registry | `intent_registry.md`, `adr_registry.md`, `milestone_registry.md`, `task_registry.md` | Load first at session start and keep status / link summaries concise |
| Instance | `intents/INT-*.md`, `user_stories/US-*.md`, `adrs/ADR-*.md`, `milestones/MS-*.md`, `tasks/TASK-*.md` | Create a new file whenever a new object appears |
| Template | `templates/*_template.md` | Copy only; never use directly as the working record |
| Log / Archive | `members/<name>/workspace/session_logs/`, `imported_context/` | Append-only evidence store that is not loaded by default |

### Default Operating Rules

- Only files ending in `_template.md` are copy templates.
- `Phase` is the framework's fixed stage; `Milestone` is a project-specific intermediate completion unit.
- `Intent -> Milestone -> Task` is the work-breakdown axis, while `User Story` and `ADR` act as cross-reference axes.
- Imported context should be reflected into source documents only after the required facts are extracted.
- Tool-specific approval models, entrypoint sync, and network / download-dependent behavior follow `tooling_environment_guide.md` together with the current tool's entrypoint document.

---

## Session Lifecycle

### 1. Session Start

- [ ] Check project existence, current phase, active intent, active milestone, open questions, and next starting point in `.cowork/06_evolution/project_state.md`.
- [ ] Confirm project type, team-setup mode, conversation language, working document language, official deliverable language, and visualization mode in `project_state.md`.
- [ ] Check whether the current user's `.cowork/members/<name>/` folder and workspace exist.
- [ ] **Member confirmation and initialization**: if the current user folder does not exist, confirm the user's name / identifier and create `profile.md`, `workspace/`, `my_state.md`, and `session_logs/` first. In a team project, confirm role and ownership area; in a solo project, apply the solo default.
- [ ] If the current user workspace already exists, restore personal work context from `members/<name>/workspace/my_state.md`.
- [ ] If the current user workspace already exists, restore prior context from the latest session log.
- [ ] In a team project, review role and task assignment status in `.cowork/members/team_board.md`.
- [ ] Check confirmed deliverables and missing data in `deliverable_plan.md`.
- [ ] **Selective context loading**: according to the Context Loading Guide in `project_state.md`, load the registries and canonical documents needed for the current phase first. Rule documents such as `cowork.md` and `session_protocol.md` are learned once in the first session and then reopened only when needed.
- [ ] Review `06_evolution/imported_context/` only when necessary, and extract the needed facts rather than using raw text as a source document.
- [ ] **Automatically create the session log file** only after member confirmation and prior-log review are complete: `members/<name>/workspace/session_logs/session_YYYY-MM-DD_NNN.md`.
- [ ] **Automatically configure `.gitignore`** if the session-log ignore rule is missing.
- [ ] **Check proposals**: if `members/*/proposals/` contains `Pending` proposals, notify a Master-authority user.
- [ ] **Check tool execution constraints**: confirm tool-specific environment limits such as approval flow, whether file/shell execution is available, and whether network access is available through the current tool's entrypoint and `tooling_environment_guide.md`.
- [ ] **Decide the start path**: if the session has enough information to resume, enter through the briefing directly. If essential project information is missing or contradictory, run the short onboarding in §1A first.
- [ ] **Announce the available keywords** briefly.
- [ ] **Automatically print the session briefing** with project status, active Intent / Milestone, active Task list, and carry-over items in a role-based view. (§1D)
- [ ] **Select work and determine mode** by matching the Human's response or opening utterance against the briefing. (§1D)
- [ ] Draft the work plan (AI proposes -> Human approves).

### 1A. Project Archetype Kickoff

If session-start diagnosis matches one of the cases below, the AI should lock the minimum context with the onboarding questions below before printing the briefing.

- `project_state.md` does not exist or its core fields are empty enough that a resume point cannot be identified.
- The current user workspace was newly created and core project information is still insufficient.
- Key information across existing documents is contradictory, or the Human wants to reframe the project from scratch.

#### Minimum Onboarding Questions

- What is the project name and one-line goal?
- Is this project a greenfield build or a brownfield extension / maintenance effort?
- What is the real current phase, or where should this session start? (`Define / Design / Build / Verify / Evolve / Deliver`)
- What is the highest-priority goal that must be achieved in this session?
- What is currently blocked, what needs a decision, and what special constraints exist?
- When needed, what are the conversation language, working document language, official deliverable language, and visualization mode?

#### Minimum Onboarding Rules

- Do not ask again for answers that are already visible in `project_state.md`, the latest session log, or approved source documents.
- If only member-folder creation is missing, do not expand into full onboarding. Confirm only the minimum information such as user identifier and role / ownership area first.
- If the question set would exceed five questions or the Human prefers asynchronous preparation, the AI may offer a brief file such as `.cowork/06_evolution/imported_context/human_onboarding_brief.md` as an option.
- A brief file is supporting input only. The AI must extract the needed facts into source documents such as `project_state.md`, `deliverable_plan.md`, and `requirement_spec.md` before using them as the working source.
- Creating a brief file is optional. If the Human can answer quickly, keep onboarding conversational.

After onboarding, the AI reflects the results into `project_state.md` and the related source documents, runs §1B and §1C when needed, and continues into the §1D briefing.

#### A) Greenfield

- Follow the default lifecycle (`DEFINE -> DESIGN -> BUILD -> VERIFY -> EVOLVE -> DELIVER`).
- Start from requirement elicitation and apply deliverables and quality gates phase by phase.

#### B) Brownfield

Proceed in the following order.

1. **Reverse Discovery**: collect current behavior, constraints, dependencies, and unresolved issues from code, documents, and history.
2. **Gap Elicitation**: ask developers for information that cannot be discovered automatically, and ask the Human about goals, priorities, and completion criteria.
3. **Phase Alignment**: confirm which of `Define / Design / Build / Verify / Evolve / Deliver` best describes the current state and reflect it into `project_state.md`.
4. **Execution Contract**: align on session scope, allowed change range, verification criteria, and approval points.

In brownfield work, do not restart from requirements by default. Restore current state first and then propose the minimum-change path.

### 1B. Team Setup Confirmation

Once team setup is known through Session Start or §1A, align the team situation through the branches below.

**B-1) Established Team**

1. Identify each team member's name, role, and capabilities.
2. Assign real team members directly in the role registry of `team_board.md`.
3. When assigning Tasks, distribute work based on team capability and dependency order.
4. If the AI judges that the current team is insufficient based on workload analysis, it may **propose an additional virtual role slot**.
   - Example: "The project has three people right now, but if frontend and backend split cleanly we likely need Role-D dedicated to frontend."
   - Register the slot only after Human approval.

**B-2) Role-Slot Planning**

1. The AI analyzes tech stack, feature area, and workload, then proposes the **required role slots**.
2. After Human approval, register the role slots in `team_board.md`.
3. Assign Tasks to roles rather than named people.
4. Leave the assignee field blank in the form `(Role-A assignee)` until a real person takes it.

**B-3) Matching When New Members Join**

1. When a new member joins, the AI shows the unassigned role list from the role registry.
2. Compare the member's capability to role requirements and propose a match.
3. After Human approval:
   - update the assigned member in the role registry
   - reflect the assignee to every Task for that role
   - create `members/<name>/workspace/my_state.md` and pre-fill assigned Task items
   - record the role-matching history
4. If a single role becomes too large, the AI may propose a role split (`Role-B` -> `Role-B1 + Role-B2`).
5. One member may cover multiple roles in a small team.

**B-4) Solo Project**

- Do not create `team_board.md` dynamically during operation.
- Keep shared project state centered on `project_state.md`, but use the same session-log structure as a team project: `members/<name>/workspace/session_logs/`.
- Even in a solo project, create `.cowork/members/<name>/profile.md` and `members/<name>/workspace/my_state.md` so session resume stays stable.
- Use the creation order `confirm identifier -> create profile.md -> create my_state.md -> align key fields with project_state.md`.
- Start with `Authority = Master`, `Role = Project Owner`, and `Ownership Area = Whole Project`, then refine the wording later if needed.

### 1C. Deliverable Negotiation

Once the Intent and requirements start to take shape early in Define, the AI negotiates the deliverable scope.

#### Trigger Conditions

- initial project setup (right after Archetype Kickoff)
- when the Intent changes materially through a Pivot or Split

#### AI Automatic Actions (Deliverable Negotiation)

1. **Project profiling**: analyze project type, UI presence, DB usage, external delivery, team size, and operating environment.
2. **Deliverable proposal**: for each of the default recommended 14 deliverables in `deliverable_plan.md`, propose `Required / Recommended / Not Applicable`.
3. **Human approval**: the Human reviews and accepts or adjusts the proposal.
4. **Record the confirmation** in `02_project_definition/deliverable_plan.md`.
5. **Plan data collection**: identify missing data for each confirmed deliverable and plan how to collect it through questions, code analysis, or external references.

#### Goal-Driven Data Acquisition

After the deliverable set is confirmed, the AI behaves as follows in later sessions.

- Check the missing-data list in `deliverable_plan.md` at session start.
- Treat **missing data for confirmed deliverables** as priority 0 in the §13 question priority.
- Ask for that data naturally during the Execute cycle.
- Update the collection state in `deliverable_plan.md` when the data is gathered.

#### Mandatory Question Set Before Exiting DEFINE

Before moving from Define to Design, verify that the source documents answer the following.

- What core problem does this project solve, and what outcome is expected?
- What is explicitly out of scope in the current range?
- What is Must-priority right now?
- What counts as done or acceptable?
- What are the known key risks, constraints, and external dependencies?
- Is the required deliverable plan and missing-data list aligned?

#### DEFINE Question-Set Operating Rules

- Do not repeat the same answer in new prose blocks. Judge completion through the state reflected in `requirement_spec.md`, `functional_spec.md`, `user_story_registry.md`, `risk_register.md`, `deliverable_plan.md`, `project_state.md`, and related source documents.
- At Gate 1, answers or open questions for the set above must at least be visible.
- At Gate 2, Must priorities, acceptance criteria, key risks, and required deliverable plan should be closed. Any remaining item must have a Human-approved deferral reason and a next collection plan written in `project_state.md` or the related source document.
- If the Human does not know the answer yet, do not block blindly. Record what is missing and why it is deferred, then raise it as a priority check for the next session.

### 1D. Session Briefing And Mode Selection

The first response of the session follows this order: **show the session-start diagnosis -> run short onboarding if needed -> print the briefing and match the opening utterance (or ask the Human to choose)**.

- If resumable information is already sufficient, print the briefing first.
- If core project information is missing, run the minimum onboarding in §1A first and then continue into the briefing immediately once the answers are clear.
- In other words, the briefing is the default, but it never comes before the minimum information needed to work.

No matter how the Human starts the session (`let's start`, `continue the auth API`, `let's do TASK-003`, and so on),
the AI first determines the start path, then matches the utterance after the briefing.

#### Briefing Structure

The AI reads the available source documents discovered during Session Start (`project_state.md`, `team_board.md` for team projects, `my_state.md` when it exists, and the latest session log) and prints the briefing in the following form.

**Shown to a Master:**
```text
Project: [Project Name]
  Phase: [Current Phase] | Status: [Green/Yellow/Red]
  Active Intent: [INT-NNN] ([Title])
  Active Milestone: [MS-NNN] ([Title])

Active Tasks:
  TASK-001  [Title]  [Linked MS]  [Assigned Role] ([Assignee])  [Status]
  TASK-002  [Title]  [Linked MS]  [Assigned Role] ([Assignee])  [Status]
  ...

Carry-over: [summary]
Last session: [date]

What would you like to work on?
```

**Shown to a Member:**
```text
Project: [Project Name]
  Phase: [Current Phase] | Status: [Green/Yellow/Red]
  Active Intent: [INT-NNN] ([Title])
  Active Milestone: [MS-NNN] ([Title])

My Tasks:
  TASK-003  [Title]  [Linked MS]  [Status] ([progress detail])
  TASK-004  [Title]  [Linked MS]  [Status]

Overall Progress: [INT-NNN] / [MS-NNN] [N]% ([done/total] Tasks)
Carry-over: [summary]
Last session: [date]

What would you like to work on?
```

#### Difference: Master vs Member

| | Master | Member |
|---|---|---|
| Task list | Whole Task list + linked Milestone + assignment state + unassigned Tasks | Own Tasks first, plus linked Milestone and status |
| Project-wide work | Can start it directly | Try matching assigned Tasks first; otherwise guide the member |
| Unassigned Tasks | Visible and assignable | Visible, but choosing one triggers guidance |

#### Utterance Matching Rules

| Human Utterance | AI Action |
|---|---|
| vague start such as `let's start` | briefing -> `What would you like to work on?` |
| mentions a concrete piece of work | briefing -> match -> `Is this the Task you mean?` |
| direct `TASK-ID` | briefing -> confirm immediately -> proceed |
| no match found | briefing -> `No such Task exists. Would you like to register it as a new Task?` |
| number only (`number 3`) | briefing -> match against the Task list -> confirm -> proceed |

#### Working-Mode Decision

```text
Receive Human response
    |
Is a TASK-ID specified?
  |- Yes: enter individual Task mode (Master or Member)
  |   -> record session intent in my_state.md and load the Milestone context linked to that Task
  |- No:
      |- Is the user a Master?
      |  |- Yes: enter project-wide mode
      |  |- No (Member):
      |      -> attempt a match within assigned Tasks
      |      -> if matched: confirm and enter individual Task mode
      |      -> if not matched: explain that no assigned Task matches,
      |         then guide the member toward an assigned Task or a request for new assignment
```

#### Behavior In Solo Projects

In a solo project, the briefing is simplified.

- Because `team_board.md` is not part of normal solo operation, show only the active Intent, active Milestone, and active Task list from `project_state.md`.
- Skip role-based mode branching and move directly into the work.
- Aside from that simplification, the flow stays almost the same.

### 2. Session In-Progress

- Work proceeds through the `Plan -> Approve -> Execute` cycle.
- During Execute, the AI records significant decisions, changed files, blockers, and approval or rejection results in the session log.
- When information satisfies the current phase's Phase Document Map, the AI reflects it into the relevant source documents immediately or at the end of the Execute cycle.
- If work splits across multiple Tasks, keep the active Task summary in `project_state.md`, `task_registry.md`, and the related Task detail documents aligned.
- When a blocker, major risk, or approval point appears, pause and ask the Human rather than guessing.

### 3. Session Pause

- If work must pause temporarily, record enough state in the session log that the exact point of interruption can be resumed.
- At minimum, capture the current Task, current step, blocker, next action, and whether Human confirmation is needed.
- Update `project_state.md` when the pause changes the real active Task, risk, or next starting point.

### 4. Session End

- When the Human says `wrap up`, run the Session End Enrichment Check first.
- Close the current session log with summary, carry-over items, decisions, and next-session context.
- Sync `project_state.md` with next starting point, Human confirmation items, and current high-signal status.
- Sync the member's `my_state.md` with assigned work, carry-over items, and referenced session log.
- In team projects, sync `team_board.md` as needed when task state or assignee state changed.

#### Missing-Input Handling Before The First Session Ends

If the very first session still has major missing input, do not force a gate pass.
Instead:

- record what is missing and why it remains open
- leave the next collection plan in `project_state.md` and the session log
- mark the next starting point so the following session can continue from the missing input rather than starting over

---

## Auto-Recording Rules

### 1. Session Logs And State Indexes

- Create the session log automatically at session start.
- Record major decisions, file changes, approval / rejection, blockers, and next actions without waiting for a separate request.
- Treat `project_state.md`, `my_state.md`, and `team_board.md` as synchronized indexes rather than independent narrative documents.
- Keep raw activity detail in session logs; keep shared resume information in the state indexes.

#### Temporary Working Notes

- Temporary work notes such as migration notes, rollout notes, integration notes, or diagnostic notes should be written into the session log first.
- Promote them only when they become repeatedly referenced or when they need to become a source-document rule.
- One-off scratch notes should stay in the session log and should not be promoted by default.

#### Shared State Index Management (`project_state.md`)

- Update it whenever the active phase, active Intent, active Milestone, active Task, next starting point, or current risk level changes in a meaningful way.
- Keep only the high-signal summary there; push deeper context into registries, detail documents, or session logs.
- If a section becomes long, compress it into summary form and point to the relevant source documents.

#### Imported Context Management (`imported_context/`)

- Store copied external conversations, memos, or transcripts there first.
- Do not use raw imported context as an authoritative source document.
- Extract only the necessary facts into canonical, registry, or instance documents before relying on them.

#### Personal State Index Management (`my_state.md`)

- Use `my_state.md` as the member-level resume index.
- Keep it aligned with the member's assigned Task state, next starting point, carry-over items, and reference session logs.
- For solo projects, use the same file to preserve a stable session-resume path even though team complexity is lower.

#### Session Intent Management

- Record the current session's goal in the Session Intent section of `my_state.md` when a member-specific or solo-work session begins.
- Distinguish Session Intent from project-level Intent.
- Update the session result at the end as `Completed / Carry-Over / Interrupted`.

#### Context Window Guard

When context-window quality starts to degrade, the AI should guide the work into a clean handoff rather than continuing blindly.

##### Detection Signs

- the same source documents need to be reopened repeatedly because working memory is unstable
- the conversation starts looping or losing important constraints
- too many unresolved branches accumulate in the same session
- the AI cannot keep the current active Task, next action, and approval state clearly aligned

##### AI Action

1. warn that context quality is dropping and recommend a session handoff
2. run the Enrichment Check before handing off
3. synchronize `project_state.md`, `my_state.md`, and the session log
4. tell the Human exactly how to resume in the next session

##### Cautions (Context Window)

- Do not force a handoff too early when the current work can still be completed cleanly.
- Do not open a new session without leaving enough state for the next session to resume safely.
- Treat handoff as a quality-preservation action, not as a failure.

#### Recording Principles

- Prefer concise structured facts over narrative duplication.
- Leave only the level of detail needed to resume work, justify decisions, or preserve traceability.
- Avoid copying the same fact into multiple source documents when a single summary plus cross-reference will do.

### 2. Automatic Changed-File Tracking

- Whenever a file is created, updated, or deleted, add it to the changed-files section of the current session log.
- Record the change type and a one-line summary of why the file changed.
- For large work, keep the session-log change list updated as work progresses rather than reconstructing it at the end.

### 3. Automatic ADR Creation

- When the Human uses phrasing such as `let's go with ...` or `decide on ...`, or when a major design decision is clearly approved, create the ADR automatically.
- Register the ADR in `adr_registry.md` and link it to related Intent, Milestone, and source documents.
- Do not promote every design note to ADR; follow the ADR need criteria in the ADR template.

### 4. Automatic ID Assignment

- Auto-number `INT-*`, `US-*`, `ADR-*`, `MS-*`, `TASK-*`, and `PROP-*` by scanning the existing relevant folder or registry first.
- Never reuse an old ID.
- Keep the registry entry and detail-document filename aligned with the assigned ID.

### 5. Shared Context Synchronization Principles

- `project_state.md` is the shared resume index for the whole project.
- `team_board.md` is the team-level assignment board.
- `my_state.md` is the member-level resume index.
- Session logs store detailed evidence and execution history.
- Whenever the same state appears across multiple layers, keep the meaning aligned and let the deeper context live only once.

### 6. Automatic Quality Gate Check (Quality Gate)

- When the Human says `let's move to ... phase`, run Pre-Gate Harvest before gate judgment.
- Check the relevant gate in `quality_gate.md` and report whether the gate is ready, blocked, or partial.
- If the gate is blocked, list the blocking items and the source documents that need attention.
- If the Human still wants to move forward with an exception, record the reason and follow-up plan in the session log and relevant state documents.

### 7. Knowledge Base / Retrospective Accumulation Criteria

- Promote reusable insights only when they are stable enough to help future sessions or future work.
- Promote retrospective findings only when the scope is clear and the follow-up actions are concrete.
- Leave unconfirmed hypotheses, copied raw notes, one-off debugging traces, and duplicated content in the session log.
- Before promotion, check whether a similar item already exists to avoid duplication.
- Keep `knowledge_base.md` and `retrospective.md` summary-first, and review splitting when their accumulation thresholds are hit.

### 8. Using Reference Sites In UI Discussion

- When UI discussion begins, ask the Human for similar reference-site URLs if they have them.
- If the Human provides URLs, analyze layout, color, and UX patterns and summarize the result.
- Record the agreed summary in the reference section of `ui_spec.md` after Human approval.
- If UI discussion remains abstract without references, proactively suggest that reference sites would help.

### 9. Automatic Member Profile Management

- If the current user's folder does not exist under `.cowork/members/` at the first session start:
  - confirm the name and the identifier to use as the folder name
  - in a team project, ask for role and ownership area
  - in a solo project, use `Authority = Master`, `Role = Project Owner`, and `Ownership Area = Whole Project` as defaults
  - create `.cowork/members/<name>/profile.md` from `profile_template.md`
  - create `.cowork/members/<name>/proposals/`
  - create `.cowork/members/<name>/workspace/my_state.md` from `my_state_template.md`
  - create `.cowork/members/<name>/workspace/session_logs/.gitkeep` for the session-log folder
- Authority is divided into `Member` and `Master`.

### 10. Change Proposal Management

- When a team member needs to change the shared area (`01~07/`), they use the `proposal` keyword.
- The AI creates `.cowork/members/<name>/proposals/PROP-NNN_[summary].md` from `proposal_template.md`.
- IDs are assigned automatically by scanning the members folders.
- At the start of a Master session, pending proposals are announced automatically.
  - Approved: the AI reflects the change into the shared area and updates the Proposal status to `Approved`.
  - Rejected: the AI records the reason and updates the Proposal status to `Rejected`.

### 11. Automatic Official Deliverable Generation

When the Human says `release`, `generate docs`, or `export`, proceed in the following order.

1. **Pre-Release Harvest**: run the same harvesting idea as §12 across all phases to fill source documents as much as possible.
2. **Quality Gate 5 check**: verify release readiness against `quality_gate.md`. If something is missing, warn the Human and proceed only with explicit confirmation.
3. **Generate deliverables**: create the active default 14 deliverables and approved extension deliverables (15+) into `docs/` according to `deliverable_plan.md` and `export_spec.md`.
   - direct generation: reorganize cowork source documents into official-document form
   - synthesis: combine multiple source documents into a single official document
   - official deliverable format is not rigid template cloning; the AI may improve structure so long as the invariant rules in `export_spec.md` are preserved
- Exclude default recommended items marked `Not Applicable` and unapproved extension items.
- Record the generated file list in the session log.
- If a required source document is empty, do not create an empty official document silently. Leave an explicit warning such as `Missing source document: [file]` in the generation report.

### 12. Phase-Bound Progressive Enrichment

The AI automatically adds information that appears during the conversation into the source documents that belong to the **current phase**, even without a manual request.

#### Phase Document Map

| Phase | Target Source Documents | Collection Condition |
|-------|-------------------------|----------------------|
| **1: DEFINE** | `02_project_definition/intent_registry.md` + `02_project_definition/intents/INT-*.md` | register the active Intent and fill its detail after onboarding |
| | `02_project_definition/requirement_spec.md` | whenever functions or constraints are decided |
| | `02_project_definition/domain_glossary.md` | whenever a domain term is used for the first time |
| | `02_project_definition/functional_spec.md` | whenever feature behavior is confirmed |
| | `02_project_definition/user_story_registry.md` + `02_project_definition/user_stories/US-*.md` | whenever a requirement in the form of "must / needs to" appears |
| | `02_project_definition/risk_register.md` | whenever a risk or concern is raised |
| **2: DESIGN** | `03_design_artifacts/domain_model.md` | whenever entities and relationships are defined |
| | `03_design_artifacts/interface_contract.md` | whenever interface or inter-module contracts are decided |
| | `03_design_artifacts/data_model.md` | whenever data structure or schema is decided |
| | `03_design_artifacts/adr_registry.md` + `03_design_artifacts/adrs/ADR-*.md` | whenever a design decision is approved |
| | `03_design_artifacts/ui_spec.md` | whenever screens or UI behavior are confirmed |
| **3: BUILD** | `04_implementation/milestone_registry.md` + `04_implementation/milestones/MS-*.md` | whenever a meaningful intermediate completion unit is agreed or milestone detail is confirmed |
| | `04_implementation/task_registry.md` + `04_implementation/tasks/TASK-*.md` | whenever an Execute-cycle task is approved or resumable detail needs to be recorded |
| **4: VERIFY** | `05_verification/test_strategy.md` | whenever the testing approach is decided |
| | `05_verification/test_case.md` | whenever validation conditions for completed functionality are discussed |
| | `05_verification/verification_evidence.md` | whenever test results, review results, NFR measurement, or release-readiness evidence should be summarized for gate decisions |
| **5: EVOLVE** | `06_evolution/retrospective.md` | whenever retrospective findings, improvement points, or process adjustments are organized |
| | `06_evolution/knowledge_base.md` | whenever reusable insights, patterns, or anti-patterns become stable |
| **6: DELIVER** | `07_delivery/operation_guide.md` | whenever deployment or operating procedures are discussed |
| | `07_delivery/user_manual.md` | whenever usage steps or user procedures are defined |
| | `07_delivery/release_note.md` | whenever externally shareable change summaries or user impacts are organized |

#### Passive Extraction

- After each Execute cycle completes, if the work produced information that matches the collection conditions above, reflect it into the relevant source document immediately.
- Do not copy the whole conversation. Record only the decided facts in structured form.
- In a registry + instance structure, put list information into the registry and detail content into the detail document.
- When a source document is updated, announce it to the Human in a short line such as `updated [file] - [summary]`.
- Do not add unconfirmed or ambiguous content.
- When needed, record working assumptions in an `Assumptions` section, items requiring confirmation in `Open Questions`, and contextual basis in `Evidence / Sources`.

#### Pre-Gate Harvest

Before a Quality Gate check triggered by `let's move to ... phase`:

1. scan the current phase's source documents against the Phase Document Map
2. if there are blank core items, backfill from the session log or ADRs where possible
3. report the filled items before running the actual gate check

#### Session End Enrichment Check

Before the session ends on `wrap up`:

- scan the current phase's source documents for still-empty core items
- if empty items remain, add them to the carry-over list and ask the Human whether to fill them now or later
- synchronize the next starting point, Human confirmation items, and key risks in `project_state.md`
- synchronize assigned work, next starting point, carry-over items, and referenced session log in the member's `my_state.md`
### 13. Proactive Elicitation

The AI should naturally ask for information that is still missing from the current phase's source documents even when the Human does not ask first.

#### Conditions

- there are still blank or weak items in the current phase's Phase Document Map
- the Execute cycle just completed, or the Human is asking what to do next
- keep it limited to **2 to 3 questions maximum per session** so it does not feel like a question barrage

#### Question Priority

Fill the current phase's source documents in the following order.

| Priority | Basis |
|---------|------|
| 0 | required-but-missing data in `deliverable_plan.md` |
| 1 | items required to pass the current Quality Gate |
| 2 | release deliverables that cannot be synthesized from other existing source documents |
| 3 | items directly related to the work currently in progress |

#### Question Style

- Do not open a separate interrogation session. Insert the question naturally into the current conversation flow.
- Example after Execute: `Before we move on, is there any external interface that is still not confirmed? I'd like to capture it in interface_contract.md while it is fresh.`
- Example during planning: `One quick thing before we continue: how will we know this feature is done? The acceptance criterion is still missing.`
- If the Human responds with `later`, `I don't know yet`, or `skip it`, stop immediately and move the item into carry-over state.

#### Offering Alternatives

- When a design decision or technology choice is happening, the AI may present a better alternative with reasoning.
- When needed, the AI may verify current external information or references before proposing the alternative.
- The Human decides whether to adopt it.

### 14. Automatic Tech-Stack Management

#### Trigger

- when a technology choice appears in conversation (`let's use TypeScript`, `let's use gRPC`, and so on)
- when existing technology is identified during brownfield Reverse Discovery

#### AI Automatic Actions (Tech Stack)

1. **Automatic ADR creation**: create `adrs/ADR-NNN_tech_[area]_[technology].md` when a technology is selected or changed.
2. **Tech-stack registry update**: register the confirmed technology in `03_design_artifacts/tech_stack.md` and link the selection ADR.
3. **Dynamic coding-convention composition**: keep only conventions that match confirmed technologies in `coding_convention.md`. Remove unused technology sections and propose new ones for newly selected technology.
4. **Entrypoint sync review**: whenever the tech stack changes, review whether the four entrypoint files and `tooling_environment_guide.md` should also be updated.

### 15. Team State Sync

Rules that synchronize personal state and shared state in team projects.

#### Upward Sync Rules

| Event | Personal `my_state.md` | `team_board.md` | `project_state.md` |
|------|------------------------|----------------|--------------------|
| Task started | status -> `In Progress` | status updated | - |
| Task completed | status -> `Done`, next starting point updated | status -> `Done` | related summary updated |
| blocker occurred | blocker recorded | note recorded | item added to Human confirmation |
| ADR created | recent decision note updated | - | recent approved decision updated |
| phase transition | - | - | phase updated |

#### Automation Triggers

| Trigger | AI Automatic Action |
|--------|---------------------|
| tech stack confirmed + role-slot planning mode | automatically propose role slots by technical area |
| feature decomposition completed + role-slot planning mode | propose supplemental role slots by feature area |
| new member profile created | show unassigned roles and propose matches |
| role match approved | bulk-update Task assignees and auto-create `my_state.md` |
| role split / merge | propose Task redistribution and update `team_board.md` |
| workload analysis on established team | propose additional virtual role slots if needed |

### 16. Framework Upgrade

Framework upgrade often depends on tools and network conditions, so the session protocol defines only the trigger and the invariant principles.

#### Trigger

- The Human says the `upgrade` keyword.

#### Source Documents

- execution path and environment-specific branching: `01_cowork_protocol/tooling_environment_guide.md`
- version chain and file classification: `.cowork/upgrade_manifest.md`

#### Shared Principles

1. Always verify installed version and target version through the `Version` / `From` chain in `upgrade_manifest.md`.
2. Apply `MERGE` items or ambiguous conflicts only after Human approval.
3. Preserve project data and update only framework structure and rules.
4. When network access is unavailable, use the archive placed under `.cowork/.upgrade/archives/v{version}/`.
5. Leave the upgrade plan and results in `.cowork/.upgrade/` and in the session log.

---

## Intent Change Management

### Change Type Classification

When Intent content needs to change, the AI first classifies the change into one of the following five types.
The key question is: **did the purpose change, or was only the expression wrong?**

| Type | Decision Basis | Response | ID Handling |
|------|---------------|----------|-------------|
| **Correction** | the purpose is the same, but the wording or scope was wrong | update the existing Intent directly | keep the same ID |
| **Refinement** | the purpose is the same, but it needs clarification because it is vague or broad | update the existing Intent directly and strengthen non-goals | keep the same ID |
| **Pivot** | the fundamental goal or direction changed | close the old Intent as `Superseded` and create a new Intent | new ID, record `Supersedes: INT-XXX` |
| **Addition** | a new purpose appears that is unrelated to the existing Intent | create an independent Intent | new ID, no parent relationship |
| **Split** | one Intent became too large and should be separated | close the old Intent as `Split` and create child Intents | new IDs, record `Parent: INT-XXX` |

### Automatic Actions On Change

1. **Classify the change**: the AI proposes the change type first and asks for confirmation.
2. **Update documents**: record the type and reason in the relevant Intent registry, detail Intent document, and session log.
3. **Check downstream impact**: scan requirements, user stories, Tasks, and other deliverables that reference the Intent, then report the impact range.
4. **For Pivot / Split**: change the old Intent status, create the new Intent document, update the active Intent in `project_state.md`, and realign the active Milestone if the old one is no longer valid.
5. **Create an ADR**: for Pivot or Split, automatically record the decision basis as an ADR.

### Intent State Transition

```text
Draft -> Approved -> Closed
  |         |
  |         |- Superseded  (replaced by a new Intent through Pivot)
  |         |- Split       (split into child Intents)
  |
  |- Superseded / Split    (possible even before approval)
```

---

## Keyword Guide

If the following keywords appear in conversation, the AI automatically performs the matching action.
Natural language is enough; no special prefix is required.

| Keyword | Automatic Action |
| --- | --- |
| `wrap up` / `done for today` / `that's it for today` | Enrichment Check -> session end handling (summary, carry-over items, next context) |
| `let's go with ...` / `decide on ...` | ADR automatically created |
| `proposal` | Change Proposal created (inside the personal proposals folder) |
| `let's move to ... phase` | Pre-Gate Harvest -> automatic Quality Gate check |
| `release` / `generate docs` / `export` | Pre-Release Harvest -> Gate 5 check -> official deliverable generation into `docs/` |
| `upgrade` | framework update based on `tooling_environment_guide.md` + `upgrade_manifest.md` |

> This list is announced briefly at the start of every session.

---

## Context Handoff Checklist

At the start of a new session, the AI automatically checks the following.

1. current phase, active Intent, active Milestone, and next starting point in `project_state.md`
2. project type, team setup mode, conversation language, working document language, official deliverable language, and visualization mode in `project_state.md`
3. whether the current user's `members/<name>/` workspace exists
4. if the workspace does not exist, create `profile.md`, `my_state.md`, and `session_logs/` first
5. if the workspace exists, restore personal work context from `my_state.md`
6. if the workspace exists, read the `Next-Session Context` section in the latest session log
7. if it is a team project, review role and Task assignment status in `members/team_board.md`
8. review missing data and required deliverable state in `deliverable_plan.md`
9. load the registries and canonical documents needed for the current phase according to the Context Loading Guide in `project_state.md`
10. if information is missing or contradictory, run the minimum onboarding in §1A
11. then print the briefing, receive the Human's work choice, and determine the working mode (§1D)

---

## Session Log Storage Structure

```text
.cowork/
├── 06_evolution/
│   ├── project_state.md             <- shared state index (tracked in VCS)
│   ├── imported_context/            <- copied conversations / raw transcripts
│   ├── templates/
│   │   └── session_log_template.md  <- session log form (reference)
│   ├── retrospective.md
│   └── knowledge_base.md
└── members/
    └── <name>/
        └── workspace/
            └── session_logs/        <- automatically created logs for each real session
                ├── session_2026-02-26_001.md
                ├── session_2026-02-26_002.md
                ├── session_2026-02-27_001.md
                └── ...
```
