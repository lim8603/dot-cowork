# Retrospective

> Retrospective document that records what went well and what can be improved

---

## Purpose

A retrospective can be recorded for the whole project, a specific Intent, or a specific Milestone.
State the scope first, then record what worked and what should improve.

---

## Accumulation / Split Criteria

- One retrospective should handle **one scope only**. Do not mix the whole project, a specific `INT-*`, and a specific `MS-*` into one ever-growing body.
- Length trigger: start reviewing a split by round or scope when **4 or more** completed retrospectives accumulate in one document, or when repeated additions make the body grow quickly.
- Recent-reference trigger: if **the last 3 sessions** repeatedly reference only the latest 1 or 2 retrospectives while older ones stay untouched, move older retrospectives into separate documents and keep this document as a lighter index centered on the recent ones.
- Even after splitting, keep only the retrospective summary and open action items that still affect the current project here, and move detailed historical records into round-specific or scope-specific documents.

---

## Retrospective Info

| Item | Value |
|------|------|
| Covered Period | |
| Related Intent | |
| Related Milestone | `MS-NNN` / whole project |
| Date | YYYY-MM-DD |

---

## 1. What Went Well
- None

## 2. What Could Be Improved
- None

## 3. Action Items

| Action | Related Milestone | Owner | Due Date | Status |
|--------|-------------------|-------|---------|--------|
| None | - | - | - | - |

---

## 4. Needed Updates To Cowork Rules (Framework Back-Port Queue)

> This section is the single queue for **instance learning -> framework back-port**. Add here the rules/patterns discovered while running the project that would help other projects too if reflected into the framework itself.

- None

### Back-Port Trigger

When the instance produces a new operating rule, document structure, diet rule, tripwire, and so on during a session, the AI asks itself:

- Is this rule **specific to this project**, or **generally valid for other projects too**?
- Does it **fill a gap/defect in the framework 1.0 defaults** (for example, giving a trigger to a triggerless rule, adding a missing artifact)?
- Has this rule been applied/referenced repeatedly in 2 or more of the last 3 sessions (a stabilization signal)?

**If any answer is "yes"**, register that rule as `[candidate]` in this queue. If it stays only in the instance and is not flowed into the framework, the next project rediscovers the same thing.

### Promotion Path

1. The Human reviews the queue item and **approves reflection into the framework**.
2. Approved items are reflected into the framework repo's next minor version and registered in the version chain / file classification of `.cowork/upgrade_manifest.md` (§`session_protocol.md` 16 Framework Upgrade).
3. Completed items are removed from the queue, leaving one line noting which version they landed in (for example, `-> 1.1.0`).

> This queue is itself the execution mechanism of framework principle #6 ("improve the rules themselves through retrospectives"). Keep the section even when the queue is empty.

---
