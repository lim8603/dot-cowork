# 업그레이드 매니페스트 (Upgrade Manifest)

> 프레임워크 업그레이드 시 AI가 읽는 파일 변경 분류표

---

## 버전 정보

| 항목 | 내용 |
|------|------|
| Version | 1.1.0 |
| From | 1.0.0 |
| 날짜 | 2026-07-23 |
> 아래 `## 파일 분류`의 `ADD` 표는 여전히 **신규 프레임워크 기준선 설치용** 전체 목록이다(1.1.0 신규 파일 `state_archive.md` 포함).
> `1.0.0 → 1.1.0` 순차 업그레이드는 `## 1.1.0 업그레이드 (from 1.0.0)` 델타 표를 따른다.
> 이미 임의의 `.cowork/` 구조가 존재하는 프로젝트에 신규 도입할 때는 자동 업그레이드가 아니라 **마이그레이션**으로 취급하고 Human 확인을 거친다.

---

## 변경 요약

- `cowork-context-framework` 저장소의 첫 공식 기준선
- `.cowork` 구조는 `운영 기준 문서 / 기준 본문 / 목록 문서 / 상세 문서 / 템플릿 / 로그·아카이브` 모델을 따른다
- 기본 작업 분해 축은 `Intent -> Milestone -> Task`를 사용한다
- 도구·환경 의존 운영 규칙은 `tooling_environment_guide.md`에서 별도 관리한다
- 이후 `v1.1.0+`부터는 `From` 기반 순차 업그레이드를 사용한다

---

## 파일 분류

> **ADD**: 새 프레임워크 기준선 설치 시 복사
> **REPLACE**: 기준선 초안에는 사용하지 않음
> **MERGE**: 기준선 초안에는 사용하지 않음
> **SKIP**: 기준선 초안에는 사용하지 않음

> `v1.0.0`은 신규 설치 기준선이므로, 배포물에 포함되는 파일은 모두 `ADD`로 시작한다.
> 이후 버전부터 파일별 `REPLACE / MERGE / SKIP` 정책을 도입한다.

### 진입점 파일 (프로젝트 루트)

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `AGENTS.md` | ADD | Codex 진입점 추가 |
| `CLAUDE.md` | ADD | Claude Code 진입점 추가 |
| `GEMINI.md` | ADD | Gemini Code Assist 진입점 추가 |
| `.github/copilot-instructions.md` | ADD | GitHub Copilot 진입점 추가 |

### `.cowork` 루트

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/cowork.md` | ADD | 프레임워크 원칙과 전체 구조 정의 |
| `.cowork/README.md` | ADD | `.cowork` 사용 안내 |
| `.cowork/upgrade_manifest.md` | ADD | 이 기준선 매니페스트 |
| `.cowork/.upgrade/.gitkeep` | ADD | 업그레이드 작업용 스캐폴드 |

### 01_cowork_protocol/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/01_cowork_protocol/session_protocol.md` | ADD | 세션 시작/진행/종료 프로토콜 |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | ADD | 도구/환경 의존 운영 가이드 |
| `.cowork/01_cowork_protocol/communication_convention.md` | ADD | 소통 규칙 |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | ADD | 의사결정 권한 매트릭스 (1.1.0: 협업 실행 모드 solo/team) |
| `.cowork/01_cowork_protocol/role_realization.md` | ADD | 역할 좌석 실행 방식 가이드 (1.1.0 신규, F-07) |
| `.cowork/01_cowork_protocol/escalation_policy.md` | ADD | 에스컬레이션 정책 |
| `.cowork/01_cowork_protocol/document_role_inventory.md` | ADD | 문서 역할 인벤토리 |
| `.cowork/01_cowork_protocol/document_change_impact_matrix.md` | ADD | 수정 영향 매트릭스 |

### 02_project_definition/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/02_project_definition/intent_registry.md` | ADD | Intent 인덱스 |
| `.cowork/02_project_definition/user_story_registry.md` | ADD | User Story 인덱스 |
| `.cowork/02_project_definition/requirement_spec.md` | ADD | 요구사항 명세 |
| `.cowork/02_project_definition/functional_spec.md` | ADD | 기능 명세 |
| `.cowork/02_project_definition/domain_glossary.md` | ADD | 도메인 용어집 |
| `.cowork/02_project_definition/risk_register.md` | ADD | 리스크 등록부 |
| `.cowork/02_project_definition/deliverable_plan.md` | ADD | 산출물 계획 |
| `.cowork/02_project_definition/templates/intent_template.md` | ADD | Intent 템플릿 |
| `.cowork/02_project_definition/templates/user_story_template.md` | ADD | User Story 템플릿 |
| `.cowork/02_project_definition/intents/.gitkeep` | ADD | Intent 인스턴스 폴더 스캐폴드 |
| `.cowork/02_project_definition/user_stories/.gitkeep` | ADD | User Story 인스턴스 폴더 스캐폴드 |

