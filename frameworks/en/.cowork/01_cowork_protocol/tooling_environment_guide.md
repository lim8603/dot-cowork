# Tooling Environment Guide

> Guide that separates tool-specific execution constraints, entrypoint synchronization, and network-dependent operation

---

## Purpose

- `session_protocol.md` keeps only the session-wide flow and invariant rules.
- This document covers **tool- and environment-dependent operating instructions** such as auto-approval, entrypoint synchronization, and upgrades.
- Tool-specific startup examples belong in `.cowork/README.md`; entrypoints keep only the minimum task guidance.

---

## Placement Principles

| Topic | Primary Source Document | Notes |
|------|-------------------------|------|
| Session start, briefing, mode selection, end | `session_protocol.md` | Shared protocol across tools |
| Tool-specific startup prompts and examples | `.cowork/README.md` | Entrypoints keep shared execution boundaries |
| How role seats are realized (persona / independent sub-agent), model used | `role_realization.md` + current tool entrypoint document | Independent sub-agent and multi-model support vary by tool capability |
| Sync rules across the four entrypoints | `tooling_environment_guide.md` | Review together when shared context changes |
| Framework upgrade execution path | `tooling_environment_guide.md` | Includes network/offline branching |
| Version chain, file classes, per-release application rules | `upgrade_manifest.md` | Release-specific authoritative source |

---

## 1. Tool-Specific Approval And Execution Constraints

- Automatic approval is not a required assumption. If a tool does not support it or the Human does not want it, continue with manual approval flow.
- Even when the session is constrained by the tool, keep the shared protocol intact. What must be confirmed is the approval model, whether file/shell execution is available, whether network access is available, and whether there are long-running execution limits.
- Keep tool-specific setting examples in the relevant `.cowork/README.md` item, not in the shared protocol.
- Even when automatic approval or a similar setting is recommended, ask only once. If the Human declines, do not repeat the request.

## 2. Entrypoint Synchronization Rules

Keep stable project identity, document paths, and shared execution boundaries in entrypoints. Read phase, active tasks, next milestone, and deployed version from `project_state.md` without copying them into entrypoints. Use `tech_stack.md` for the actual technology stack. On resume, reconcile conflicting summaries with their sources and replace stale summaries with links.


- The four entrypoint files are short guides to the shared `.cowork/` documents. Do not copy current state or stack values into them.
- Review all four entrypoints together whenever any of the following changes:
  - project name, core documents, or primary/document language policy
  - phase labels, briefing flow, or intent-based execution rules
  - tech-stack source-document path, core workflow, or upgrade/release guidance
  - automation text that must be shared across tools
- Keep tool-specific startup examples in `.cowork/README.md`. Sync all four entrypoints when the shared contract changes.
- When entrypoints change, record the reason in a session log for work that needs one, or in the release record.

---

## 3. Framework Upgrade Operation

### Trigger

- The Human requests a framework upgrade; mentioning the word alone is insufficient.

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

---

## 5. Session Discipline Enforcement (Enforcement Hooks) — F-10

> The session-start checks and auto-recording rules in `session_protocol.md` mostly rely on the **AI's voluntary compliance** (which can silently break depending on the model and context). Discipline that is hard to undo can be mechanically enforced through the tool's **hooks**.

### Enforceable Checks (Examples)

| Check | Source Rule | Enforcement Idea |
|-------|-------------|------------------|
| Work log created | `session_protocol.md` §Auto-Recording 1 | Check for a log only when substantive work needs one; exclude read-only requests |
| Live state-document size budget | F-05 | A hook measures the size of `project_state.md` + `my_state.md` and shows an R1/R2 harvest recommendation when the budget is exceeded |
| Carryover items checked | F-02 | Include carryovers for an unspecified-task briefing; check related items and any item whose trigger has arrived for a specific task |
| openapi / schema drift | Per project | A pre-commit hook confirms the regeneration diff = 0 (for projects with a contract) |
| Commit message convention | decision matrix | A commit-msg hook validates the prefix |

### Operating Principles

- **Enforcement means differ by tool and environment.** Keep the concrete implementation (agent hooks, git hooks, CI jobs) in the current tool's entrypoint document (`CLAUDE.md`, etc.) and the repository settings. This document defines only the list of "what can be enforced" and the placement principles.
- Examples (tool-independent): git `pre-commit` / `commit-msg` hooks, CI jobs, agent session start / end hooks.
- Hooks start as **a default recommendation, not a block** (block only the items that must be fail-closed). If false positives block a session, the discipline gets bypassed.
- When enforcement items are added or changed, update the session log, and update the four entrypoints together if the tool-common contract changed.
