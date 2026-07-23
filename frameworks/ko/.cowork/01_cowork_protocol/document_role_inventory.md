# 문서 역할 인벤토리 (Document Role Inventory)

> `.cowork` 내 모든 Markdown 문서의 역할, 운영 방식, 누적 규모를 한눈에 정리한다

---

> 내용 수정 시 연쇄 영향은 `document_change_impact_matrix.md`를 함께 참조한다.

---

## 핵심 메모

- 대상: `.cowork/**/*.md`
- 전체 인벤토리는 프레임워크에 기본 포함된 `md`를 기준으로 정리한다.
- 실제 누적 상세 문서와 개인 세션 로그는 프로젝트 진행 중 생성된다.
- 기본 포함되지 않는 상세 문서 예시: `intents/INT-*.md`, `user_stories/US-*.md`, `adrs/ADR-*.md`, `milestones/MS-*.md`, `tasks/TASK-*.md`
- 기본 포함되지 않는 로그 / 아카이브 예시: `06_evolution/imported_context/imported_*.md`, `members/<이름>/workspace/session_logs/session_*.md`

---

## 분류 기준

| 분류 | 의미 | 기본 운영 방식 |
|------|------|----------------|
| 운영 기준 문서 (Governance) | 규칙, 프로토콜, 게이트, 운영 가이드 | 직접 갱신하되 짧게 유지 |
| 기준 본문 (Canonical) | 프로젝트의 현재 기준 본문 | 단일 문서에서 직접 누적 |
| 목록 문서 (Registry) | 활성 항목의 인덱스와 요약 | 목록 문서 + 상세 문서 폴더를 함께 운영 |
| 상세 문서 (Instance) | ID 기반 상세 문서 | 새 파일을 생성하고 활성 항목만 필요 시 로드 |
| 템플릿 (Template) | 새 문서를 만들 때 복사하는 원본 | 직접 운영하지 않고 복사본만 사용 |
| 로그 / 아카이브 (Log / Archive) | 세션 로그, imported context, raw evidence | append-only로 보관하고 필요 시만 참조 |

---

## 신규 산출물 배치 판단

### 기본 선택

- 기본 선택지는 **새 파일 추가가 아니라 기존 기준 본문 흡수**다.
- 아직 확정되지 않은 생각, 일회성 메모, 외부 원문, 작업 중 scratch는 기준 본문으로 승격하지 말고 로그 / 아카이브에 둔다.
- migration note, rollout memo, integration memo 같은 경계형 작업 메모는 별도 임시 문서를 만들기보다 최신 세션 로그에 먼저 기록한다.
- 새 기준 본문 생성은 AI가 필요성을 제안하고 Human이 승인한 경우에만 진행한다.

### 빠른 분기

1. 같은 성격의 공유 기준 문서가 이미 있으면, 기존 기준 본문의 섹션 / 표 / 컬럼 / 부록으로 먼저 흡수한다.
2. 같은 종류의 객체가 여러 개 누적되고 ID / 상태 / 선택 로딩이 필요하면, 목록 문서 + 상세 문서 후보로 본다.
3. 프로젝트 운영 기준 문서가 아니라 릴리즈 / 납품 시점의 최종 출력물이면, delivery 전용 후보로 보고 `deliverable_plan.md`와 `export_spec.md`에서 처리한다.
4. 여러 세션에서 반복 참조될 안정된 기준 본문인데 기존 기준 본문에 넣으면 역할이 섞이거나 과도하게 비대해지면, 새 기준 본문 후보로 본다.
5. 어디에도 확신이 없으면 즉시 새 파일을 만들지 말고 기존 기준 본문 또는 로그 / 아카이브에 임시 반영한 뒤 반복 참조 패턴이 생길 때 다시 판단한다.

### 배치 방식 요약

| 배치 방식 | 적합한 경우 | 피해야 하는 경우 |
|------|------|------|
| 기존 기준 본문 흡수 | 같은 문서의 책임 범위 안에서 섹션 / 표 추가로 해결 가능 | 문서 역할이 섞이거나 핵심 로딩 문서가 불필요하게 비대해질 때 |
| 목록 문서 + 상세 문서 | ID, 상태, 담당자, 수명주기를 가진 항목이 여러 개 반복 생성될 때 | 단일 본문으로 충분한 일회성 설명일 때 |
| Delivery 전용 | 릴리즈 산출물, 대외 문서, 공식 산출물 생성 결과물처럼 최종 출력에서만 필요한 경우 | 프로젝트 진행 중 공유 기준 문서가 필요한데 공식 문서만 먼저 만들 때 |
| 새 기준 본문 | 여러 세션에서 계속 참조되고, 기존 문서 흡수로는 역할 충돌이나 과도한 비대화가 생길 때 | 일회성 메모, 임시 정리, Human 승인 없는 구조 확장일 때 |

### 새 기준 본문 제안 전 확인

