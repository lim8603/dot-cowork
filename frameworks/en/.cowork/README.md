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

- At work start, the AI checks current state in `project_state.md` and reads only the additional documents needed. It gives a briefing when no task is specified.
- During the session, decisions are accumulated into the right registry, canonical document, or detail document.
- The framework loads only the documents that match the current phase first so the context window is used efficiently.
- On an official-deliverable request, it generates the approved active items in `deliverable_plan.md` into `docs/`.

---

## Quick Start

1. Copy `.cowork/`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md` into the project root.
2. Point the AI tool you use at the matching entrypoint file.
3. Request the work directly. If no task is specified, the AI briefs you on the current state.

---

## Entry Prompts

| Tool | How To Start |
|------|--------------|
| OpenAI Codex | `Read AGENTS.md and continue the current task from project_state.md.` |
| Cursor | `Read AGENTS.md and continue the current task from project_state.md.` |
| Claude Code | `claude "Read CLAUDE.md and start today's session"` |
| Gemini Code Assist | `Read GEMINI.md and continue the current task from project_state.md.` |
| GitHub Copilot | Open Copilot Chat and start the conversation; `.github/copilot-instructions.md` is loaded automatically. |

---

## Expected Session Flow

1. The AI checks current state in `project_state.md` and reads documents relevant to the request.
2. For a clear task it proceeds; otherwise it briefs active work and asks for a choice.
3. It obtains Human approval for H/J decisions and reports A-level work after performing it.

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
| `01_cowork_protocol/communication_convention.md` | When you need language, tone, or visualization rules | Expression standard |
| `01_cowork_protocol/document_role_inventory.md` | When document classification feels unclear | Role inventory |

---

## Request Examples

| Requested Intent | Action |
|--------|--------|
| Confirm a design direction | Decide whether it needs an ADR, then record it |
| Submit a shared-area change as a Proposal | Create a Change Proposal |
| `let's move to ... phase` | Complete the current phase documents and check the quality gate |
| `wrap up` | Run session end handling and carry-over review |
| Generate official deliverables | Check Gate 5, then generate approved active deliverables |

---

## Release And Document Generation

When the Human requests official deliverable generation, the AI uses `deliverable_plan.md` and `export_spec.md` to generate approved active items. Mentioning the topic alone does not start generation.

- Deliverable quality depends on how faithfully the source documents were accumulated before that point.
- The AI can propose extension deliverables when needed, and the Human approves them before they are added.
- Use `deliverable_plan.md` and `export_spec.md` as the authority for the detailed list, source-document mapping, and generation approach.
- Official deliverable generation does not try to clone a rigid format. It prioritizes traceability and preservation of required information.

---

## References

- High-level structure, lifecycle, and document-role principles: [cowork.md](cowork.md)
- Session start / in-progress / end procedure: [01_cowork_protocol/session_protocol.md](01_cowork_protocol/session_protocol.md)
- Tool setup, entrypoint sync, and framework upgrade operations: [01_cowork_protocol/tooling_environment_guide.md](01_cowork_protocol/tooling_environment_guide.md)
- Language policy, tone, and visualization rules: [01_cowork_protocol/communication_convention.md](01_cowork_protocol/communication_convention.md)
- Document classification and operating inventory: [01_cowork_protocol/document_role_inventory.md](01_cowork_protocol/document_role_inventory.md)

---

*Cowork Context Engineering v1.0 · Seunghyun Lim (<lim8603@gmail.com>)*
