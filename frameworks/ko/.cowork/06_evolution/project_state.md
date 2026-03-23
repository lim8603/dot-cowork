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
| 현재 Phase | |
| 활성 Intent | |
| 활성 Milestone | |
| 활성 Task | |
| 상태 | |
| 대화 언어 | |
| 작업 문서 언어 | |
| 공식 산출물 문서 언어 | |
| 시각화 모드 | |
| 마지막 갱신일 | |
| 마지막 갱신자 | |
| 참조 세션 로그 | |

- `프로젝트 유형`: `Greenfield(신규)` / `Brownfield(기존)`
- `팀 구성`: `1인` / `확정팀` / `사전배분`
- `팀 규모`: `1인` / `소규모(2~5)` / `중규모(6~15)` / `대규모(16+)`
- `협업 모드`: `Inactive(준비 중)` / `Active(Task 할당 완료)`
- `현재 Phase`: `Define` / `Design` / `Build` / `Verify` / `Evolve` / `Deliver`
- `상태`: `Green` / `Yellow` / `Red`
- `시각화 모드`: `Disabled` / `Mermaid` (신규 프로젝트 기본값은 `Disabled`)
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

- 항상 로드: 이 문서(`project_state.md`), `02_project_definition/deliverable_plan.md`, `members/<이름>/workspace/my_state.md` (1인 프로젝트도 동일 경로), 최신 세션 로그
- 팀 프로젝트에서는 `members/team_board.md`도 함께 로드한다.
- 현재 Phase 관련 목록 문서를 먼저 읽고, 필요한 기준 본문과 상세 문서를 추가한다.
- `templates/`, `imported_context/`, 오래된 세션 로그는 기본적으로 로드하지 않는다.
- `cowork.md`, `session_protocol.md` 등 규칙 문서는 첫 세션 숙지 후 필요할 때만 관련 섹션을 참조한다.
- imported context는 필요한 사실을 추출해 기준 문서에 반영한 뒤 보조 근거로만 활용한다.

### 권장 로딩 순서

1. `project_state.md` -> `deliverable_plan.md`
2. `members/<이름>/workspace/my_state.md` + 최신 세션 로그
3. 현재 Phase 관련 목록 문서 / 기준 본문
4. 필요한 상세 문서 (`INT-*`, `MS-*`, `TASK-*`, `ADR-*`)

### 단계별 로딩 맵 (Phase Map)

| Phase | 즉시 로드 | 필요 시 참조 |
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
- 어떤 섹션이 길어지면 먼저 요약으로 압축하고, 자세한 맥락은 목록 문서 / 상세 문서 / session log / 다른 기준 본문에서 참조하게 한다.
- `최근 변경 파일 / 산출물`, `Human 확인 필요 사항`, `주요 리스크`는 항목이 없더라도 `없음` 상태를 명시한다.