- 기존 기준 본문에 섹션 추가만 해도 해결되지 않는가?
- 다음 2개 이상 세션에서 반복 참조될 가능성이 높은가?
- `project_state.md`, gate 판정, export 해석에서 별도 기준 문서가 있어야 운영이 더 안정적인가?
- 승인 후에는 `document_change_impact_matrix.md`의 "새 기준 본문 추가" 행과 `deliverable_plan.md`, `project_state.md`, 필요 시 `quality_gate.md` / `export_spec.md`를 함께 점검해야 하는가?

---

## 고누적 기준 본문 우선 관찰

| 문서 | 현재 분류 | 누적 규모 | 후속 판단 |
|------|-----------|----------|-----------|
| `02_project_definition/functional_spec.md` | 기준 본문 | 높음 | 기능 수가 많아지면 도메인별 분할 고려 |
| `03_design_artifacts/ui_spec.md` | 기준 본문 | 높음 | 화면 수가 많아지면 화면군 단위 분할 고려 |
| `05_verification/test_case.md` | 기준 본문 | 높음 | 실질 `TC-*` 12개 초과, 최근 실행 요약 15행 초과, 또는 최근 3세션 편중 참조 시 `test_cases/` 구조 검토 |
| `06_evolution/knowledge_base.md` | 기준 본문 | 높음 | 실항목 15개 초과 또는 최근 3세션 중 2회 이상 같은 주제만 반복 참조되면 주제별 분리 검토 |
| `06_evolution/retrospective.md` | 기준 본문 | 중간~높음 | 완료 회고 4개 이상 누적 또는 최근 3세션이 최신 1~2개 회고만 반복 참조하면 회차별 / 범위별 분리 검토 |
| `07_delivery/release_note.md` | 기준 본문 | 높음 | 릴리즈가 잦으면 버전별 분리 또는 외부 릴리즈 시스템 연동 검토 |
| `07_delivery/user_manual.md` | 기준 본문 | 중간~높음 | 기능 폭이 커지면 사용자 역할별 분리 검토 |
| `07_delivery/operation_guide.md` | 기준 본문 | 중간~높음 | 운영 환경이 복수면 환경별 분리 검토 |
| `members/team_board.md` | 기준 본문 | 중간~높음 | 팀 규모가 커지면 역할 / 스프린트 보드 분리 검토 |

---

## 전체 인벤토리

> 운영 방식은 위 분류 기준을 따른다. 아래 표는 경로, 분류, 누적 규모, 예외 메모만 적는다.

### Root

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `cowork.md` | 운영 기준 문서 | 낮음 | 원칙, 구조, 라이프사이클 마스터 문서 |
| `README.md` | 운영 기준 문서 | 낮음 | `.cowork` 빠른 시작과 입문 가이드 |
| `upgrade_manifest.md` | 운영 기준 문서 | 낮음 | 버전별 업그레이드 분류표 |

### 01_cowork_protocol

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `01_cowork_protocol/communication_convention.md` | 운영 기준 문서 | 낮음 | 언어, 톤, 시각화의 단일 기준 |
| `01_cowork_protocol/decision_authority_matrix.md` | 운영 기준 문서 | 낮음 | 변동 적음. 협업 실행 모드(solo/team) 포함 |
| `01_cowork_protocol/role_realization.md` | 운영 기준 문서 | 낮음 | 역할 좌석 실행 방식 가이드(F-07) |
| `01_cowork_protocol/escalation_policy.md` | 운영 기준 문서 | 낮음 | 변동 적음 |
| `01_cowork_protocol/session_protocol.md` | 운영 기준 문서 | 중간 | 세션 공통 프로토콜 |
| `01_cowork_protocol/tooling_environment_guide.md` | 운영 기준 문서 | 낮음~중간 | 도구/환경 의존 운영 분리 문서 |
| `01_cowork_protocol/document_role_inventory.md` | 운영 기준 문서 | 중간 | 구조 변경 시 갱신 |

### 02_project_definition

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `02_project_definition/deliverable_plan.md` | 기준 본문 | 중간 | 산출물 기준 문서 해석 기준 포함 |
| `02_project_definition/domain_glossary.md` | 기준 본문 | 중간 | 용어 수가 많아지면 주제 분리 검토 |
| `02_project_definition/functional_spec.md` | 기준 본문 | 높음 | 고누적 후보 |
| `02_project_definition/intent_registry.md` | 목록 문서 | 중간 | 활성 Intent 인덱스 |
| `02_project_definition/requirement_spec.md` | 기준 본문 | 중간~높음 | 범위가 넓으면 장별 분할 가능 |
| `02_project_definition/risk_register.md` | 기준 본문 | 중간~높음 | register 성격이므로 단일 문서 유지 가능 |
| `02_project_definition/user_story_registry.md` | 목록 문서 | 중간 | 사용자 스토리 인덱스 |
| `02_project_definition/templates/intent_template.md` | 템플릿 | 낮음 | 직접 운영 금지 |
| `02_project_definition/templates/user_story_template.md` | 템플릿 | 낮음 | 직접 운영 금지 |

