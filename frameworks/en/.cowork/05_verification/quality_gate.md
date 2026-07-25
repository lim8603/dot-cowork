# Quality Gate

> Minimum criteria required to pass each stage gate

---

## Gate-Application Principles

- Template files are not source documents for gate decisions.
- Registry documents define status and links; detailed evidence must be checked in canonical documents or instance documents.
- `session_logs/` and `imported_context/` are supporting evidence only. If required facts are not reflected into source documents, the gate is not considered satisfied.
- Deliverables confirmed as `Not Applicable` in `deliverable_plan.md` are excluded from gate judgment.
- `project_state.md` may keep a gate summary, but real gate decisions must verify the evidence documents defined for each gate.
- In Gate 1 and Gate 2, the collection status in `deliverable_plan.md` blocks progress only for **required deliverables whose source documents must already be formed in the current phase**.
- Missing minimum input in the very first session does not immediately fail a gate, but before moving to Gate 1 or Gate 2 the framework should first fill the gaps according to the first-session exit checks in `session_protocol.md`.
- `verification_evidence.md` is the evidence index for Gate 4 and Gate 5. Real judgment cross-checks that document with the source documents it references.

---

## Gate Definitions

### Gate 1: Intent -> Requirement

| Item | Criterion |
|------|-----------|
| Active Intent approved | At least one active Intent is `Approved` in `intent_registry.md` |
| Ambiguous requirements | 0 unresolved ambiguous requirements |
| Non-goals stated | Written |
| DEFINE core-question set visible | Answers or open questions from the DEFINE mandatory question set are visible in the related source documents and `project_state.md` |
| Deliverable plan confirmed | `deliverable_plan.md` approved by Human |
| Required deliverable collection started | For required deliverables that directly depend on current Define source documents, missing data must be registered in the `Missing Data List` rather than left untouched as `Not Collected` |

### Gate 2: Requirement -> Design

| Item | Criterion |
|------|-----------|
| Requirement IDs assigned | Completed for the requirement set |
| Priorities confirmed | Must items confirmed |
| Acceptance criteria written | Satisfies the approved Story set registered in `user_story_registry.md` |
| Risks identified | Initial registration completed |
| DEFINE core-question set closed | The DEFINE mandatory question set is closed through source documents; remaining items must have a Human-approved deferral reason and a next collection plan |
| Required deliverable collection aligned | Required deliverables that directly depend on current Define source documents must be at least `In Progress`, and key deliverables that directly use requirement-definition documents should be `Complete` or ready for immediate generation |

> Gate 1 and Gate 2 do not require every later-phase deliverable to be complete.
> However, if a required deliverable for the current phase is still `Not Collected`, or the DEFINE question set is empty without evidence, the gate is not satisfied.

### Gate 3: Design -> Implementation

| Item | Criterion |
|------|-----------|
| Domain model reviewed | Human Approved |
| ADRs recorded | Key decisions recorded |
| Interface contracts defined | Inter-module contracts confirmed |
| Tech stack confirmed | Registered in `tech_stack.md` |
| Milestone structure | At least draft state in `milestone_registry.md` |
| Task structure | At least draft state in `task_registry.md` |
| Team Task assignment | Role-based task allocation complete in `team_board.md` for team projects |

### Gate 4: Implementation -> Verification

| Item | Criterion | Core Evidence |
|------|-----------|---------------|
| Code review complete | Review checklist passed | `05_verification/verification_evidence.md`, `04_implementation/review_checklist.md`, related `04_implementation/tasks/TASK-*.md` |
| Verification-target Milestones aligned | Target Milestones are at least `Review` in `milestone_registry.md` | `05_verification/verification_evidence.md`, `04_implementation/milestone_registry.md`, related `04_implementation/milestones/MS-*.md` |
| Core Task completion criteria met | Target Tasks are at least `Review` in `task_registry.md` | `05_verification/verification_evidence.md`, `04_implementation/task_registry.md`, related `04_implementation/tasks/TASK-*.md` |
| Unit tests passed | Passed for the core scope | `05_verification/verification_evidence.md`, `05_verification/test_case.md`, related `04_implementation/tasks/TASK-*.md` |
| Coding convention followed | Lint passed | `05_verification/verification_evidence.md`, `04_implementation/review_checklist.md`, related `04_implementation/tasks/TASK-*.md` |
| End-to-end re-verification after a gate or invariant change (F-11) | Consumer list written for the tightened judgment and confirmed by the end-to-end suite | `05_verification/verification_evidence.md`, latest session log (consumer list), `05_verification/test_case.md` |

