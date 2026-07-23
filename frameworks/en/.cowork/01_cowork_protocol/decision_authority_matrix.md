# Decision Authority Matrix

> Defines who decides what: Human / AI / Joint decision boundaries

---

## Purpose

When AI and Humans collaborate, not every decision needs the same level of validation.
This document makes authority levels explicit so the team can **reduce unnecessary waiting and focus on the important decisions**.

---

## Authority Levels

| Level | Name | Description |
|-------|------|-------------|
| **H** | Human Decides | The Human makes the final decision. The AI presents options and reasoning. |
| **J** | Joint Decision | The AI proposes, then the Human reviews and approves before proceeding. |
| **A** | AI Autonomous | The AI proceeds autonomously. Review can happen afterward. |

---

## Decision Matrix

| Area | Decision | Level | Notes |
|------|----------|-------|------|
| **Architecture** | Core tech-stack selection | H | |
| | Design-pattern selection | J | AI presents trade-off analysis |
| | Internal module structure | A | Within the coding convention |
| **Requirements** | Scope confirmation | H | |
| | Requirement elaboration | J | AI drafts, Human validates |
| | Acceptance criteria writing | J | |
| **Implementation** | Algorithm / logic choice | J | |
| | Variable names / function signatures | A | Assuming conventions are followed |
| | Error-handling strategy | J | |
| | Refactoring | A | When behavior does not change |
| **Testing** | Test strategy | J | |
| | Test-code writing | A | |
| **Documentation** | Structural changes / registry promotion | H | Proceed only after Human approval |
| | Writing or editing document content | A | With Human review expected |
| **Version Control** | Branch strategy | H | |
| | Commit message | A | Must follow the convention |

---

## Collaboration Execution Mode (F-06)

> An operating switch that separates the **definition** of role seats from their per-session **bookkeeping**. Branch on the `Collaboration Execution Mode = solo | team` field in `project_state.md`. (Concept summary in `cowork.md` §Collaboration Execution Mode.)

### Operation By Mode

| Item | `team` | `solo` |
|------|--------|--------|
| Seat definition (role boundaries, authority, ownership area) | Kept | **Kept** (scaffolding for future onboarding) |
| Per-role `my_state.md` bookkeeping | Operated | Skipped (single `my_state.md` or project_state-centered) |
| `team_board.md` | Operated | Not created |
| Upward sync (personal <-> shared) | Operated | Skipped |
| Decision authority (H/J/A) | Per seat | One person holds all seats (Master by default) |
| Briefing role view (Master/Member) | Split | Single (§`session_protocol.md` solo briefing) |

### Why Keep Seat Definitions Even In solo

- A seat definition (who decides and owns what) is a **blueprint for the chair a future teammate will sit in**. When a person joins, assign them to that seat through the §`session_protocol.md` 1B-3 match, and the onboarding cost is prepaid.
- Per-session per-role bookkeeping, by contrast, is pure overhead for a single person. solo keeps the definition and turns off only the bookkeeping.

### Mode Transition

- `solo -> team`: when a real person is assigned to a seat. Create `team_board.md` -> assign to the seat -> reflect the assignee onto that role's Tasks -> create the personal `my_state.md` (§`session_protocol.md` 1B-3).
- `team -> solo`: when a member leaves and operation returns to a single person. Do not archive the seat definitions — keep them but stop the bookkeeping.
- Transition is a Human-approved decision (H) and is recorded together with the mode field in `project_state.md`.

### Judgment Criteria

- Even a solo project should actively maintain seat definitions **if a teammate joining is within realistic sight** (team definition + solo bookkeeping is the default combination).
- If the prospect of anyone joining is vague, keep seats minimal or maintain only a single Master seat — do not manage an org chart you will not use every session.

---

## Decision Reversal & Drift Detection — F-09

> Actively catch states where a decision confirmed in an ADR is **silently overturned without an ADR** (reversal), or where documents / code have drifted out of line with the decision (drift). This is the defense line for decision traceability (principles #1 and #4).

### Why It Is Needed

- When a confirmed decision is overturned without grounds, later decisions pile up on a collapsed foundation. Yet a reversal usually surfaces **only when a question happens to touch it** — without an automatic detector, you are relying on luck.
- This rule replaces that luck with a **review trigger**.

### Reversal Detection

- **Trigger**: at phase transitions (together with Pre-Gate Harvest) and before a release.
- **Check**: compare the Accepted decisions in `adr_registry.md` against the actual state (code, `tech_stack.md`, the body of the design canonical documents). Find items implemented or documented differently from the decision.
- **Action**: if a reversal is real, either (a) roll it back or (b) **issue a corrective ADR** to update the decision (promote the ungrounded reversal to a legitimate decision after the fact, or roll it back). Preserve the history through commits and session logs (the ADR body carries only the current decision).

### Decision Cohort Review

- If there are **systematic grounds to suspect** decisions made in a particular window or condition (e.g. a known tool quality-degradation window, a hastily rushed sprint), flag that cohort as a review candidate.
- Look at it at the **cohort level**, not the individual decision — if one is wrong, suspect the other decisions from the same window too.
- Close each review as one of normal / corrected / reversed; corrections and reversals follow the procedure above.

### Authority

- Judging whether a reversal occurred and issuing a corrective ADR are **J** (AI proposes -> Human approves). When the AI finds an ungrounded reversal, it raises its concern once and follows the Human's decision.
