# 프로젝트 상태 (Project State)

> 공유 상태 인덱스 — 다음 세션의 AI가 가장 먼저 읽는 프로젝트 현재 상태 요약

---

## 현재 상태 요약

### 핵심 필드

| 항목 | 내용 |
|------|------|
| 프로젝트 | |
| 프로젝트 유형 | |
| 팀 구성 | |
| 팀 규모 | |
| 협업 모드 | |
| 협업 실행 모드 | |
| 현재 Phase | |
| 활성 Intent | |
| 활성 Milestone | |
| 활성 Task | |
| 상태 | |
| 대화 언어 | |
| 작업 문서 언어 | |
| 공식 산출물 문서 언어 | |
| 마지막 갱신일 | |
| 마지막 갱신자 | |
| 참조 세션 로그 | |

- `프로젝트 유형`: `Greenfield(신규)` / `Brownfield(기존)`
- `팀 구성`: `1인` / `확정팀` / `사전배분`
- `팀 규모`: `1인` / `소규모(2~5)` / `중규모(6~15)` / `대규모(16+)`
- `협업 모드`: `Inactive(준비 중)` / `Active(Task 할당 완료)`
- `협업 실행 모드`: `solo`(좌석 정의 유지 + 역할별 부기 생략) / `team`(역할별 부기 전부 운영) — 상세는 `decision_authority_matrix.md` §협업 실행 모드 (F-06)
- `현재 Phase`: `Define` / `Design` / `Build` / `Verify` / `Evolve` / `Deliver`
- `상태`: `Green` / `Yellow` / `Red`
- `활성 Intent`, `활성 Milestone`, `활성 Task`는 현재 실제 ID를 적고, 없으면 `없음`으로 적는다.
- `마지막 갱신자`: `Human` / `AI`
- `참조 세션 로그`: 최신 `session_YYYY-MM-DD_NNN.md`

### 한 줄 상태
> 현재 프로젝트 상태를 한두 문장으로만 요약한다.

- 예: `요구사항 초안 승인 완료, 설계 상세화 진행 중`

### 현재 작업 스트림
> 핵심 작업 스트림만 3~5줄 이내로 유지한다.

- 없음

---

## 활성 Task 요약
> 현재 바로 재개할 Task만 1~3개 남기고, 상세 배경은 목록 문서 / Task 문서 / 세션 로그에 둔다.

| Task ID | 제목 | 담당 | 상태 | 마지막 갱신일 | 다음 액션 |
|---------|------|------|------|---------------|-----------|
| 없음 | - | - | - | - | - |

- `상태` 값은 `Planned` / `In Progress` / `Review` / `Done`을 사용한다.
- `담당`, `상태`, `마지막 갱신일`, `다음 액션`은 `task_registry.md` / `tasks/TASK-*.md`와 같은 의미로 유지한다.

---

## 다음 시작점
> 다음 세션이 바로 시작할 수 있도록 1~3개 우선 행동만 남긴다.

1. 없음

### 이번 작업에서 다음에 읽을 문서

요청한 작업이 명확하면 관련 목록 문서·기준 본문·활성 상세 문서만 연다. 이전 결정이나 개인 담당의 근거가 필요할 때만 `my_state.md`, 최신 세션 로그, ADR을 추가한다. 작업이 지정되지 않았으면 위 상태와 아래 이월 항목으로 짧게 브리핑한다. 단계별 후보는 아래 `컨텍스트 로딩 가이드`를 참조한다.

---

## 이월 백로그 (Carryover Backlog)

> **이월의 단일 기준.** 이월 항목은 이 표에서 관리한다. 작업 미지정 시 브리핑에 포함하고, 특정 작업에서는 관련 항목만 확인한다. 항목이 추가·해소되거나 작업을 인계할 때 갱신한다. 상세 배경은 출처 세션 로그에 둔다. 이월 트리거 감시는 AI의 책임이다 — Human이 찾아 지시하기 전에 브리핑·작업 중 이 표를 대조해 도래한 트리거를 먼저 꺼낸다.

**지금 지시만 하면 착수 가능 (트리거 없음)**

| # | 항목 | 내용 | 출처 |
|---|------|------|------|
| 없음 | - | - | - |

