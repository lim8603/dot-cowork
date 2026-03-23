# Cowork Context Framework Design

This document explains the design intent behind the `cowork-context-framework` repository.
It is the maintainer-facing companion to the public [README](README.md): the README explains what the framework is, while this document explains why the repository is shaped the way it is and how it is meant to evolve.

---

## Purpose

The framework exists to make AI-Human collaboration durable across sessions, tools, and project phases.

Most AI workflows lose context at the end of a chat.
Important decisions disappear into message history, design rationale becomes hard to recover, and switching tools often means starting over.

This repository addresses that problem by treating project documents as persistent working memory.
Instead of relying on a single assistant session, the framework stores shared state, decisions, plans, and execution history in structured files that any compatible tool can read.

At the repository level, the goal is to publish that framework as a clean, versioned baseline that can be installed into real projects and upgraded over time.

---

## Baseline Decisions

The new repository starts from a deliberate reset rather than a continuation of the old template history.

- Repository name: `cowork-context-framework`
- Initial release line: `1.0.0`
- Current authoring baseline root: `frameworks/ko`
- Published English install root: `frameworks/en`
- Initial manifest baseline: `From = 0.0.0`
- Current automation example archive output: `dist/cowork-context-framework-kr.zip`

This baseline intentionally does not inherit the legacy release chain from `cowork-context-template`.

What is intentionally excluded from the new baseline:

- old tag continuity
- legacy `From` inference behavior
- old archive naming conventions such as `cowork_context_template_*.zip`

The point of the reset is clarity.
The framework should have a clean public starting point that matches the current repository structure and automation model.

---

## Core Design Principles

### Artifacts are memory

The framework treats approved project artifacts as the long-term memory of the collaboration.
Session continuity should come from files such as `project_state.md`, session logs, ADRs, and phase documents, not from hoping the next chat remembers the last one.

### Plan -> Approve -> Execute

The default working contract is simple:

1. The AI proposes a plan.
2. The Human approves or adjusts it.
3. Execution follows the approved direction.

This keeps the workflow collaborative without making the assistant either passive or overly autonomous.

### Progressive enrichment

The framework does not assume every project document will be completed up front.
Instead, documents accumulate detail over time as the project moves through definition, design, implementation, verification, and delivery.

### Markdown-native visuals

Because the framework is Markdown-first, diagrams and charts should stay text-editable whenever possible.
New projects start with `Visualization Mode = Disabled` and should prefer prose, lists, or tables until the project explicitly enables Mermaid in `project_state.md`.
When `Visualization Mode = Mermaid`, Mermaid becomes the preferred format for visuals embedded in Markdown so they can participate in normal diff, review, and AI-assisted editing flows.
Static `SVG` or `PNG` assets remain an exception path for cases where Mermaid is too limiting or a required publishing target does not support it.

### Minimal ceremony, durable traceability

The framework is document-heavy by design, but it is not meant to create paperwork for its own sake.
The objective is to keep only the information that materially improves continuity, clarity, and accountability.

### Tool-agnostic collaboration

The framework is built around shared files rather than assistant-specific memory.
Codex, Cursor, Claude Code, Gemini, and Copilot should all be able to work from the same project state with minimal context loss.

---

## Repository Model

The repository has two distinct layers:

1. repository maintenance files at the root
2. publishable framework source under `frameworks/`

The root-level entrypoint files:

- `AGENTS.md`
- `CLAUDE.md`
- `GEMINI.md`
- `.github/copilot-instructions.md`

exist to maintain this repository itself.

Supplementary planning and product-facing support documents can live under `docs/`.
That folder is intentionally separate from the maintainer-facing core documents at the repository root such as `README.md`, `DESIGN.md`, and `CHANGELOG.md`.

The entrypoint files inside a framework variant are different.
Those are part of the published framework that gets copied into a consumer project.

This distinction is important because the repository is both:

- a source repository for framework maintenance
- a distribution source for installation into downstream projects

---

## Framework Source Model

The authoring baseline lives under `frameworks/ko`.
The repository also publishes `frameworks/en` as a synchronized English install variant derived from that baseline.

```text
frameworks/
|-- ko/
|   |-- AGENTS.md
|   |-- CLAUDE.md
|   |-- GEMINI.md
|   |-- .github/copilot-instructions.md
|   `-- .cowork/
`-- en/
    |-- AGENTS.md
    |-- CLAUDE.md
    |-- GEMINI.md
    |-- .github/copilot-instructions.md
    `-- .cowork/
