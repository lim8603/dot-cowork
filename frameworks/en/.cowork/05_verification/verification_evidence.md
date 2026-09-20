# Verification Evidence

> Evidence index that summarizes and connects test, review, NFR, and release-readiness evidence in one place

---

## Purpose

This document organizes evidence created during Verify into the **canonical evidence index** used for gate decisions.

- Quickly restore verification evidence scattered across session logs and individual Task documents.
- Show what has been verified and where the basis lives when deciding Gate 4 or Gate 5.
- Keep only **summary + source location** here instead of duplicating raw logs, screenshots, or external reports.
- Even in projects where test volume keeps growing, this document should remain a **trusted evidence index**, not a log warehouse.

---

## Document Info

| Item | Value |
|------|------|
| Related Intent | Refer to the active Intent or the relevant `INT-*` |
| Related Milestone | `MS-*` that the evidence is linked to (if applicable) |
| Related Test Strategy | `test_strategy.md` |
| Related Test Case | `test_case.md` |
| Version | Project baseline |

---

## Operating Principles

- Identify evidence applicability by **target commit/build, execution date, environment/configuration, and scenario**. Link the command/procedure and results, identify AI or Human execution, and describe dirty-worktree changes when applicable.
- Do not generalize a test count or local Pass to the entire product or other environments. For configuration, permission, or packaged-artifact changes, check the path from declaration through consuming code to actual use. For example, a setting-scope change may require affected single/multi-workspace and post-install reload scenarios.
- When related code, contracts, or environments change, retain the previous Pass as history and mark current coverage for re-verification or as unverified. Unrelated changes do not require repeating the full suite.
- When deferring CI/manual verification, record **last verified revision, unverified scope, owner, and rerun date/trigger** in `Open Evidence Gaps`. Cost-based deferral is not Pass. Shared state retains only the gap ID and link.
- Separate Task completion, project health, and release readiness. Green is not evidence of a gate passing. Judge gates using applicable evidence for the target and required scope; record the approver, reason, and follow-up conditions for accepted exceptions.
- At the end of an execution cycle that changes verification results or deferral conditions, update the relevant EV/GAP and current Gate summary. Label historical Gate decisions by version/date to distinguish them from current decisions.

- This document is the **evidence summary index** for Verify / Release decisions.
- Detailed procedures and expected results belong in `test_strategy.md`, `test_case.md`, `review_checklist.md`, and related `TASK-*` documents.
- Keep raw execution logs, external reports, and measurement results in their original location, and write only what they prove and where they live in this document.
- When possible, track Gate 4 and Gate 5 items with `EV-*` IDs.
- If evidence is still missing, do not delete the item; leave it in `Open Evidence Gaps`.

---

## Evidence Area Summary

| Area | Latest Status | Main Evidence Documents | Last Updated | Notes |
|------|--------------|-------------------------|-------------|------|
| Review Evidence | Not Started / In Progress / Ready | `04_implementation/review_checklist.md`, related `TASK-*` | | |
| Test Execution Evidence | Not Started / In Progress / Ready | `test_case.md`, related execution logs / reports | | |
| NFR Evidence | Not Started / In Progress / Ready | `test_strategy.md`, related measurement results | | |
| Release Readiness Evidence | Not Started / In Progress / Ready | `quality_gate.md`, `project_state.md`, related release sources | | |

---

## Evidence Index

| EV ID | Type | Verification Target / Scope | Result | Related Gate | Raw Evidence Location | Last Updated | Target Revision / Environment / Executor |
|-------|------|-----------------------------|--------|-------------|----------------------|-------------|------|
| EV-001 | Review / Unit / Integration / E2E / NFR / Release | | Pass / Fail / Partial / Deferred | Gate 4 / Gate 5 | | YYYY-MM-DD | commit/build; OS/config; AI/Human |

---

## Gate Decision Notes

| Gate | Decision Status | Core EV ID | Summary | Notes |
|------|-----------------|-----------|---------|------|
| Gate 4 | Ready / Blocked / Partial | `EV-*` | | |
| Gate 5 | Ready / Blocked / Partial | `EV-*` | | |

---

## Open Evidence Gaps

| ID | Item / Last Verified Revision | Unverified Scope | Owner / Rerun Date or Trigger | Status |
|----|------|------------------|------------|--------|
| GAP-001 | | | | Open / Resolved / Deferred |
