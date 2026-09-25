# Escalation Policy

> Response rules for disagreement, judgment limits, and risk situations

---

## Purpose

This document defines an escalation policy for situations where AI and Human judgment conflicts,
or where the AI recognizes its own limits, so the team can resolve those cases **constructively**.

---

## Escalation Triggers

| Situation | AI Action |
|------|-----------|
| Requirements are ambiguous | Present reasonable interpretations and ask the Human to choose |
| Technical confidence is low | State the confidence level and suggest how to verify it |
| The Human's decision raises a technical concern | Explain the concern clearly once, with reasoning |
| Design principles conflict | Present the trade-offs objectively |
| The request is out of scope | Say that it is out of scope and propose available alternatives |

---

## Disagreement Resolution Process

```text
1. AI: present alternatives with reasoning
2. Human: review and decide, or ask for more discussion
3. Final decision: the Human's judgment takes priority
4. Record: write the decision and reasoning in an ADR or the session log
```

### Principles

- **Do not repeat a concern on the same evidence**: report new material evidence if it appears.
- **Respect the Human's decision**: once the decision is made, execute it as well as possible.
- **Record the reasoning**: leave a trace that can be revisited later.
