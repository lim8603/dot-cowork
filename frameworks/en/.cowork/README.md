# Cowork Context Engineering

> Quick start for the AI-Human collaboration development framework

---

## What It Solves

AI coding tools easily lose context when a session ends.
This framework uses the `.cowork/` document structure to accumulate decisions and current state,
then lets the AI restore that context by reading the documents again in the next session.

The core idea is simple.

> **Artifacts are the AI's memory.**

---

## What This Framework Does

- At session start, the AI reads `project_state.md`, `deliverable_plan.md`, the relevant `my_state.md`, and the latest session log, restores the saved language and visualization settings, then gives a briefing.
- During the session, decisions are accumulated into the right registry, canonical document, or detail document.
- The framework loads only the documents that match the current phase first so the context window is used efficiently.
- At release time, it generates the active default 14 deliverables and approved extension deliverables (15+) into `docs/`.

---

## Quick Start

1. Copy `.cowork/`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md` into the project root.
2. Point the AI tool you use at the matching entrypoint file.
3. Once the AI prints the project briefing, choose the work you want to do in this session.

---

## Entry Prompts

| Tool | How To Start |
|------|--------------|
| OpenAI Codex | `Read AGENTS.md, then check project_state.md, deliverable_plan.md, my my_state.md, and the latest session log before starting today's session.` |
| Cursor | `Read AGENTS.md, then check project_state.md, deliverable_plan.md, my my_state.md, and the latest session log before starting today's work.` |
| Claude Code | `claude "Read CLAUDE.md and start today's session"` |
| Gemini Code Assist | `Read GEMINI.md, then check project_state.md, deliverable_plan.md, my my_state.md, and the latest session log before starting today's session.` |
| GitHub Copilot | Open Copilot Chat and start the conversation; `.github/copilot-instructions.md` is loaded automatically. |

---

## Expected Session Flow

1. The AI reads `project_state.md`, `deliverable_plan.md`, the relevant `my_state.md`, the required registry/canonical documents, and the latest session log.
2. The AI first shows a briefing with the project status and the active Intent / Milestone / Task list.
3. The Human chooses work or explains the goal.
4. The AI continues through the `Plan -> Approve -> Execute` cycle.

Use [session_protocol.md](01_cowork_protocol/session_protocol.md) for the detailed procedure and automation rules, and use [tooling_environment_guide.md](01_cowork_protocol/tooling_environment_guide.md) for tool- and environment-dependent operation.

---

## `.cowork/` Structure At A Glance

| Path | Role |
|------|------|
| `01_cowork_protocol/` | Collaboration rules, authority, session protocol |
| `02_project_definition/` | Intent, requirements, functional definition |
| `03_design_artifacts/` | Design deliverables and ADRs |
| `04_implementation/` | Milestones, tasks, implementation conventions |
| `05_verification/` | Tests and gate decisions |
| `06_evolution/` | Shared state, retrospectives, accumulated knowledge |
| `07_delivery/` | Official deliverable generation rules and official deliverables |
| `members/` | Personal state and session logs |

For the full structure and lifecycle, read [cowork.md](cowork.md).

---

## Recommended Reading Order

| Document | When To Read It | Role |
|------|------------------|------|
| `README.md` | When you first meet the framework | Intro summary and usage |
| `cowork.md` | When you want to understand the structure and principles | Master operating document |
| `01_cowork_protocol/session_protocol.md` | When you need the session procedure | Session operation standard |
| `01_cowork_protocol/tooling_environment_guide.md` | When you need tool setup, entrypoint sync, or upgrade operations | Environment-specific operations |
| `01_cowork_protocol/communication_convention.md` | When you need language, tone, or visualization-mode rules | Expression standard |
| `01_cowork_protocol/document_role_inventory.md` | When document classification feels unclear | Role inventory |

---

## Frequently Used Keywords

| Keyword | Action |
|--------|--------|
| `let's go with ...` / `decide on ...` | Record the design decision as an ADR |
| `proposal` | Create a Change Proposal |
| `let's move to ... phase` | Complete the current phase documents and check the quality gate |
| `wrap up` | Run session end handling and carry-over review |
| `release` / `generate docs` / `export` | Check Gate 5, then generate official deliverables |

---

## Release And Document Generation

When the Human requests `release`, `generate docs`, or `export`, the AI uses `deliverable_plan.md` and `export_spec.md`
to generate the active default 14 deliverables and approved extension deliverables (15+).

- Deliverable quality depends on how faithfully the source documents were accumulated before that point.
- The AI can propose extension deliverables when needed, and the Human approves them before they are added.
- Use `deliverable_plan.md` and `export_spec.md` as the authority for the detailed list, source-document mapping, and generation approach.
- Official deliverable generation does not try to clone a rigid format. It prioritizes traceability and preservation of required information.

---

## References

- High-level structure, lifecycle, and document-role principles: [cowork.md](cowork.md)
- Session start / in-progress / end procedure: [01_cowork_protocol/session_protocol.md](01_cowork_protocol/session_protocol.md)
- Tool setup, entrypoint sync, and framework upgrade operations: [01_cowork_protocol/tooling_environment_guide.md](01_cowork_protocol/tooling_environment_guide.md)
- Language policy, tone, and visualization-mode rules: [01_cowork_protocol/communication_convention.md](01_cowork_protocol/communication_convention.md)
- Document classification and operating inventory: [01_cowork_protocol/document_role_inventory.md](01_cowork_protocol/document_role_inventory.md)

---

*Cowork Context Engineering v1.0 · Seunghyun Lim (<lim8603@gmail.com>)*
