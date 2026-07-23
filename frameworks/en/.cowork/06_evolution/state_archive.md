# State Archive

> **Append-only raw store** of past completion narratives and handoff history harvested from `project_state.md` / `my_state.md` (Log / Archive role).
> Not a per-session loading target. The summary in `project_state.md` points here, and you open a specific section only when a specific past-session context is needed.

---

## Purpose / Operating Rules

- This document is the **harvest target** of **diet rule R1** (-> `session_protocol.md` §Shared State Index Management, `project_state.md` §Writing / Maintenance Rules).
- On `wrap up`, **move the raw text** of the narrative completion history (the ✅-done and AI handoff blocks) in `project_state.md` / `my_state.md` that is **beyond the last N sessions (default 3)** here. Leave only a one-line pointer in the body.
- The move is **append-only** — here we do not summarize or delete; we accumulate the raw text as-is. Refinement and summarization happen only on the `project_state.md` body side.
- The unit of the move is a session (#NNN) or a harvest round. Add a `### #NNN harvest` section (or round) under `## Harvest` below.
- Even when this document itself grows excessively large, **do not compress it** — the role of an archive is to preserve the raw text. If needed, split the file by round/period (`state_archive_YYYY.md`, and so on), but do so only after Human approval.

---

## Harvest (project_state.md)

> Raw text moved from the `Next Starting Point`, `AI Handoff Memo`, and `recent completion narratives` of `project_state.md`. Stack the newest harvest on top.

_No items harvested yet._

---

## Harvest (my_state.md)

> Raw text moved from the `Session Intent`, `recent decision/work notes`, and `reference session logs` of `members/<name>/workspace/my_state.md`.

_No items harvested yet._

---

## Writing / Maintenance Rules

- Pointer discipline: when pointing to a harvest from `project_state.md`, leave a one-line pointer of the form `[state_archive.md](state_archive.md) #NNN harvest`.
- This document is not a canonical body but a log/archive (Log / Archive). When using it as the basis for a confirmed fact, always prefer approved source documents / ADRs, and use the raw text here only as supporting evidence.
- Unlike imported context, this document is history the project produced itself, so it is tracked in VCS (unlike session logs, it is not a gitignore target).