### 03_design_artifacts/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/03_design_artifacts/adr_registry.md` | ADD | ADR 인덱스 |
| `.cowork/03_design_artifacts/domain_model.md` | ADD | 도메인 모델 |
| `.cowork/03_design_artifacts/interface_contract.md` | ADD | 인터페이스 계약 |
| `.cowork/03_design_artifacts/data_model.md` | ADD | 데이터 모델 |
| `.cowork/03_design_artifacts/ui_spec.md` | ADD | UI 설계서 |
| `.cowork/03_design_artifacts/tech_stack.md` | ADD | 기술스택 등록부 |
| `.cowork/03_design_artifacts/templates/adr_template.md` | ADD | ADR 템플릿 |
| `.cowork/03_design_artifacts/adrs/.gitkeep` | ADD | ADR 인스턴스 폴더 스캐폴드 |

### 04_implementation/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/04_implementation/milestone_registry.md` | ADD | Milestone 인덱스 |
| `.cowork/04_implementation/task_registry.md` | ADD | Task 인덱스 |
| `.cowork/04_implementation/coding_convention.md` | ADD | 코딩 컨벤션 |
| `.cowork/04_implementation/review_checklist.md` | ADD | 리뷰 체크리스트 |
| `.cowork/04_implementation/templates/milestone_template.md` | ADD | Milestone 템플릿 |
| `.cowork/04_implementation/templates/task_template.md` | ADD | Task 템플릿 |
| `.cowork/04_implementation/milestones/.gitkeep` | ADD | Milestone 인스턴스 폴더 스캐폴드 |
| `.cowork/04_implementation/tasks/.gitkeep` | ADD | Task 인스턴스 폴더 스캐폴드 |

### 05_verification/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/05_verification/quality_gate.md` | ADD | 품질 관문 규칙 |
| `.cowork/05_verification/test_strategy.md` | ADD | 테스트 전략 |
| `.cowork/05_verification/verification_evidence.md` | ADD | 검증 근거 인덱스 |
| `.cowork/05_verification/test_case.md` | ADD | 테스트 케이스 |

### 06_evolution/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/06_evolution/project_state.md` | ADD | 공유 상태 인덱스 (1.1.0: 이월 백로그 SSOT + R1/R2 규칙 포함) |
| `.cowork/06_evolution/state_archive.md` | ADD | 완료 서사 하베스트 아카이브 (1.1.0 신규, append-only) |
| `.cowork/06_evolution/knowledge_base.md` | ADD | 지식 저장소 |
| `.cowork/06_evolution/retrospective.md` | ADD | 회고 (1.1.0: Framework Back-Port Queue 포함) |
| `.cowork/06_evolution/templates/session_log_template.md` | ADD | 세션 로그 템플릿 |
| `.cowork/06_evolution/imported_context/.gitkeep` | ADD | 외부 컨텍스트 폴더 스캐폴드 |

### 07_delivery/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/07_delivery/export_spec.md` | ADD | export 기준 |
| `.cowork/07_delivery/release_note.md` | ADD | 릴리즈 노트 |
| `.cowork/07_delivery/operation_guide.md` | ADD | 운영 가이드 |
| `.cowork/07_delivery/user_manual.md` | ADD | 사용자 메뉴얼 |

