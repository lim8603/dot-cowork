# Tooling Environment Guide

> Guide that separates tool-specific execution constraints, entrypoint synchronization, and network-dependent operation

---

## Purpose

- `session_protocol.md` keeps only the session-wide flow and invariant rules.
- This document covers **tool- and environment-dependent operating instructions** such as auto-approval, entrypoint synchronization, and upgrades.
- Tool-specific commands, UI settings, and examples belong in each tool's entrypoint document. This guide defines only placement rules and shared operating criteria.

---

## Placement Principles

| Topic | Primary Source Document | Notes |
|------|-------------------------|------|
| Session start, briefing, mode selection, end | `session_protocol.md` | Shared protocol across tools |
| Tool-specific startup prompts, setting examples, approval UX | `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md` | Follow only the document for the tool currently in use |
| How role seats are realized (persona / independent sub-agent), model used | `role_realization.md` + current tool entrypoint document | Independent sub-agent and multi-model support vary by tool capability |
| Sync rules across the four entrypoints | `tooling_environment_guide.md` | Review together when shared context changes |
| Framework upgrade execution path | `tooling_environment_guide.md` | Includes network/offline branching |
| Version chain, file classes, per-release application rules | `upgrade_manifest.md` | Release-specific authoritative source |

---

## 1. Tool-Specific Approval And Execution Constraints

- Automatic approval is not a required assumption. If a tool does not support it or the Human does not want it, continue with manual approval flow.
- Even when the session is constrained by the tool, keep the shared protocol intact. What must be confirmed is the approval model, whether file/shell execution is available, whether network access is available, and whether there are long-running execution limits.
- Put tool-specific setting examples only in the **entrypoint for the current tool**. Do not copy one tool's command or UI option into shared documents such as `session_protocol.md`.
- Even when automatic approval or a similar setting is recommended, ask only once. If the Human declines, do not repeat the request.

### Where Tool-Specific Examples Live

| Tool | Document | Notes |
|------|----------|------|
| OpenAI Codex / Cursor | `AGENTS.md` | Project context and shared automation triggers |
| Claude Code | `CLAUDE.md` | CLI startup flow and setting examples |
| Gemini Code Assist | `GEMINI.md` | IDE chat startup flow |
| GitHub Copilot | `.github/copilot-instructions.md` | IDE / agent usage flow |

---

## 2. Entrypoint Synchronization Rules

- The four entrypoint files are thin wrappers that expose the same shared `.cowork/` source documents to different tools.
- Review all four entrypoints together whenever any of the following changes:
  - project name, core documents, or primary/document language policy
  - phase labels, briefing flow, or shared keyword behavior
  - tech-stack summary, core workflow, or upgrade/release guidance
  - automation text that must be shared across tools
- If only a tool-specific example changes, update only that entrypoint. Update the other three only when the shared contract changes.
- When entrypoints change, leave a note in the session log or release record that the change was an entrypoint-sync change.

---

## 3. Framework Upgrade Operation

### Trigger

- The Human says the `upgrade` keyword.

### Source Documents

- Execution path and environment-specific branching: `01_cowork_protocol/tooling_environment_guide.md`
- Installed version / target version decision and file classes: `.cowork/upgrade_manifest.md`

### Shared Operating Rules

1. Read the installed `Version` from the current project's `.cowork/upgrade_manifest.md`.
2. If network access is available, check the latest release through the GitHub API.
   - `GET https://api.github.com/repos/lim8603/cowork-context-framework/releases/latest`
3. If network access is unavailable, use the zip manually placed under `.cowork/.upgrade/archives/v{version}/`.
4. Read the target release's `upgrade_manifest.md`, confirm `Version` and `From`, and always judge adjacent vs. skip-version upgrades through the `From` chain.
5. For skip-version upgrades, prefer **sequential application through intermediate versions** rather than jumping directly to the latest release.
6. Before applying, create `.cowork/.upgrade/upgrade_plan_v{from}_to_v{to}.md` and record the verified order and rollback path.
7. Apply each step according to the manifest's `ADD / REPLACE / MERGE / SKIP` classification.
8. If `MERGE` is needed or the decision is difficult, apply it only after Human approval.
9. Preserve project data; update only the framework structure and rules.
10. Recommend a git commit before the upgrade, and keep the plan file and result logs in `.cowork/.upgrade/` until verification is finished.

---

## 4. Maintenance Checklist

- When tool-specific setting examples change: update the relevant entrypoint first.
- When the shared operating boundary changes: review `session_protocol.md`, this document, `document_role_inventory.md`, `document_change_impact_matrix.md`, and `upgrade_manifest.md` when needed.
- When paths or file structure change: synchronize the four entrypoints and `upgrade_manifest.md` together.
