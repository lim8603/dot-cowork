# [Project Name] - GEMINI.md

This project is developed with Gemini Code Assist on top of the **AI-Human Cowork Framework**.
This file is the **project context entrypoint** that Gemini reads at session start.

> OpenAI Codex and Cursor users should read `AGENTS.md` in the project root.
> Claude Code users should read `CLAUDE.md` in the project root.
> GitHub Copilot users should read `.github/copilot-instructions.md`.
> All four files share the same `.cowork/` structure.

---

## Session Start Checklist

1. Read this file (`GEMINI.md`) and understand the project context and collaboration rules.
2. Read `.cowork/cowork.md` and review the overall deliverable structure and collaboration principles. **(Learn once in the first session; skip if already familiar.)**
3. Read `.cowork/01_cowork_protocol/document_role_inventory.md` and identify whether the current document is Governance / Canonical / Registry / Instance / Template / Log. **(Learn once in the first session; skip if already familiar.)**
4. Read `.cowork/06_evolution/project_state.md` and confirm the current phase, active intent, active milestone, and next starting point. Follow the **Context Loading Guide** section in `project_state.md` to load the registry/canonical documents needed for the current phase first.
5. Confirm the conversation language, working document language, export document language, and visualization mode.
6. Check the latest personal session log under `.cowork/members/<name>/workspace/session_logs/` to restore prior context.
7. Review `.cowork/06_evolution/imported_context/` only when needed, and extract facts from it instead of using the raw text as an authoritative source.
8. If the current user's folder does not exist under `.cowork/members/`, confirm the name and create the profile and `workspace/` structure. In a team project, ask for role/ownership; in a solo project, apply the solo default.
9. If there are Pending proposals under `.cowork/members/*/proposals/`, notify a Master-authority user.
10. Briefly announce the available keywords: `wrap up`, `let's go with`, `proposal`, `let's move to ... phase`, `release`, `upgrade`.
11. Output the current project status and the active Intent / Milestone / Task list as a briefing first. (§1D)
12. Match the Human's response (or opening message) to the briefing, determine the working mode, and continue with the **Plan -> Approve -> Execute** cycle. (§1D)

---

## Core Rules

- Follow `.cowork/01_cowork_protocol/decision_authority_matrix.md` for decision authority.
- Interpret document roles and default operating rules through `.cowork/01_cowork_protocol/document_role_inventory.md`.
- Record major design decisions as ADRs (`03_design_artifacts/adrs/ADR-NNN_[summary].md`).
- Load registry/canonical documents first; refer to templates/logs/archives only when needed.
- Make structural document changes and registry promotion only after Human approval.
- Do not guess when uncertain; ask.
- Confirm the conversation language at session start (default for this template: **English**); the default visualization mode is `Disabled`, and code and commits stay in **English**.
- Follow `.cowork/01_cowork_protocol/communication_convention.md` for language policy, tone, and visualization-mode rules.
- Follow `.cowork/01_cowork_protocol/tooling_environment_guide.md` together with this entrypoint for tool-specific approval flow, entrypoint sync, and framework upgrade handling.
- Respect the Human's final decision; limit AI objections to one explicit expression of concern.
- Follow `.cowork/04_implementation/coding_convention.md` for coding conventions.

---

## Auto-Recording

Gemini automatically performs the following without separate permission:

- **At session start**: create `.cowork/members/<name>/workspace/session_logs/session_YYYY-MM-DD_NNN.md`.
- **At session start (once)**: add the session-log ignore rule to `.gitignore` if it is missing.
- **On major state changes**: update `.cowork/06_evolution/project_state.md` together.
- **At session end**: sync the owner's `my_state.md` with assigned work, next starting point, carry-over items, and referenced session log.
- **When major decisions, file changes, approvals, or rejections occur**: record them in the session log immediately.
- **When the Human says `wrap up`**: close the session log automatically.

---

## Automation Rules

| Trigger | Gemini Automatic Action |
|--------|--------------------------|
| File created / updated / deleted | Record it immediately in the changed-files section of the session log |
| `let's go with ...` / `decide on ...` | Auto-create an ADR file |
| `proposal` keyword | Create a Change Proposal file |
| Execute cycle completed | Auto-update the relevant source documents based on the Phase Document Map (§12 Passive Extraction) |
| `let's move to ... phase` | Run Pre-Gate Harvest -> automatically check `quality_gate.md` |
| `release` / `generate docs` / `export` | Run Pre-Release Harvest -> check Gate 5 -> generate the active default 14 deliverables and approved extension deliverables (15+) into `docs/` |
| External chat / memo imported | Store the raw text in `imported_context/`, then extract only the needed facts into registry/canonical documents |
| Design decision occurs | Auto-create and number an ADR file |
| Technical insight discovered | Promote only reusable summaries into `knowledge_base.md` |
| Phase transition | Automatically check whether `quality_gate.md` is satisfied |
| `wrap up` | Run Session End Enrichment Check -> close the session log + sync `my_state.md` |
| `upgrade` | Update the framework according to `tooling_environment_guide.md` + `upgrade_manifest.md` |
| Context-window saturation detected | Recommend a session handoff -> run the Enrichment Check -> guide the user into a fresh session |
| Context change | Automatically update this file (`GEMINI.md`) |

---

## Gemini Tips

### Session Start

Open the project in an IDE with Gemini Code Assist enabled and start naturally from the chat panel.

```text
Read GEMINI.md and start this session from the current project state.
```

After the AI shows the project briefing and the active Intent / Milestone / Task list, choose the work you want to do.

### Effective Context Handoff

```text
Read GEMINI.md and resume from the current project state.
Let's continue TASK-003.
```

---

## Keyword Summary

| Keyword | Automatic Action |
|--------|------------------|
| `wrap up` / `done for today` / `that's it for today` | Enrichment Check -> session end handling (summary, carry-over items, next context) |
| `let's go with ...` / `decide on ...` | ADR auto-created |
| `proposal` | Create a Change Proposal |
| `let's move to ... phase` | Pre-Gate Harvest -> automatic Quality Gate check |
| `release` / `generate docs` / `export` | Pre-Release Harvest -> Gate 5 check -> generate the active default 14 deliverables and approved extension deliverables (15+) into `docs/` |
| `upgrade` | Update the framework according to `tooling_environment_guide.md` + `upgrade_manifest.md` |

---

## Project Context

> Fill the items below when the project starts. Gemini automatically updates them when they change.

- **Project:**
- **Tech Stack:**
- **Primary Language:**
- **Visualization Mode:**
- **Core Documents:**
- **Current Phase:**
- **Milestone:**

---

## Multi-Tool Guidance

This project is designed so that **GitHub Copilot, Claude Code, OpenAI Codex, Cursor, and Gemini Code Assist** can be used together.

| File | Tool That Reads It | Role |
|------|--------------------|------|
| `GEMINI.md` (project root) | Gemini Code Assist | Gemini session entrypoint |
| `AGENTS.md` (project root) | OpenAI Codex | Codex session entrypoint |
| `AGENTS.md` (project root) | Cursor | Cursor session entrypoint |
| `CLAUDE.md` (project root) | Claude Code | Claude Code session entrypoint |
| `.github/copilot-instructions.md` | GitHub Copilot | Copilot session entrypoint |
| entire `.cowork/` tree | Shared | Shared project context store |

All five tools read the same `.cowork/` documents. Because OpenAI Codex and Cursor share the same `AGENTS.md`, the same collaboration rules apply regardless of which tool you use.
