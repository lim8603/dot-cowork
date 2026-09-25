# Cowork Context Framework

[![GitHub release](https://img.shields.io/github/v/release/lim8603/cowork-context-framework)](https://github.com/lim8603/cowork-context-framework/releases/latest)

A project-level context framework for AI-Human collaboration across sessions, tools, and project phases.

AI chat is disposable. Project context should not be.

This framework stores intent, requirements, design decisions, implementation notes, verification records, and delivery artifacts as structured files in the repository so work can survive session boundaries, tool switches, and project handoffs.

The new `cowork-context-framework` repository starts from a clean `1.x.x` baseline. `frameworks/ko` remains the Korean authoring baseline, and `frameworks/en` is the published English install variant kept on the same release line.

---

## Why This Exists

AI tools lose working memory when a session ends.

- Decisions agreed on yesterday often need to be re-explained today.
- The reason behind "why was this done this way?" disappears into chat history.
- Switching tools usually means rebuilding project context from scratch.

This framework keeps that context in persistent files so any compatible tool can restore the project state and continue from where the previous session stopped.

---

## Key Features

- **Tool-agnostic**: Codex, Cursor, Claude Code, Gemini, and Copilot can all read the same `.cowork/` workspace.
- **Structured lifecycle**: The workflow follows Define -> Design -> Build -> Verify -> Evolve -> Deliver.
- **Persistent project memory**: Versioned state, Intent, milestones, ADRs, and tasks preserve durable context; local session logs can hold supporting detail.
- **Progressive enrichment**: Important details are harvested into the right documents as work proceeds.
- **Verification evidence index**: Review, test, NFR, and release-readiness evidence can accumulate in a dedicated canonical verification document.
- **Quality gates**: Phase transitions can check for missing artifacts before the team moves forward.
- **Flexible delivery outputs**: Export can start from a recommended 14-document baseline and extend with approved project-specific deliverables.
- **Brownfield-friendly**: Existing projects can adopt the framework through reverse discovery and phase alignment.
- **Manifest-based upgrades**: Framework updates can preserve project-specific data while refreshing shared structure.
- **Stable vs environment-specific rules**: A short execution summary leads the session protocol; tool-specific execution and upgrade mechanics live in a separate guide.
- **Team-ready collaboration**: Shared state and personal workspaces can coexist without losing traceability.

---

## Documentation Conventions

- Framework source documents are Markdown-first.
- Diagrams and charts embedded in Markdown should use Mermaid by default so visuals stay diffable, reviewable, and editable in the same repository flow.
- Use static `SVG` or `PNG` assets only when Mermaid cannot express the content clearly enough or a required publishing target does not support Mermaid.

---

## Quick Start

> Choose the framework variant that matches your working language.
> `frameworks/ko` remains the Korean authoring baseline.
> `frameworks/en` is the published English install variant for English-language projects.

### 1. Get the framework

Download the latest release from the [Releases](https://github.com/lim8603/cowork-context-framework/releases) page, or copy the framework source directly from this repository.

| Source | Path |
| --- | --- |
| Korean authoring baseline | `frameworks/ko/` |
| English install variant | `frameworks/en/` |
| Files to copy into your project root | `.cowork/`, `.github/`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md` |

> The `dist/` archives are generated output. Edit the source files under `frameworks/`.

### 2. Place it in your project

After copying the files from your chosen framework variant (`frameworks/en/` for English or `frameworks/ko/` for Korean), your project root should look like this:

```text
your-project/
|-- AGENTS.md
|-- CLAUDE.md
|-- GEMINI.md
|-- .github/
|   `-- copilot-instructions.md
`-- .cowork/
    |-- cowork.md
    |-- 01_cowork_protocol/
    |-- 02_project_definition/
    |-- 03_design_artifacts/
    |-- 04_implementation/
    |-- 05_verification/
    |-- 06_evolution/
    |-- 07_delivery/
    `-- members/
```

### 3. Start a session with your AI tool

When you open a conversation with a tool that reads its entrypoint file, a short prompt is usually enough because the entrypoint already tells the tool which framework files to load.

Example for `AGENTS.md`-based tools such as Codex or Cursor:

```text
Read AGENTS.md and start this session from the current project state.
```

The normal working loop is:

1. Check current state and read the documents relevant to the request.
2. If the task is clear, proceed; otherwise brief active work and ask the user to choose.
3. Obtain Human approval for H/J decisions. Perform A-level work and report the result.
4. Record meaningful state and decision changes in `.cowork/`.

---

## Documentation Guides

The `docs/` folder contains supplementary guides that help you adopt, navigate, and evaluate the framework without reading the entire source structure first.

- [Feature Flow Overview](docs/feature-flow-overview.md): explains the framework in lifecycle order and highlights the main capabilities by trigger, artifact, and outcome.
- [Document Map](docs/document-map.md): shows where the major framework documents live and when each one is typically created, updated, and referenced.
- [Adoption Guide](docs/adoption-guide.md): explains how to start in a new or existing project and what the minimum first-session setup looks like.
- [Use Case Scenarios](docs/use-case-scenarios.md): shows realistic flows for solo use, brownfield recovery, team collaboration, tool switching, release preparation, and clean handoff.
- [Field Review: September 2026](docs/field-review-2026-09.md): Korean review of two installed projects, the evidence behind the current improvements, and follow-up criteria.

If you are new to the framework, a practical reading order is:

1. `README.md`
2. `docs/adoption-guide.md`
3. `docs/feature-flow-overview.md`
4. `docs/document-map.md`
5. `docs/use-case-scenarios.md`

---

## How It Works

### Context restoration

At work start, the AI uses its entrypoint and `project_state.md` to find current constraints and next actions. It opens the latest session log, personal state, or other source documents only when they matter to the request. A general briefing is used when the user has not specified a task.

The session protocol opens with task routing and approval rules, then provides detailed procedures for work that needs them. Tool and environment settings live in a separate guide.

Entrypoints link to shared phase/milestone state instead of maintaining status copies. Live-state warnings default to 24 KiB for shared state and 12 KiB per member; these adjustable limits trigger review, not release failure. Current constraints and evidence links survive cleanup. Verification evidence identifies its target revision, environment, and uncovered scope rather than treating project health as release readiness.

From this maintenance repository, inspect an installed project without modifying it:

```powershell
./scripts/audit-cowork-state.ps1 -ProjectRoot ../my-project
```

Use `-ProjectStateBytes`, `-MemberStateBytes`, and `-MaxLineCharacters` to match project budgets. `-Check` returns 1 for warnings and 0 when clear; invalid input fails. The script checks all existing member states and long physical lines (a proxy for long rows/paragraphs). It does not validate meaning or archive content and is not bundled into consumer archives.

### Automatic document accumulation

Approved work is written back into the relevant phase documents.

- Requirements -> `requirement_spec.md`
- Durable design decisions -> ADRs when they meet the promotion criteria; smaller decisions -> relevant source documents
- Verification evidence -> `verification_evidence.md`
- Project state changes -> `project_state.md`
- Meaningful handoff details -> session logs when a work session needs them

### Progressive enrichment

The framework does more than save notes.
It fills gaps at the right time through document harvest, end-of-session checks, and phase-gate reviews.

### Intent and milestone traceability

Intent, Milestone, Task, and ADR relationships are tracked in explicit documents so the team can understand both current work and why it exists.

### Upgrade path

When a new framework release is staged, the manifest can classify files as `ADD`, `REPLACE`, `MERGE`, or `SKIP` so the framework can evolve without blindly overwriting project-specific content.

---

## Team Collaboration

The framework supports both solo and team projects.
Shared project state and personal workspaces can coexist so contributors can coordinate without losing individual working context.

- Shared state lives in project-level `.cowork/` documents.
- Member-specific work can live under `.cowork/members/<name>/workspace/`.
- Session outputs can roll important updates back into shared documents at the end of the session.

This makes the framework workable for single-developer projects, role-based teams, and long-running collaborations across multiple AI tools.

---

## Supported Tools

| Tool | Entrypoint File |
| --- | --- |
| OpenAI Codex | `AGENTS.md` |
| Cursor | `AGENTS.md` |
| Claude Code | `CLAUDE.md` |
| Gemini Code Assist | `GEMINI.md` |
| GitHub Copilot | `.github/copilot-instructions.md` |

All five tools work from the same `.cowork/` documents, and OpenAI Codex plus Cursor share `AGENTS.md`, so project context can stay consistent even when the active tool changes.

---

## Repository Layout

```text
.
|-- frameworks/
|   |-- ko/
|   |   |-- AGENTS.md
|   |   |-- CLAUDE.md
|   |   |-- GEMINI.md
|   |   |-- .github/copilot-instructions.md
|   |   `-- .cowork/
|   `-- en/
|       |-- AGENTS.md
|       |-- CLAUDE.md
|       |-- GEMINI.md
|       |-- .github/copilot-instructions.md
|       `-- .cowork/
|-- scripts/
|-- .github/workflows/
|-- dist/
|-- README.md
|-- DESIGN.md
|-- docs/
|-- CHANGELOG.md
|-- VERSION
`-- LICENSE
```

- `DESIGN.md` remains the maintainer-facing repository design companion at the root.
- `docs/` contains supplementary adoption, navigation, and scenario guides for the framework.
- `frameworks/ko/` is the Korean authoring baseline.
- `frameworks/en/` is the published English install variant kept aligned to the same release line.
- `dist/` contains generated release archives.
- `scripts/` contains build, validation, release, and upgrade automation.

---

## Release Workflow

Use semantic versioning starting from `1.0.0`.

Release automation in this repository verifies every published framework variant that exists under `frameworks/`.
Keep `frameworks/ko` and `frameworks/en` aligned to the same release version and framework contract.

### Build a framework archive

```powershell
./scripts/build-template.ps1 -Lang ko
./scripts/build-template.ps1 -Lang en
```

This produces:

```text
dist/cowork-context-framework-en.zip
dist/cowork-context-framework-kr.zip
```

### Verify release metadata

```powershell
./scripts/release.ps1 verify -Version 1.0.0
```

This verifies `VERSION`, `CHANGELOG.md`, and the published framework manifests that are present in `frameworks/`.

### Prepare a release branch

```powershell
./scripts/release.ps1 prepare -Version 1.0.0
```

### Publish an already-merged release

```powershell
./scripts/release.ps1 publish -Version 1.0.0
```

---

## Upgrade Model

The framework uses `.cowork/upgrade_manifest.md` as the authoritative upgrade manifest.

- `Version` is the version contained in the release.
- `From` is the required previous framework version.
- `v1.0.0` uses `From = 0.0.0` as the clean baseline.
- Later versions should form an adjacent sequential upgrade chain.

For consumers, `scripts/prepare-consumer-upgrade.ps1` can stage and inspect the manifest chain before changes are applied.

---

## Maintainer Notes

- Edit `frameworks/ko/` first while it remains the authoring baseline.
- Keep `frameworks/en/` aligned when published framework-facing wording, structure, or install behavior changes.
- Keep root maintenance entrypoints in sync across `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md`.
- Update both `README.md` and `DESIGN.md` when release or upgrade behavior changes.
- Rebuild archives instead of editing files under `dist/`.
