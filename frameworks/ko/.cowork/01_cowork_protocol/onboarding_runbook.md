# 동료 온보딩 런북 (Teammate Onboarding Runbook) — F-08

> 사람이 역할 좌석에 합류할 때 실행하는 절차. `session_protocol.md` 1B-3(팀원 추가 매칭)의 상세 실행판이며, 좌석 정의(`decision_authority_matrix.md` §협업 실행 모드)를 실제 사람으로 채운다.

---

## 목적

`solo` 모드로 운영하며 유지해 온 좌석 정의는 **미래 동료가 앉을 자리의 청사진**이다. 사람이 합류하면 이 런북으로 온보딩 비용을 정산한다 — 좌석이 이미 정의돼 있으므로 "빈 조직도에 사람만 꽂으면" 된다.

---

## 사전 조건

- 합류할 사람의 이름/식별자, 담당 희망 영역, 역량을 파악한다.
- 대상 좌석이 `decision_authority_matrix.md`에 정의돼 있는지 확인한다(없으면 좌석 정의부터 — Human 승인).

## 온보딩 절차 (순서 고정)

1. **좌석 선택** — `decision_authority_matrix.md`의 좌석 정의에서 배정할 좌석(Role-ID)을 고른다. 겸임 좌석을 분리하는 경우 좌석 분할을 먼저 확정한다.
2. **협업 실행 모드 전환** — `solo → team`. `project_state.md`의 `협업 실행 모드` 필드를 `team`으로 바꾼다(전환은 Human 승인 사항, `decision_authority_matrix.md` §협업 실행 모드 §모드 전환).
3. **team_board.md 생성/갱신** — 없으면 `members/team_board.md`를 생성하고, 좌석에 사람을 배정한다.
4. **Task 담당자 반영** — 해당 좌석에 연결된 모든 Task의 담당자를 새 사람으로 일괄 갱신한다(`task_registry.md` + 활성 `tasks/TASK-*.md`).
5. **멤버 폴더 생성** — `members/<이름>/`에 `profile.md`(← `profile_template.md`), `workspace/my_state.md`(← `my_state_template.md`), `workspace/session_logs/.gitkeep`, `proposals/`를 생성한다.
6. **권한 부여** — `Master`(공유 영역 머지 권한) 또는 `Member`를 정하고, `decision_authority_matrix.md`의 H/J/A를 좌석별로 적용한다.
7. **역할 실행 방식 갱신** — `role_realization.md` 기준으로 그 좌석의 실행 주체를 "사람"으로 전환한다(종전 AI 페르소나/독립 서브에이전트 실행에서 인계). 검증 좌석이면 사람 리뷰와 독립 서브에이전트 검증의 병행 여부를 합의한다.
8. **인계 브리핑** — 좌석 소유 영역의 현재 상태를 인계한다: `project_state.md`(현재 Phase·활성 Task·이월 백로그) + 해당 좌석 관련 registry/canonical 문서 + 최근 세션 로그. 열린 결정과 트리거 대기 항목을 명시한다.

## 온보딩 후

- 새 사람의 첫 세션은 `session_protocol.md` §1D 브리핑을 Member 뷰로 받는다.
- 좌석에 사람이 앉은 뒤에도 좌석 정의는 유지된다 — 이탈 시 `team → solo`로 되돌리되 정의는 아카이브하지 않는다(`decision_authority_matrix.md` §모드 전환).
- 온보딩 자체를 회고 대상으로 남길 가치가 있으면 `retrospective.md`에 기록하고, 절차 개선점은 §4 Framework Back-Port Queue 후보로 본다.

---

## 관련 문서

- `session_protocol.md` 1B-3(팀원 추가 매칭), 1B-1/1B-2(팀 구성)
- `decision_authority_matrix.md` §협업 실행 모드(F-06)
- `role_realization.md`(F-07)
- `members/profile_template.md` · `members/my_state_template.md` · `members/team_board.md`