### 03_design_artifacts

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `03_design_artifacts/adr_registry.md` | 목록 문서 | 중간 | 승인된 결정 인덱스 |
| `03_design_artifacts/data_model.md` | 기준 본문 | 중간 | 데이터 구조 기준 |
| `03_design_artifacts/domain_model.md` | 기준 본문 | 중간 | 도메인 구조 기준 |
| `03_design_artifacts/interface_contract.md` | 기준 본문 | 중간 | 인터페이스 계약 기준 |
| `03_design_artifacts/tech_stack.md` | 기준 본문 | 중간 | ADR과 연결되는 기술 등록부 |
| `03_design_artifacts/ui_spec.md` | 기준 본문 | 높음 | 고누적 후보 |
| `03_design_artifacts/templates/adr_template.md` | 템플릿 | 낮음 | 직접 운영 금지 |

### 04_implementation

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `04_implementation/coding_convention.md` | 기준 본문 | 중간 | 기술스택 변경 시 갱신 |
| `04_implementation/milestone_registry.md` | 목록 문서 | 중간 | 중간 완료 지점 인덱스 |
| `04_implementation/review_checklist.md` | 기준 본문 | 낮음~중간 | 품질 검토 기준 |
| `04_implementation/task_registry.md` | 목록 문서 | 높음 | 활성 실행 단위 인덱스 |
| `04_implementation/templates/milestone_template.md` | 템플릿 | 낮음 | 직접 운영 금지 |
| `04_implementation/templates/task_template.md` | 템플릿 | 낮음 | 직접 운영 금지 |

### 05_verification

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `05_verification/quality_gate.md` | 운영 기준 문서 | 중간 | 구조 검증 규칙 포함 |
| `05_verification/test_case.md` | 기준 본문 | 높음 | 실질 `TC-*` 12개 초과, 최근 실행 요약 15행 초과, 최근 3세션 편중 참조 시 분할 검토 |
| `05_verification/test_strategy.md` | 기준 본문 | 중간 | 케이스보다 상위 정책 문서 |
| `05_verification/verification_evidence.md` | 기준 본문 | 중간~높음 | 테스트 / 리뷰 / NFR / release evidence 인덱스 |

### 06_evolution

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `06_evolution/knowledge_base.md` | 기준 본문 | 높음 | 실항목 15개 초과 또는 최근 3세션 편중 참조 시 분리 검토 |
| `06_evolution/project_state.md` | 기준 본문 | 중간 | 기본 로딩 대상. 서술형 완료 서사는 최근 3세션만 본문 유지(R1) |
| `06_evolution/state_archive.md` | 로그 / 아카이브 | 높음(누적) | R1 하베스트 대상. append-only, 기본 로딩 대상 아님. 압축하지 않음 |
| `06_evolution/retrospective.md` | 기준 본문 | 중간~높음 | 완료 회고 4개 이상 또는 최근 3세션 최신 회고 편중 참조 시 분리 검토 |
| `06_evolution/templates/session_log_template.md` | 템플릿 | 낮음 | 실제 로그는 `members/<이름>/workspace/session_logs/`에 생성 |

### 07_delivery

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `07_delivery/export_spec.md` | 운영 기준 문서 | 중간 | 기준 문서 우선순위 규칙 포함 |
| `07_delivery/operation_guide.md` | 기준 본문 | 중간~높음 | 운영 환경이 많아지면 분리 검토 |
| `07_delivery/release_note.md` | 기준 본문 | 높음 | 고누적 후보 |
| `07_delivery/user_manual.md` | 기준 본문 | 중간~높음 | 기능별 분리 가능 |

### members

| 경로 | 분류 | 누적 규모 | 비고 |
|------|------|----------|------|
| `members/my_state_template.md` | 템플릿 | 낮음 | 실제 사용 시 `my_state.md`로 생성 |
| `members/profile_template.md` | 템플릿 | 낮음 | 팀원별 복사 사용 |
| `members/proposal_template.md` | 템플릿 | 낮음 | 승인 워크플로우용 |
| `members/team_board.md` | 기준 본문 | 중간~높음 | 팀 규모 커지면 보드 분리 검토 |

---

## 현재 판단 요약

- 이미 `목록 문서 + 상세 문서` 구조가 필요한 영역은 `Intent`, `User Story`, `ADR`, `Milestone`, `Task`로 정리되었다.
- 나머지 문서 중 당장 구조 분리를 다시 검토할 우선 후보는 `functional_spec.md`, `ui_spec.md`, `test_case.md`, `knowledge_base.md`, `release_note.md`, `team_board.md`다.
- `risk_register.md`, `tech_stack.md`처럼 register 성격이 강한 문서는 단일 기준 본문으로도 충분히 운영 가능하다.
- 실제 누적 로그 원문은 `members/<이름>/workspace/session_logs/`, `imported_context/`, `06_evolution/state_archive.md`에 두고, 기준 본문에는 정제된 결과만 승격하는 원칙을 유지한다.
- `project_state.md`·`my_state.md`는 완료 서사가 append-only로 누적되기 쉬운 로딩 문서다. 트리거형 다이어트 규칙(R1: 최근 3세션 본문 + `마무리` 시 초과분 `state_archive.md` 이관 / R2: 표 셀 비대 시 상세 문서·세션 로그 포인터로 분리)으로 로딩 크기를 상시 관리한다. 상세는 `session_protocol.md` §공유 상태 인덱스 관리.
