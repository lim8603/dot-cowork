# Repository CLAUDE.md

This repository manages the Korean-authored source and published English variant of the AI-Human cowork framework.
This file is the repository maintenance context that Claude Code reads automatically.

> OpenAI Codex and Cursor users: see `AGENTS.md` in the project root.
> Gemini Code Assist users: see `GEMINI.md` in the project root.
> GitHub Copilot users: see `.github/copilot-instructions.md`.
> All four files share the same repository maintenance context.

## Scope

- Authoring baseline lives under `frameworks/ko`.
- Published English install variant lives under `frameworks/en`.
- Distribution archives are generated into `dist/`.
- Maintenance scripts live under `scripts/`.

## Repository Structure

```text
.
|-- AGENTS.md
|-- CLAUDE.md
|-- GEMINI.md
|-- .github/
|   |-- copilot-instructions.md
|   `-- workflows/
|-- README.md
|-- CHANGELOG.md
|-- DESIGN.md
|-- docs/
|   `-- document-map.md
|-- VERSION
|-- LICENSE
|-- frameworks/
|   |-- ko/
|   |   |-- AGENTS.md, CLAUDE.md, GEMINI.md, .github/copilot-instructions.md
|   |   `-- .cowork/
|   `-- en/
|       |-- AGENTS.md, CLAUDE.md, GEMINI.md, .github/copilot-instructions.md
|       `-- .cowork/
|-- dist/
`-- scripts/
```

## Working Rules

- Default to editing `frameworks/ko`.
- Keep `frameworks/en` synchronized when framework-facing structure, wording, or release contract changes.
- Use semantic versioning starting from `1.0.0`.
- Do not assume Mermaid is enabled for Markdown documents in this repository. Use Mermaid only when the active framework variant or target project explicitly opts in; otherwise prefer plain Markdown prose, lists, or tables. Use static `SVG` or `PNG` assets only when a visual is necessary and Mermaid is either unsuitable or unsupported by the required publishing target.
- Do not manually edit archives under `dist/`; always rebuild them from source.

## Common Tasks

| Task | Command |
|------|------|
| Build Korean archive | `./scripts/build-template.ps1` |
| Verify release metadata | `./scripts/release.ps1 verify -Version <MAJOR.MINOR.PATCH>` |
| Prepare release branch | `./scripts/release.ps1 prepare -Version <MAJOR.MINOR.PATCH>` |
| Publish merged release | `./scripts/release.ps1 publish -Version <MAJOR.MINOR.PATCH>` |
| Audit markdown | `./scripts/audit-markdown.ps1` |

## Keywords

- `!audit`: Run a maintenance audit for markdown files in this repository, excluding `dist/`. Explicitly include `docs/feature-flow-check.md` in the docs consistency review. Report issues and suggested fixes. Do not auto-apply changes.
- `!build`: Prepare a release-ready branch in this order: (1) classify repo-maintenance vs framework changes, (2) update root docs only when repository promises changed, (3) draft `CHANGELOG.md`, (4) confirm the target version, (5) update `VERSION` and `frameworks/ko/.cowork/upgrade_manifest.md`, (6) run `./scripts/release.ps1 prepare -Version <version>`.
- `!build` default contract: if work starts on `main`, create `release/v<version>` first, continue there, run verification, and stop before commit/push/PR unless explicitly requested.
- `!release`: Publish an already-merged release only. Confirm the target version on `main`, then run `./scripts/release.ps1 publish -Version <version>` from a clean `main` checkout.

## Editing Notes

- Root-level `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, and `.github/copilot-instructions.md` are for maintaining this repository itself.
- Keep maintainer-facing core docs such as `README.md`, `DESIGN.md`, and `CHANGELOG.md` at the repository root. Use `docs/` for supplementary planning and product-facing supporting documentation.
- The identically named files inside `frameworks/ko/` and `frameworks/en/` are the published project entrypoints. Do not confuse them with the root maintenance files.
- Keep all four root entrypoint files in sync.
- When framework structure, release policy, or upgrade behavior changes, reflect that in both `README.md` and `DESIGN.md`.

## Typical Workflow

1. Edit `frameworks/ko/` first.
2. Sync `frameworks/en/` when the change affects published framework behavior or install wording.
3. Update root docs or scripts only when the framework contract or release workflow changes.
4. Run `./scripts/release.ps1 prepare -Version <MAJOR.MINOR.PATCH>` to refresh metadata and verify the branch.
5. Open and merge the release PR into `main`.
6. Publish by tagging the merged commit with `./scripts/release.ps1 publish -Version <MAJOR.MINOR.PATCH>`.