**트리거 대기 (도래 시 해당 세션이 흡수)**

| # | 항목 | 트리거 | 출처 |
|---|------|--------|------|
| 없음 | - | - | - |

**저심각 · 기록 (지시 시에만)**

| # | 항목 | 출처 |
|---|------|------|
| 없음 | - | - |

---

## AI 핸드오프 메모
> 다음 세션이 바로 이어받는 데 필요한 핵심만 2~5줄로 남긴다.

- 없음

---

## Human 확인 필요 사항
> 열린 항목만 유지하고, 해결된 이력은 세션 로그나 관련 기준 문서에 남긴다.

| ID | 항목 | 우선순위 | 관련 문서 | 상태 |
|----|------|---------|----------|------|
| 없음 | - | - | - | - |

- `우선순위`: `High` / `Medium` / `Low`
- `상태`: `Open` / `Resolved` / `Deferred`

---

## 주요 리스크 / 주의사항
> 현재 영향이 있는 리스크 위주로 유지하고, 닫힌 리스크의 상세 이력은 별도 기준 문서에 남긴다.

| ID | 내용 | 대응 상태 | 비고 |
|----|------|-----------|------|
| 없음 | - | - | - |

- `대응 상태`: `Open` / `Mitigating` / `Closed`

---

## 최근 승인된 결정

| ID | 결정 | 근거 문서 | 날짜 |
|----|------|-----------|------|
| 없음 | - | - | - |

---

## 최근 변경 파일 / 산출물
> 최근 핵심 변경만 짧게 남기고, 장기 이력은 세션 로그에 누적한다.

| 파일 | 변경 요약 | 관련 작업 |
|------|----------|----------|
| 없음 | - | - |

---

## 활성 산출물
> 활성 상태인 항목만 유지하고, 상세 내용은 목록 문서에서 우선 찾은 뒤 필요 시 상세 문서를 본다.

| 유형 | ID | 제목 | 상태 | 비고 |
|------|----|------|------|------|
| 없음 | - | - | - | - |

- `Intent`: `Draft` / `Approved` / `Superseded` / `Split` / `Closed`
- `Milestone`: `Planned` / `In Progress` / `Review` / `Done`
- `User Story`: `Draft` / `Approved` / `Implemented`
- `Task`: `Planned` / `In Progress` / `Review` / `Done`

---

## 컨텍스트 로딩 가이드 (Context Loading Guide)

### 핵심 규칙

- 작업 시작 시 이 문서(`project_state.md`)에서 현재 제약과 다음 시작점을 확인한다. 산출물 범위가 관련되면 `02_project_definition/deliverable_plan.md`를 읽는다.
- 개인 담당이나 이전 맥락이 필요하면 `members/<이름>/workspace/my_state.md`와 최신 세션 로그를 읽는다. 팀 배정이 관련되면 `members/team_board.md`를 읽는다.
- 현재 작업과 관련된 목록 문서를 먼저 읽고 필요한 기준 본문과 상세 문서를 추가한다. 같은 Phase의 문서를 일괄 로드하지 않는다.
- `templates/`, `imported_context/`, `06_evolution/state_archive.md`, 오래된 세션 로그는 기본적으로 로드하지 않는다.
- `06_evolution/state_archive.md`는 과거 세션 완료 서사·핸드오프 이력 아카이브(Log/Archive)다. 이 문서의 요약이 포인터로 가리키며, 특정 과거 세션 맥락이 필요할 때만 해당 `#NNN 이관분` 섹션을 연다.
- `cowork.md`, `session_protocol.md` 등 규칙 문서는 현재 작업에서 관련 규칙이 필요할 때 해당 섹션을 참조한다.
- imported context는 필요한 사실을 추출해 기준 문서에 반영한 뒤 보조 근거로만 활용한다.

### 권장 로딩 순서

1. `project_state.md`에서 현재 상태와 다음 시작점 확인
2. 현재 작업과 관련된 목록 문서·기준 본문, 필요한 상세 문서 확인
3. 산출물 범위·개인 담당·과거 결정이 관련될 때만 `deliverable_plan.md`, `my_state.md`, 최신 로그, ADR 추가

### 단계별 로딩 맵 (Phase Map)