#### Gate 4 Decision Rules

- Check `verification_evidence.md` first, then cross-check whether the referenced source documents match the latest state.
- Milestone / Task / review / test / lint status should point to the same state across evidence, registries, detail documents, and the checklist.
- If not satisfied, delay entry into Verify and record blockers and open items in `project_state.md`.
- Exceptions are allowed only after Human approval, with reasons and a completion plan recorded in `project_state.md` and the latest session log.
- Test exceptions or partially unexecuted scope should also be recorded in `test_case.md` or `verification_evidence.md`.

### Gate 5: Verification -> Release

| Item | Criterion | Core Evidence |
|------|-----------|---------------|
| Integration tests passed | Full pass | `05_verification/verification_evidence.md`, `05_verification/test_case.md`, and related `04_implementation/tasks/TASK-*.md` when needed |
| NFR validation complete | Target values satisfied | `05_verification/verification_evidence.md`, `05_verification/test_strategy.md`, `05_verification/test_case.md` |
| Final document update complete | Completed | `05_verification/verification_evidence.md`, `06_evolution/project_state.md`, release-target canonical documents |
| Deliverable scope satisfied | Required deliverables in `deliverable_plan.md` can be generated | `05_verification/verification_evidence.md`, `02_project_definition/deliverable_plan.md`, `07_delivery/*` |

#### Gate 5 Decision Rules

- Use `verification_evidence.md` as the index, then re-check the latest verification results and document state in the original source documents.
- Integration / E2E / NFR / documentation / deliverable readiness should be aligned across evidence, `test_case.md`, `test_strategy.md`, `project_state.md`, `deliverable_plan.md`, and `07_delivery/*`.
- If not satisfied, hold the release and record the failed scope, missing documents, missing deliverables, and re-verification plan.
- Exceptions require Human approval and must leave the unsatisfied item, the acceptance rationale, and the follow-up plan in writing.

---

## End-To-End Re-Verification After A Gate Or Invariant Change (F-11)

> A change that **tightens** a verification rule, gate, invariant, or contract does not only change itself. It changes **the meaning of the existing paths that already ran through that gate**, so the breakage lands somewhere other than the tightening code.

### Why It Is Needed

- A tightening change usually ships with a new test proving it. That test passes — it only checks that the new rule behaves like the new rule.
- What actually breaks is **the existing path through that gate**. What used to pass now gets stopped, and that only surfaces when the end-to-end path is actually walked.
- So a feature can die quietly with every unit and integration test green, and nobody knows until a later session happens to walk it again. Because the fallout is **an existing defect promoted by this session's tightening**, ownership gets blurred too.

### Rules

- **Write the consumer list at the moment of tightening.** "What has to pass this judgment" — code paths, screens, contracts / schemas, seeds / fixtures, and existing data.
- **Confirm that list with the end-to-end suite before the session closes.** It must be verification that walks the real path (E2E / integration); passing unit tests does not substitute.
- **Never stay silent about what went unverified.** If it could not be run, state per consumer what remains unverified and register it in the `project_state.md` carry-over and the session log. Even under a Human-approved exception, **passing it by without notice is outside the scope of that exception.**
- This item is part of the Gate 4 judgment at phase transition (table above).

### Typical Triggers

- Strengthening the conditions of a promotion / deployment gate, schema or API contract changes, adding uniqueness or referential-integrity constraints, narrowing what a validator accepts, tightening authorization checks, making a default or fallback more conservative.

---

## Placeholder / Structure Check

If any of the following remain in a canonical document, registry, or instance document that is currently used for gate judgment or is marked `Required` / `Recommended` in `deliverable_plan.md`, the gate is not satisfied.

- Placeholders and guide comments inside `templates/*_template.md` are normal.
- `No registered ... yet` lines are allowed in registries, but example rows or dummy sample rows are not.
- `Template` still remains in the `H1` title.
- Guide comments in the `<!-- ... -->` form remain in a canonical document.
- Placeholder IDs such as `INT-000`, `US-000`, `MS-000`, `TASK-000`, or `ADR-000` remain in a live source document.
- An active item that is not present in the registry is treated as though it were a source document.
- The source-document structure in `deliverable_plan.md` does not match the real registry / instance layout.
- A final decision is made while facts exist only in imported context and were never promoted into source documents.

---

## Exception Handling

When a gate must be bypassed:

1. The Human approves it explicitly.
2. Record the reason in an ADR or the session log.
3. Define a follow-up completion plan.