```

Inside `.cowork/`, the framework organizes project knowledge by role and lifecycle stage.
The structure is meant to support both ongoing execution and later recovery.

Within the governance layer, the design keeps stable session rules separate from tool- and environment-dependent operating instructions so entrypoint behavior and upgrade mechanics can evolve without bloating the core session protocol.

At a high level, the framework tracks work through this chain:

```text
Intent -> Milestone -> Task
```

That model is supported by adjacent artifacts such as requirements, ADRs, verification records, and session logs.

---

## Collaboration and Session Model

The framework is designed around resumable work sessions.

At the start of a session, the assistant is expected to:

- read the entrypoint file
- restore the current project state
- inspect the latest session history
- identify active work and carry-over items
- continue from the documented state rather than from chat history

This model supports both solo work and team collaboration.

For team scenarios, the framework separates:

- shared project state
- member-specific working state

That separation allows a project to keep a reliable shared source of truth while still giving individuals a personal workspace for active tasks, blockers, proposals, and local session history.

It also allows the framework to split responsibilities cleanly between:

- stable collaboration protocol
- tool-specific entrypoint guidance
- environment-sensitive upgrade and sync operations

---

## Lifecycle Design

The framework follows a structured lifecycle:

```text
Define -> Design -> Build -> Verify -> Evolve -> Deliver
```

Each phase has a different documentation focus.

- Define clarifies intent, scope, requirements, and deliverables.
- Design records models, interfaces, technical decisions, and ADRs.
- Build turns approved work into tasks and implementation changes.
- Verify captures test intent, validation evidence, and gate decisions, using a dedicated evidence index when verification output starts accumulating like logs.
- Evolve preserves session history, project state, and lessons learned.
- Deliver generates official outputs for handoff or release, starting from a recommended 14-document baseline that can be extended with approved project-specific deliverables.

The intent is not to enforce rigid process for its own sake.
The lifecycle exists so that information naturally lands in the right place and remains usable after the session that created it.

---

## Traceability Design

One of the framework's core promises is explicit traceability.

The repository structure encourages the team to preserve relationships between:

- project intent
- milestones
- tasks
- design decisions
- verification work
- release and upgrade history

This is why the framework favors named documents, registries, and structured identifiers over free-form chat summaries alone.

Traceability matters for more than reporting.
It improves resume-ability, reduces repeated explanation, and makes it easier to understand not just what changed, but why it changed.

Verification evidence deserves the same treatment.
When review notes, test runs, NFR measurements, and release-readiness checks begin to accumulate over time, the framework can keep them discoverable through a dedicated canonical evidence index instead of relying on scattered chat history or raw logs alone.

---

## Release Design

The release model is intentionally small and predictable.

The repository publishes a Korean authoring baseline and an English install variant on the same release line.
Current automation examples in this repository remain anchored to `frameworks/ko`, and published sibling variants should stay aligned to the same version and install structure.

Release automation is built around three actions:

- `prepare`
- `verify`
- `publish`

Version semantics are straightforward:

- `VERSION` stores the repository release version.
- `frameworks/ko/.cowork/upgrade_manifest.md` is the automation anchor and must match that version.
- Any published sibling variant, including `frameworks/en`, should carry the same release version and compatible install structure.
- `v1.0.0` is the clean-install baseline and therefore uses `From = 0.0.0`.
- Later releases should form a sequential upgrade chain.

This model is intentionally more explicit than the legacy template flow.
The goal is to remove ambiguity from release preparation and downstream upgrades.

---

## Upgrade Design

Framework upgrades are manifest-driven.
The manifest is the authoritative description of how a consumer project should interpret a release.

The primary actions are:

- `ADD`
- `REPLACE`
- `MERGE`
- `SKIP`

Their purpose is to separate framework-owned structure from project-owned content.

- `ADD` introduces new framework files.
- `REPLACE` refreshes files that are fully framework-owned.
- `MERGE` updates shared structure while preserving project data.
- `SKIP` leaves project-specific content alone.

The clean baseline rule matters here:
`v1.0.0` is not treated as an incremental patch over older public template releases.
It is the starting point of the new repository's own upgrade history.

For later releases, the intended rule is sequential compatibility:

```text
current installed version == next manifest From
```

That makes upgrade behavior easier to reason about, easier to automate, and less dependent on historical special cases.

---

## Language Strategy

The repository is Korean-authored and published in multiple language variants.

That is a deliberate sequencing decision, not a split-source model.
The Korean source remains the design baseline, and the English variant is a synchronized release artifact derived from that baseline rather than an independent source of truth.

Current language policy:

- `frameworks/ko` is the authoring baseline and first-edit source
- `frameworks/en` is the published English install variant kept on the same release line
- structural and governance changes should be authored in `frameworks/ko` first, then propagated to `frameworks/en`

This keeps translation and release work aligned without turning both trees into competing primary sources.

---

## Maintenance Policy

Repository maintenance should follow a few simple rules.

- Edit the maintained framework source first.
- Keep the published English variant synchronized.
- Keep the root maintenance entrypoints synchronized.
- Update `README.md` and `DESIGN.md` when the public repository contract changes.
- Rebuild archives instead of editing `dist/` by hand.
- Treat automation and manifest policy as release-critical surfaces.

In practice, that means documentation, scripts, and workflow files are not secondary details.
They are part of the product surface of the framework.

---

## Automation Surface

The repository intentionally keeps its automation surface narrow:

- `scripts/build-template.ps1`
- `scripts/validate-template.ps1`
- `scripts/update-manifest-cumulative.ps1`
- `scripts/build-cumulative-manifest.ps1`
- `scripts/prepare-consumer-upgrade.ps1`
- `scripts/release.ps1`
- `.github/workflows/validate-pr.yml`
- `.github/workflows/release.yml`

Each of these is expected to work against the current maintained source layout and the repository's manifest policy.

Because the framework is release-driven, automation changes are never just implementation details.
They affect the public reliability of installation, verification, and upgrades.

---

## Near-Term Roadmap

The near-term direction for the repository is:

1. keep the Korean authoring baseline stable
2. keep release and upgrade automation reliable on the new repository
3. publish and validate the `1.x` release line
4. keep `frameworks/en` aligned from the Korean baseline as release-facing framework changes land

That roadmap keeps the order of work intentional:
author once, publish consistently.
