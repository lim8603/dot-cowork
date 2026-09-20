# Verification Evidence

> 검증 근거 인덱스 — 테스트, 리뷰, NFR, 릴리즈 readiness 근거를 한곳에서 요약하고 연결한다

---

## 목적

이 문서는 Verify 단계에서 생성되는 근거를 **게이트 판정용 canonical 인덱스**로 정리한다.

- 세션 로그나 개별 Task 문서에 흩어진 검증 근거를 빠르게 복원한다
- Gate 4, Gate 5 판정 시 "무엇이 검증되었고 어디에 근거가 있는가"를 한 번에 보여 준다
- 원본 로그, 스크린샷, 외부 리포트를 이 문서에 복제하지 않고 **요약 + 위치 링크**만 유지한다
- TDD처럼 테스트량이 누적되는 프로젝트에서도, 이 문서는 로그 저장소가 아니라 **신뢰 가능한 증거 인덱스**로 유지한다

---

## 문서 정보

| 항목 | 내용 |
|------|------|
| 관련 Intent | 활성 Intent 또는 관련 `INT-*` 참조 |
| 관련 Milestone | 검증 근거가 연결되는 `MS-*` (해당 시) |
| 관련 Test Strategy | `test_strategy.md` |
| 관련 Test Case | `test_case.md` |
| 버전 | 프로젝트 기준 |

---

## 운영 원칙

- 증거의 유효 범위는 **대상 commit/빌드·실행일·환경/구성·시나리오**로 명시한다. 명령/절차와 결과 위치를 연결하고, 실행 주체가 AI인지 Human인지 구분한다. dirty 작업 트리면 변경 범위도 남긴다.
- 전체 테스트 개수나 로컬 Pass를 제품 전체/다른 환경의 Pass로 확장하지 않는다. 설정·권한·배포물 변경은 선언, 소비 코드, 실제 사용 환경까지 이어지는 경로를 확인한다. 예: 설정 scope 변경이면 단일/다중 workspace와 설치 후 reload 경로 중 영향을 받는 것을 검사한다.
- 관련 코드·계약·환경이 달라지면 이전 Pass는 이력으로 보존하고 현재 판정은 재검증 또는 미검증으로 표시한다. 관련 없는 변경 때문에 전체 테스트를 반복하지 않는다.
- CI/수동 검증을 연기하면 **마지막 검증 revision, 미검증 범위, 담당, 재실행 시점/조건**을 `Open Evidence Gaps`에 남긴다. 비용 때문에 연기한 검증도 Pass로 바꾸지 않는다. 공유 상태에는 공백 ID와 링크만 둔다.
- Task 완료·프로젝트 건강 상태·릴리즈 준비 상태를 구분한다. Green은 Gate 통과 증거가 아니다. 게이트는 해당 대상과 필수 범위의 유효한 근거로 판단하고, 수용한 예외는 승인자·이유·후속 조건을 기록한다.
- 검증 결과나 이월 조건이 바뀐 실행 사이클 종료 시 관련 EV/GAP와 현재 Gate 요약을 갱신한다. 과거 Gate 판정은 버전/날짜를 표시해 현재 판정과 구분한다.

- 이 문서는 Verify/Release 판정의 **증거 요약 인덱스**다.
- 상세 절차와 기대 결과는 `test_strategy.md`, `test_case.md`, `review_checklist.md`, 관련 `TASK-*` 문서에서 관리한다.
- 원본 실행 로그, 외부 리포트, 측정 결과 원문은 원래 위치에 두고, 이 문서에는 무엇을 입증하는지와 위치만 적는다.
- 가능하면 Gate 4, Gate 5 항목은 `EV-*` ID로 추적한다.
- 근거가 아직 부족하면 삭제하지 말고 `Open Evidence Gaps`에 남긴다.

---

## 근거 영역 요약

| 영역 | 최근 상태 | 주요 근거 문서 | 마지막 갱신일 | 비고 |
|------|----------|----------------|--------------|------|
| Review Evidence | Not Started / In Progress / Ready | `04_implementation/review_checklist.md`, 관련 `TASK-*` | | |
| Test Execution Evidence | Not Started / In Progress / Ready | `test_case.md`, 관련 실행 로그/리포트 | | |
| NFR Evidence | Not Started / In Progress / Ready | `test_strategy.md`, 관련 측정 결과 | | |
| Release Readiness Evidence | Not Started / In Progress / Ready | `quality_gate.md`, `project_state.md`, 관련 release source | | |

---

## Evidence Index

| EV ID | 유형 | 검증 대상 / 범위 | 판정 | 관련 Gate | 원본 근거 위치 | 마지막 갱신일 | 대상 revision / 환경 / 실행자 |
|-------|------|------------------|------|-----------|----------------|--------------|------|
| EV-001 | Review / Unit / Integration / E2E / NFR / Release | | Pass / Fail / Partial / Deferred | Gate 4 / Gate 5 | | YYYY-MM-DD | commit/build; OS/config; AI/Human |

---

## Gate 판정 메모

| Gate | 판정 상태 | 핵심 EV ID | 요약 | 비고 |
|------|-----------|------------|------|------|
| Gate 4 | Ready / Blocked / Partial | `EV-*` | | |
| Gate 5 | Ready / Blocked / Partial | `EV-*` | | |

---

## Open Evidence Gaps

| ID | 항목 / 마지막 검증 revision | 미검증 범위 | 담당 / 재실행 시점·조건 | 상태 |
|----|------|------------|----------|------|
| GAP-001 | | | | Open / Resolved / Deferred |
