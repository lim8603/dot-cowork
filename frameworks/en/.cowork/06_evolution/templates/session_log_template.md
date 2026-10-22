# Session Log Template

> Session record that tracks the activity and result of an AI-Human collaboration session

---

## Template Usage Rules

- This file is the template for creating a new session log.
- Replace `INT-000`, `MS-000`, `TASK-000`, and `#000` with real session values.
- If a related item does not exist, do not keep the placeholder; write `None`.
- Clear empty checklist items and blank table rows after real logging, and keep only the key information when the session ends.
- Boundary notes such as migration notes, rollout memos, and integration memos should first be written here instead of creating a separate temporary document. If they become repeatedly referenced or approved source criteria, promote them into a source document.
- Promotion is not the default. Review it only when there is a clear basis under `Promotion Candidate Check`; otherwise keep the content in the session log.

---

## Session Info

| Item | Value |
|------|------|
| Date | YYYY-MM-DD |
| Session Number | #000 |
| Start Time | |
| End Time | |
| Related Intent | `INT-000` |
| Related Milestone | `MS-000` (if applicable) |
| Related Task | `TASK-000` (if applicable) |

---

## Goals For Today
<!-- The Human's intent for this session -->
1.
2.

---

## Completed Work
- [ ]
- [ ]

## Incomplete / Carry-Over Items
<!-- Record newly registered `T*`/`B*` and resolution outcomes (`T3 → TASK-012`, `B7 dropped: reason`) by ID. The current state lives in the `project_state.md` carryover backlog. -->
- [ ]
- [ ]

---

## Major Decisions

| Decision | Basis | Decider | ADR |
|----------|-------|---------|-----|
| | | H / AI / Joint | |

---

## Created / Modified Files

| File | Change Type | Description |
|------|-------------|-------------|
| | create / update / delete | |

---

## Temporary Working Notes (If Needed)
<!-- migration note, rollout memo, integration memo, temporary diagnostic note, etc. -->

| Type | Summary | Follow-Up Handling |
|------|---------|--------------------|
| migration / rollout / integration / diagnostic | | keep in session log / reflect into related source document / review promotion |

---

## Promotion Candidate Check (If Needed)
<!-- Review promotion to the knowledge base, retrospective, or source documents only when the answer is clearly Yes. -->

- [ ] Is this immediately necessary for the next session to resume, and would work block without it being in `project_state.md` or `my_state.md`?
- [ ] Is this a reusable pattern, lesson, or anti-pattern across multiple sessions or tasks, making it worth recording in `knowledge_base.md`?
- [ ] Is this a retrospective finding and action item for a completed task, Intent, or Milestone, making it worth recording in `retrospective.md`?
- [ ] Would leaving this only in the session log break gate decisions, export, or source-of-truth consistency?
- [ ] If none of the questions above is a clear Yes, keep it in the session log.
- [ ] Unconfirmed hypotheses, raw copied notes, one-off debugging traces, and duplicated content already reflected in another source document should not be promoted by default.

---

## Shared State Index Updates

- [ ] `project_state.md` synced
- [ ] next starting point synced
- [ ] Human confirmation items synced

---

## Next-Session Context
<!-- The key information the next AI session needs to continue -->

### Current State

### Next Work

### Cautions