| Phase | 작업과 관련될 때 우선 참조 | 필요 시 참조 |
|-------|----------|-------------|
| **Define** | `02_project_definition/intent_registry.md`, `02_project_definition/user_story_registry.md`, `02_project_definition/requirement_spec.md`, `02_project_definition/functional_spec.md`, `02_project_definition/risk_register.md`, `02_project_definition/deliverable_plan.md` | `02_project_definition/intents/INT-*.md`, `02_project_definition/user_stories/US-*.md`, `02_project_definition/domain_glossary.md` |
| **Design** | `03_design_artifacts/adr_registry.md`, `03_design_artifacts/domain_model.md`, `03_design_artifacts/interface_contract.md`, `03_design_artifacts/data_model.md`, `03_design_artifacts/tech_stack.md` | `03_design_artifacts/adrs/ADR-*.md`, `02_project_definition/requirement_spec.md`, `02_project_definition/functional_spec.md`, `03_design_artifacts/ui_spec.md` |
| **Build** | `04_implementation/milestone_registry.md`, `04_implementation/task_registry.md`, `04_implementation/coding_convention.md`, `04_implementation/review_checklist.md` | `04_implementation/milestones/MS-*.md`, `04_implementation/tasks/TASK-*.md`, `03_design_artifacts/interface_contract.md`, `03_design_artifacts/data_model.md` |
| **Verify** | `05_verification/test_strategy.md`, `05_verification/test_case.md`, `05_verification/verification_evidence.md`, `04_implementation/task_registry.md`, `05_verification/quality_gate.md` | `04_implementation/tasks/TASK-*.md`, `02_project_definition/requirement_spec.md`, `03_design_artifacts/*` |
| **Evolve** | `06_evolution/*` | 필요에 따라 전체 프로젝트 문서 |
| **Deliver** | `07_delivery/*`, `05_verification/quality_gate.md`, `05_verification/verification_evidence.md` | `02_project_definition/deliverable_plan.md`, 전체 프로젝트 문서 |

---

## 작성 / 유지 규칙

- 이 문서는 세션 로그를 대체하지 않는 공유 재개 인덱스다.
- 표와 요약 섹션에는 현재 실제 값만 적고, 값이 없으면 `없음`으로 적는다.
- `INT-*`, `MS-*`, `TASK-*` 표기는 형식 안내일 뿐이며, 실제 값이 생기면 바로 교체한다.
- `한 줄 상태`, `현재 작업 스트림`, `다음 시작점`, `AI 핸드오프 메모`는 보통 3~5줄 이내로 유지한다.
- 같은 사실을 여러 섹션에 반복하지 말고, 요약 1회 + 관련 ID/문서 경로로 연결한다.
- 세션 로그의 raw 메모, 미확정 가설, 1회성 디버깅 흔적은 그대로 복사하지 않는다.
- R1: 핵심 필드는 현재 값으로 교체한다. 최근 완료 요약은 최대 3세션 × 한 문장 + 링크만 유지한다. 상세는 원문을 보존하여 `state_archive.md`로 이관하며 이미 보관된 내용은 재복제하지 않는다.
- **R2 — 현재 제약은 보존하고 상세는 분리.** 현재 작업에 필요한 내용도 긴 서사 그대로 유지하지 않는다. 각 활성 항목에는 ID, 상태, 현재 제약/블로커, 다음 행동, 근거 링크를 남기고 상세는 기존 Task/ADR/기준 문서로 연결한다. 단일 표 행 또는 문단이 800자를 넘으면 분리 검토한다. 미해결 조건·승인·검증 공백을 삭제하거나 완료로 바꾸지 않는다. 이관 후 대상과 링크를 확인한다.
- **크기 경고선 (F-05).** UTF-8 파일 전체 크기를 기준으로 `project_state.md` 24 KiB, 활성 `my_state.md` 각 12 KiB를 기본 경고선으로 삼는다. 상태 문서를 갱신하거나 인계할 때 확인하고 초과 시 R1/R2에 따라 정리한다. 크기만으로 작업·릴리즈를 차단하지 않는다.
- `최근 변경 파일 / 산출물`, `Human 확인 필요 사항`, `주요 리스크`는 항목이 없더라도 `없음` 상태를 명시한다.