### members/

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/members/.gitkeep` | ADD | members 폴더 스캐폴드 |
| `.cowork/members/profile_template.md` | ADD | 프로필 템플릿 |
| `.cowork/members/proposal_template.md` | ADD | 제안서 템플릿 |
| `.cowork/members/my_state_template.md` | ADD | 개인 상태 템플릿 |
| `.cowork/members/team_board.md` | ADD | 팀 보드 |

---

## 1.1.0 업그레이드 (from 1.0.0)

> `1.0.0 → 1.1.0` 순차 업그레이드 시 적용하는 델타. 자기개선(self-improvement) 릴리즈로, 인스턴스 운영에서 검증된 상태 문서 위생 규칙을 프레임워크 기본값으로 승격한다.

### 1.1.0 변경 요약

**P0 — 상태 문서 위생 (인스턴스 검증분 역류)**
- **트리거형 다이어트 규칙(R1/R2)** — 무트리거 "길어지면 압축"을 완료 서사 하베스트(최근 3세션 + `마무리` 시 이관)와 표 셀 비대 분리로 교체.
- **`state_archive.md` 신규** — R1 하베스트의 append-only 대상 아티팩트(Log/Archive 역할).
- **이월 백로그 SSOT 표** — 흩어진 이월을 `project_state.md`의 단일 표로 모으고, 매 세션 브리핑(§1D)에 포함 + AI가 트리거를 능동 감시.
- **Framework Back-Port Queue** — 인스턴스 학습을 프레임워크로 역류시키는 큐를 `retrospective.md` §4에 신설(원칙 #6의 실행 장치).

**P1 — 위생·협업 모델 신규 설계**
- **무트리거 축적 금지(F-04)** — `cowork.md` 불변 규칙에 일반 원칙으로 승격.
- **라이브 상태 문서 크기 예산(F-05)** — 건강 지표를 문서:코드 비율이 아니라 항상 로드되는 상태 문서 절대 크기로. `cowork.md` + `session_protocol.md` 세션 시작 자체 점검.
- **협업 실행 모드 solo/team(F-06)** — 좌석 정의와 매 세션 부기를 분리. `project_state.md` 필드 + `decision_authority_matrix.md` 정의.
- **역할 물성화 가이드(F-07)** — `role_realization.md` 신규. 좌석을 사람/AI 페르소나/독립 서브에이전트로 실행하는 기준, 독립 실행의 오류 탈상관 근거.

### 1.1.0 파일 분류

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/06_evolution/state_archive.md` | ADD | 신규 아티팩트. 대상 프로젝트에 없으면 추가, 이미 있으면 SKIP(인스턴스 자체 도입분 보존) |
| `.cowork/01_cowork_protocol/role_realization.md` | ADD | 신규 가이드. 없으면 추가 |
| `.cowork/06_evolution/project_state.md` | MERGE | 프로젝트 데이터 보존. `이월 백로그` 섹션·`협업 실행 모드` 필드·`작성/유지 규칙`(R1/R2)만 병합, 로딩 가이드에 `state_archive` 추가 |
| `.cowork/06_evolution/retrospective.md` | MERGE | 기존 회고 보존. §4를 `Framework Back-Port Queue`로 확장 병합 |
| `.cowork/cowork.md` | REPLACE | 규칙 문서. F-04 불변 규칙·F-05 크기 예산·F-06 모드·거버넌스 맵 반영 |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | 규칙 문서. R1/R2·하베스트·백로그 브리핑·백포트·F-05 자체점검·F-06 모드 확인 반영 |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | 규칙 문서. 협업 실행 모드(solo/team) 섹션 신설 |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | 규칙 문서. 역할 실행 방식 배치 원칙 1행 추가 |
| `.cowork/01_cowork_protocol/document_role_inventory.md` | REPLACE | 규칙 문서. `state_archive.md`·`role_realization.md` 등재 + R1/R2 운영 메모 |

> `MERGE` 항목은 프로젝트가 채운 데이터를 덮어쓰지 않는다. 충돌·판단 애매 시 Human 승인 후 적용한다(§`session_protocol.md` 16).

---

## 적용 메모

- `v1.0.0`에서는 과거 `cowork-context-template` 릴리즈 체인, legacy `From` 추론, 과거 zip 이름을 계승하지 않는다.
- `v1.1.0+`부터는 이 기준선을 기반으로 `From = 직전 버전` 규칙을 강제한다.
- 영어판 `frameworks/en`은 한국어 기준선 `frameworks/ko`와 같은 릴리즈 라인에서 동기화 배포한다. **(1.1.0: `frameworks/en` 동기화 완료.)**

---

<!-- CUMULATIVE:START -->
## Cumulative Change Index (Auto-generated)

> Auto-updated during release to support sequential upgrades.

| Version | Key Change Summary |
|---------|--------------------|
| 1.0.0 | `cowork-context-framework` 저장소의 첫 공식 기준선 |
| 1.1.0 | 위생·협업 모델 자기개선 — 트리거형 다이어트(R1/R2)·`state_archive.md`·이월 백로그 SSOT·Back-Port Queue·무트리거 축적 금지·상태문서 크기 예산·협업 실행 모드(solo/team)·역할 물성화 가이드 |
<!-- CUMULATIVE:END -->
