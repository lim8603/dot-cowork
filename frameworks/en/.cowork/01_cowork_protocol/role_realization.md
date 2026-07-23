# Role Realization Guide (F-07)

> A guide to **how a role seat (Role-ID) is implemented as an actual acting entity**.
> The seat's definition and authority boundaries are handled by `decision_authority_matrix.md`, and seat-to-person matching by `session_protocol.md` 1B. This document covers the execution layer of "who or what plays that seat".

---

## Purpose

A role seat (for example, Forge=backend / Lux=frontend / Sage=review) can be executed in three ways. Whichever you choose, the **definition** of the seat is the same; what changes is the acting entity.

| Realization | Entity Playing The Seat | Value |
|-------------|-------------------------|-------|
| **Person** | A real team member | Genuine independent judgment and accountability (team mode) |
| **AI persona** | One AI switching hats | Context switching and role framing. But errors are correlated |
| **Independent sub-agent** | An AI with a separate system prompt / model / context | Errors are decorrelated — a genuine second pair of eyes |

---

## Core Principle: The Persona Is The Wrapper, The Behavioral Contract Is The Substance

- The role name and tone (the persona) themselves contribute almost nothing to output quality.
- What produces value is the **behavioral contract** the persona carries. For example, Sage = "verify adversarially, default to disproof, run an independent pass".
- So when creating a seat, define **the seat's behavioral contract (what it produces, in what attitude)** before its name.

## Why An Independent Sub-Agent (Error Decorrelation)

- When the same AI plays multiple roles with the same context and same model, **all roles share the same blind spots** — errors are correlated and the review waves its own mistakes through.
- Running a seat as an independent sub-agent with a **separate system prompt + (where possible) a different model + a separate context window** decorrelates errors, raising the chance that one entity catches another's mistake. This is the only real basis on which multi-agent produces value.
- **Adversarial verification** (Sage-style review) benefits most from independent execution. If the generating entity and the verifying entity share context, verification becomes a formality.

---

## When To Materialize

- **Default = AI persona.** Most seats are adequately played by one AI changing framing (low cost and latency).
- Signals to **promote to an independent sub-agent**:
  - the seat's output is of a **verifying/disproving** nature toward another seat's output (review, QA, red team).
  - the decision is hard to reverse and the cost of a wrong call is high (architecture judgment, release gate).
  - there is **multi-faceted failure** that is easy to miss from one viewpoint — assign different lenses (correctness, security, performance, reproducibility) to separate entities.
- Promotion cost: increased tokens and latency, orchestration complexity. Tune it in proportion to request intensity ("a quick check" -> single; "audit thoroughly" -> multiple + adversarial).

## Materialization Execution Rules

1. Fix the seat's **behavioral contract** in a sentence first (what, in what attitude, with what default).
2. When running as an independent sub-agent, give it **a different model / different context from the main execution** where possible to maximize decorrelation.
3. Frame adversarial verification not as "do you agree?" but as "**disprove it; when uncertain, default to rejection**".
4. When there is multi-faceted failure, use verifiers with **different lenses** rather than N identical verifiers (diversity over duplication).
5. Realization (persona/independent) and the model used vary by tool capability, so for the concrete execution means consult the current tool's entrypoint document (`CLAUDE.md`, and so on) together with `tooling_environment_guide.md`.

---

## Evolution Path

- As of 1.1.0, the default combination is **seat definition (team) + solo bookkeeping + AI persona execution**.
- In phases where the project must raise verification quality (large refactors, release gates, safety-related decisions), promote the review seat first to an **independent sub-agent as a pilot**, and once the effect is confirmed, extend to other seats.
- Pilot results and promotion judgments can be raised as candidates to revise framework defaults through the `retrospective.md` §4 Framework Back-Port Queue.
