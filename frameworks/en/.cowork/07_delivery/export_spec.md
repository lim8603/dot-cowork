# Export Specification

> Source document that defines official deliverable generation rules and source-document mapping

---

## Purpose

`.cowork/` is the set of **shared source documents for working sessions**.
`docs/` is the set of **official delivery documents**.

This document defines the **source-document interpretation rules** and **generation methods** used to create official documents from the cowork source documents
when a project or phase is completed.

---

## Operating Boundary

- This document defines **which source documents to read and how to generate from them**.
- The active target list, approval state, and missing data for actual deliverables follow `02_project_definition/deliverable_plan.md`.
- The final set of official deliverables is the sum of the active default recommended 14 items plus any Human-approved extension deliverables (15+) in `deliverable_plan.md`.

---

## Export Philosophy

The goal of official deliverable generation in this framework is **better traceable official documents**, not rigid format cloning.

### Invariant Rules

- Every official deliverable must be traceable back to the cowork source documents that support it.
- Do not omit required sections, key decisions, major constraints, or unresolved risks.
- If the source documents are incomplete, do not hide that. Mark it as `Not written` or `Undecided`.
- If the AI uses inference, keep it separate from confirmed facts under labels such as `Assumption`, `Inference`, or `Needs Additional Confirmation`.

### AI Discretion

- The AI may rearrange section order, table layout, and explanation depth to improve readability.
- It may consolidate repeated content or explain the relationship between multiple source documents more clearly.
- As AI quality improves, it may attempt more polished synthesis and explanation.
- That discretion must never break the invariant rules or source-document traceability.

---

## Source Priority

Use the following priority when interpreting source documents for official deliverable generation.

1. currently valid approved decisions (ADRs) and approved canonical, registry, and instance documents
2. latest session log, as supporting evidence for gaps in the source documents
3. imported context, as raw evidence before extraction

- If an approved ADR conflicts with a source document, do not choose one silently. Check the decision date and scope, reconcile the documents, then generate the deliverable.

- `templates/*_template.md` are not source documents for official deliverable generation.
- `session_logs/` and `imported_context/` are supporting evidence only when higher-priority source documents are empty.
- Imported context should be promoted into canonical / registry / instance documents first whenever possible.

---

## Default Recommended 14 Deliverable Mapping

> This table defines the standard source documents and generation method for the default recommended 14 deliverables.
> Real generation still follows the `Required / Recommended / Not Applicable` decision and approval state in `deliverable_plan.md`.

| # | Official Deliverable | Default Source Documents | Generation Method | Notes |
|---|----------------------|--------------------------|-------------------|------|
| 1 | Requirements Specification | `02_project_definition/requirement_spec.md` | Direct | |
| 2 | Domain Glossary | `02_project_definition/domain_glossary.md` | Direct | |
| 3 | Functional Specification | `02_project_definition/functional_spec.md` | Direct | |
| 4 | UI Specification | `03_design_artifacts/ui_spec.md` | Direct | |
| 5 | WBS | `04_implementation/milestone_registry.md` + `04_implementation/task_registry.md` + optional `04_implementation/tasks/TASK-*.md` | Synthesis | Registry + instance structure |
| 6 | System Architecture Design | `03_design_artifacts/domain_model.md` + `03_design_artifacts/adr_registry.md` + `03_design_artifacts/adrs/ADR-*` + `03_design_artifacts/tech_stack.md` | Synthesis | Use only approved ADRs |
| 7 | API Specification | `03_design_artifacts/interface_contract.md` | Direct | |
| 8 | Database Design | `03_design_artifacts/data_model.md` | Direct | |
| 9 | Test Scenarios | `05_verification/test_strategy.md` | Direct | |
| 10 | Test Cases | `05_verification/test_case.md` | Direct | |
| 11 | Release Notes | `07_delivery/release_note.md` | Direct | |
| 12 | Operation Guide | `07_delivery/operation_guide.md` | Direct | |
| 13 | User Manual | `07_delivery/user_manual.md` | Direct | |
| 14 | README | full-context synthesis | Synthesis | intent + tech stack + usage |

---

## Extension Deliverables (15+) Interpretation

- Only Human-approved items registered in `deliverable_plan.md` -> `Extension Deliverables (15+)` are included in official deliverable generation.
- The number, title, and core data source documents for an extension deliverable are confirmed through `deliverable_plan.md`.
- Use `Direct` for a single canonical document, `Synthesis` for multiple source documents, and the registry + instance rule when that structure applies.
- If the extension can be absorbed into one of the default 14 deliverables, prefer integration over creating an unnecessary separate official document.

---

## Generation Method Definitions

### Direct

Organize the content of a cowork source document into official-document form and write it into `docs/`.

- remove template guide comments (`<!-- -->`)
- add document number, version, and approval header
- generate a table of contents when helpful
- allow section reordering, deduplication, and wording improvements
- specify the source documents used in the header or references section
- separate unconfirmed content into `Assumption` or `Needs Additional Confirmation`

### Synthesis

Combine multiple cowork source documents into one official document.

- When several source documents are combined, preserve traceability of which document contributed which content.
- The AI may propose a better explanation structure, but must not add unsupported detail as if it were confirmed fact.

### Registry + Instance Rule

- Use the registry as the baseline for lists, status, priority, and links.
- Use instance documents as the source for detail explanation, decision basis, or individual work plans.
- For WBS generation, start from `milestone_registry.md` and `task_registry.md`, and expand `tasks/TASK-*.md` only when deeper explanation is needed.
- For architecture generation, read `adr_registry.md` together with `adrs/ADR-*.md` and reflect only approved decisions into the body.

---

## Generation Timing

| Timing | Target | Trigger |
|------|--------|--------|
| Phase completed | deliverables related to that phase | after the Quality Gate passes |
| Project completed | active default 14 deliverables + approved extension deliverables (15+) | Human says `release` |
| On demand | individual document | Human request |

---

## Output Folder Structure

```text
docs/
├── 01_requirements_spec.md
├── 02_domain_glossary.md
├── 03_functional_spec.md
├── 04_ui_spec.md
├── 05_wbs.md
├── 06_system_architecture.md
├── 07_api_spec.md
├── 08_database_design.md
├── 09_test_scenarios.md
├── 10_test_cases.md
├── 11_release_notes.md
├── 12_operation_guide.md
├── 13_user_manual.md
└── README.md
```

> When extension deliverables are approved, number them after the default structure. For example: `15_additional_deliverable.md`
