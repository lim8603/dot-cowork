# 상태 아카이브 (State Archive)

> `project_state.md` / `my_state.md`에서 하베스트된 과거 완료 서사·핸드오프 이력의 **append-only 원문 저장소**(Log / Archive 역할).
> 매 세션 로드 대상이 아니다. `project_state.md`의 요약이 포인터로 가리키며, 특정 과거 세션 맥락이 필요할 때만 해당 섹션을 연다.

---

## 목적 / 운영 규칙

- 이 문서는 **다이어트 규칙 R1**(→ `session_protocol.md` §공유 상태 인덱스 관리, `project_state.md` §작성/유지 규칙)의 **하베스트 대상**이다.
- `마무리` 선언 시, `project_state.md`·`my_state.md`의 서술형 완료 서사(✅완료·AI 핸드오프 블록) 중 **최근 N세션(기본 3) 초과분**을 여기로 **원문 이관**한다. 본문에는 1줄 포인터만 남긴다.
- 이관은 **append-only**다 — 여기서는 요약·삭제하지 않고 원문을 그대로 누적한다. 정제·요약은 `project_state.md` 본문 쪽에서만 한다.
- 이관 단위는 세션(#NNN) 또는 이관 회차다. 아래 `## 이관분` 아래에 `### #NNN 이관분`(또는 회차) 섹션을 추가한다.
- 이 문서 자체가 과도하게 비대해져도 **압축하지 않는다** — 아카이브의 역할은 원문 보존이다. 필요하면 회차/기간 단위로 파일을 분리(`state_archive_YYYY.md` 등)하되, 이는 Human 승인 후 진행한다.

---

## 이관분 (project_state.md)

> `project_state.md`의 `다음 시작점`·`AI 핸드오프 메모`·`최근 완료 서사`에서 이관된 원문. 최신 이관분을 위에 쌓는다.

_아직 이관된 항목이 없다._

---

## 이관분 (my_state.md)

> `members/<이름>/workspace/my_state.md`의 `오늘의 세션 Intent`·`최근 결정/작업 메모`·`참조 세션 로그`에서 이관된 원문.

_아직 이관된 항목이 없다._

---

## 작성 / 유지 규칙

- 포인터 규율: `project_state.md`에서 이관분을 가리킬 때는 `[state_archive.md](state_archive.md) #NNN 이관분` 형태의 1줄 포인터를 남긴다.
- 이 문서는 기준 본문(Canonical)이 아니라 로그/아카이브(Log/Archive)다. 확정 사실의 근거로 삼을 때는 항상 승인된 기준 문서/ADR을 우선하고, 여기 원문은 보조 근거로만 쓴다.
- imported context와 달리 이 문서는 프로젝트가 스스로 생산한 이력이므로 VCS로 추적한다(세션 로그와 달리 gitignore 대상이 아니다).
