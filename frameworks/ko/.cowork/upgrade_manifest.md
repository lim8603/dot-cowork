# 업그레이드 매니페스트 (Upgrade Manifest)

> 프레임워크 업그레이드 시 AI가 읽는 파일 변경 분류표

---

## 버전 정보

| 항목 | 내용 |
|------|------|
| Version | 1.5.1 |
| From | 1.5.0 |
| 날짜 | 2026-09-25 |
> 아래 `## 파일 분류`의 `ADD` 표는 여전히 **신규 프레임워크 기준선 설치용** 전체 목록이다(1.1.0 신규 파일 `state_archive.md` 포함).
> `1.0.0 → 1.1.0` 순차 업그레이드는 `## 1.1.0 업그레이드 (from 1.0.0)` 델타 표를 따른다.
> 이미 임의의 `.cowork/` 구조가 존재하는 프로젝트에 신규 도입할 때는 자동 업그레이드가 아니라 **마이그레이션**으로 취급하고 Human 확인을 거친다.

---

## 변경 요약

- 이월 트리거 감시 복원(1.5.1) — 작업이 지정된 세션에서도 도래한 이월 트리거를 한 줄로 먼저 알림
- 요청 중심 하네스 정리(1.5.0) — 진입점 간소화·선택적 컨텍스트 로딩·권한별 승인·필요 시 로그·의도 기반 문서 생성
- 실사용 기반 개선(1.4.0) — 상태 문서 크기 예산과 R1/R2 정리·진입점 상태 중복 제거·검증 근거 유효 범위·학습 출처 강화

- 검증 낙진·미결 분기 자기개선(1.3.0) — 게이트·불변식 변경의 종단 재검증 의무(F-11)·미결 위의 분기 점검(F-12)
- 온보딩·결정 무결성·강제 자기개선(1.2.0) — 동료 온보딩 런북(F-08)·결정 반전/드리프트 감지(F-09)·세션 규율 강제 훅(F-10)
- 위생·협업 모델 자기개선(1.1.0) — 트리거형 다이어트(R1/R2)·`state_archive.md`·이월 백로그 SSOT·Back-Port Queue·무트리거 축적 금지·상태문서 크기 예산·협업 실행 모드(solo/team)·역할 물성화 가이드
- `.cowork` 구조는 `운영 기준 문서 / 기준 본문 / 목록 문서 / 상세 문서 / 템플릿 / 로그·아카이브` 모델을 따른다
- 기본 작업 분해 축은 `Intent -> Milestone -> Task`를 사용한다
- 도구·환경 의존 운영 규칙은 `tooling_environment_guide.md`에서 별도 관리한다
- `v1.1.0+`부터는 `From` 기반 순차 업그레이드를 사용한다

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
| `.cowork/01_cowork_protocol/onboarding_runbook.md` | ADD | 동료 온보딩 런북 (1.2.0 신규, F-08) |
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

## 1.5.1 업그레이드 (from 1.5.0)

> 1.5.0 이 조건부 브리핑으로 바꾸며 함께 지운 이월 트리거 감시 책임을 복원한다. 작업이 지정된 세션에서도 도래한 트리거는 한 줄로 알린다.

### 1.5.1 파일 분류

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `AGENTS.md` | MERGE | 시작과 재개 첫 항목에 도래한 이월 트리거 한 줄 알림 문장만 추가 |
| `CLAUDE.md` | MERGE | 위와 동일 |
| `GEMINI.md` | MERGE | 위와 동일 |
| `.github/copilot-instructions.md` | MERGE | 위와 동일 |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | 빠른 실행 기준 1 · §1D 이월 문단에 트리거 감시 책임 복원 |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | F-02 점검 항목에 도래한 트리거 확인 추가 |
| `.cowork/06_evolution/project_state.md` | MERGE | 이월 백로그 머리말에 트리거 감시 문장만 추가. 표와 프로젝트 데이터 보존 |

> 문장 추가만이다. `REPLACE` 문서에 프로젝트별 수정이 있으면 해당 문장만 병합한다.

---

## 1.5.0 업그레이드 (from 1.4.0)

> 기존 프로젝트의 상태·승인·담당·산출물 결정을 보존하면서 하네스 실행 규칙을 간소화한다.

### 1.5.0 파일 분류

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `AGENTS.md` | MERGE | 공통 실행 규칙을 짧게 정리. 프로젝트명·언어·도구별 지시 보존 |
| `CLAUDE.md` | MERGE | 위와 동일 |
| `GEMINI.md` | MERGE | 위와 동일 |
| `.github/copilot-instructions.md` | MERGE | 위와 동일 |
| `.cowork/README.md` | MERGE | 요청 기반 시작 예시와 조건부 브리핑 안내 병합 |
| `.cowork/cowork.md` | REPLACE | 권한별 실행과 선택적 컨텍스트 로딩 원칙 |
| `.cowork/01_cowork_protocol/communication_convention.md` | REPLACE | 질문·옵션 제시 기준 간소화 |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | H/J/A 적용 범위와 승인된 작업 내 구현 자율성 명확화 |
| `.cowork/01_cowork_protocol/escalation_policy.md` | REPLACE | 새롭고 중대한 근거가 있을 때만 우려 재제기 |
| `.cowork/01_cowork_protocol/role_realization.md` | REPLACE | 독립 검토의 효과에 대한 과도한 단정 제거 |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | 빠른 실행 기준, 조건부 브리핑·로그, ADR 승격 기준, 의도 기반 요청 처리 |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | 도구별 예시 위치와 진입점 동기화 규칙 정리 |
| `.cowork/04_implementation/templates/task_template.md` | MERGE | 모든 Task에 일괄 승인을 요구하지 않도록 설명 갱신 |
| `.cowork/06_evolution/project_state.md` | MERGE | 작업별 읽기 순서만 병합. 활성 ID·제약·이월·승인·프로젝트 데이터 보존 |
| `.cowork/07_delivery/export_spec.md` | MERGE | ADR와 기준 문서의 충돌 조정 규칙만 병합. 산출물 결정 보존 |
| `.cowork/members/my_state_template.md` | MERGE | 로그가 없는 첫 세션의 참조 필드 처리. 개인 상태 파일은 교체하지 않음 |
| `.cowork/members/proposal_template.md` | MERGE | 단어만으로 제안을 생성하지 않는 안내 병합 |
| `.cowork/members/team_board.md` | MERGE | 역할 슬롯 승인 기준만 병합. 기존 배정과 작업 상태 보존 |

> `MERGE`는 기존 프로젝트 데이터와 커스터마이징을 보존한다. `REPLACE` 문서에 프로젝트별 수정이 있으면 MERGE로 전환하고 충돌을 확인한다. 읽기 전용 요청만으로 로그·멤버 파일을 만들지 않는다.

---

## 1.4.0 업그레이드 (from 1.3.0)

> 상태·검증 기록을 보존하면서 운영 규칙을 갱신하는 순차 업그레이드다.

### 1.4.0 파일 분류

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/01_cowork_protocol/document_role_inventory.md` | REPLACE | 현재 상태와 아카이브의 역할 정리 |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | 세션 크기 점검·무손실 상태 정리·solo 참조·검증 근거 갱신 |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | 공유 상태를 참조하는 진입점 운영 규칙 |
| `.cowork/05_verification/quality_gate.md` | REPLACE | 게이트 판정 근거의 revision·환경 유효 범위 |
| `.cowork/05_verification/verification_evidence.md` | MERGE | 범위 규칙과 근거/공백 열만 병합. 모든 EV/GAP 기록과 게이트 이력 보존 |
| `.cowork/06_evolution/knowledge_base.md` | MERGE | 짧은 요약 승격 규칙 병합. 기존 교훈과 출처 링크 보존 |
| `.cowork/06_evolution/project_state.md` | MERGE | 유지 규칙만 병합. 활성 ID·승인·제약·백로그·현재 상태 보존 |
| `.cowork/06_evolution/retrospective.md` | MERGE | 출처·후보 판정 규칙 병합. 기존 회고와 큐 보존 |
| `.cowork/06_evolution/state_archive.md` | MERGE | 운영 규칙만 병합. 아카이브 원문 전체 보존 |
| `.cowork/cowork.md` | REPLACE | R1/R2와 측정 가능한 상태 크기 예산 |
| `.cowork/members/my_state_template.md` | MERGE | solo 안내 병합. 템플릿 커스터마이징 보존. 기존 개인 상태 파일은 교체하지 않음 |
| `.github/copilot-instructions.md` | MERGE | Phase/마일스톤 복제본을 공유 상태 참조로 교체. 프로젝트 정보와 도구별 지시 보존 |
| `AGENTS.md` | MERGE | Phase/마일스톤 복제본을 공유 상태 참조로 교체. 프로젝트 정보와 도구별 지시 보존 |
| `CLAUDE.md` | MERGE | Phase/마일스톤 복제본을 공유 상태 참조로 교체. 프로젝트 정보와 도구별 지시 보존 |
| `GEMINI.md` | MERGE | Phase/마일스톤 복제본을 공유 상태 참조로 교체. 프로젝트 정보와 도구별 지시 보존 |

> `MERGE`는 기존 프로젝트 데이터·승인·근거를 보존하며 규칙/필드만 병합한다. 과거 검증에 revision/환경이 없으면 추측해 채우지 않는다. `REPLACE` 문서에 프로젝트별 수정이 있으면 MERGE로 전환한다. 상태 정리와 기존 멤버 파일 갱신은 업그레이드 파일 교체와 별개로, 새 R1/R2에 따라 근거를 확인하며 수행한다. 저장소 전용 `scripts/audit-cowork-state.ps1`와 실사용 검토 문서는 소비자 아카이브에 포함되지 않는다.

---

## 1.3.0 업그레이드 (from 1.2.0)

> `1.2.0 → 1.3.0` 순차 업그레이드 시 적용하는 델타. **검증이 놓치는 두 클래스**를 메우는 P3 자기개선 릴리즈 — 조인 게이트의 낙진이 다른 경로에서 터지는 문제(F-11)와, 열린 미결 위에서 문서가 갈라지는 문제(F-12).

### 1.3.0 변경 요약

- **게이트·불변식 변경의 종단 재검증(F-11)** — `quality_gate.md` 신규 섹션 + 게이트 4 판정 항목 + `session_protocol.md` §2 소비자 목록 작성·§4 종료 체크리스트. 검증 규칙·게이트·불변식·계약을 **조이는** 변경은 자기 자신이 아니라 **그 관문을 지나던 기존 경로**의 의미를 바꾼다. 조인 시점에 소비자 목록을 적고 종료 전 종단 스위트로 확인하며, 미검증분은 침묵하지 않고 이월에 등재한다.
- **미결 위의 분기 점검(F-12)** — `decision_authority_matrix.md` 신규 섹션 + `session_protocol.md` §6 게이트 트리거. 열린 Open Question은 빈칸이 아니라 **문서 둘이 서로 다른 답으로 각자 굳는 자리**다. ADR을 위반하지 않으므로 F-09 반전 점검에 걸리지 않는다 — Phase 전환·릴리즈 전·해당 영역 착수 직전에 "참조 문서들이 같은 답을 쓰는가"를 대조한다.

### 1.3.0 파일 분류

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/05_verification/quality_gate.md` | REPLACE | 규칙 문서. §게이트·불변식 변경의 종단 재검증(F-11) 추가 + 게이트 4 판정 항목 1행 |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | 규칙 문서. §미결 위의 분기(F-12) 추가 + 권한 1행 |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | 규칙 문서. §2 F-11 소비자 목록·§4 종료 체크리스트 F-11·§6 게이트 F-12 트리거 반영 |

> `REPLACE` 항목은 프레임워크 소유 규칙 문서다. 인스턴스가 해당 문서를 커스터마이즈했으면 MERGE로 취급하고 Human 승인 후 적용한다.

---

## 1.2.0 업그레이드 (from 1.1.0)

> `1.1.0 → 1.2.0` 순차 업그레이드 시 적용하는 델타. 온보딩·결정 무결성·강제 계층을 추가하는 P2 자기개선 릴리즈.

### 1.2.0 변경 요약

- **동료 온보딩 런북(F-08)** — `onboarding_runbook.md` 신규. 사람이 좌석에 합류하는 절차(좌석 선택→모드 전환→배정→인계). `solo` 좌석 정의를 선불 온보딩 경로로 전환.
- **결정 반전·드리프트 감지(F-09)** — `decision_authority_matrix.md` 신규 섹션 + `session_protocol.md` §6 트리거. Accepted ADR vs 코드/문서 대조로 무근거 반전·드리프트 적발, 결정 코호트 재검토 원칙.
- **세션 규율 강제 훅(F-10)** — `tooling_environment_guide.md` 신규 섹션. 세션 시작 자체 점검을 도구/git/CI 훅으로 기계적 강제(자발적 준수 의존 완화).

### 1.2.0 파일 분류

| 파일 | 분류 | 변경 내용 |
|------|------|----------|
| `.cowork/01_cowork_protocol/onboarding_runbook.md` | ADD | 신규 런북. 없으면 추가 |
| `.cowork/01_cowork_protocol/decision_authority_matrix.md` | REPLACE | 규칙 문서. §결정 반전·드리프트 감지(F-09) 추가 |
| `.cowork/01_cowork_protocol/tooling_environment_guide.md` | REPLACE | 규칙 문서. §세션 규율 강제(F-10) 추가 |
| `.cowork/01_cowork_protocol/session_protocol.md` | REPLACE | 규칙 문서. F-09 게이트 트리거·F-10 훅 주석·1B-3 런북 포인터 반영 |
| `.cowork/cowork.md` | REPLACE | 규칙 문서. 거버넌스 맵에 `onboarding_runbook.md` 등재 |
| `.cowork/01_cowork_protocol/document_role_inventory.md` | REPLACE | 규칙 문서. `onboarding_runbook.md` 등재 |

> `REPLACE` 항목은 프레임워크 소유 규칙 문서다. 인스턴스가 해당 문서를 커스터마이즈했으면 MERGE로 취급하고 Human 승인 후 적용한다.

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
| 1.1.0 | 위생·협업 모델 자기개선(1.1.0) — 트리거형 다이어트(R1/R2)·`state_archive.md`·이월 백로그 SSOT·Back-Port Queue·무트리거 축적 금지·상태문서 크기 예산·협업 실행 모드(solo/team)·역할 물성화 가이드 |
| 1.2.0 | 온보딩·결정 무결성·강제 자기개선(1.2.0) — 동료 온보딩 런북(F-08)·결정 반전/드리프트 감지(F-09)·세션 규율 강제 훅(F-10) |
| 1.3.0 | 검증 낙진·미결 분기 자기개선(1.3.0) — 게이트·불변식 변경의 종단 재검증 의무(F-11)·미결 위의 분기 점검(F-12) |
| 1.4.0 | 실사용 기반 개선(1.4.0) — 상태 문서 크기 예산과 R1/R2 정리·진입점 상태 중복 제거·검증 근거 유효 범위·학습 출처 강화 |
| 1.5.0 | 요청 중심 하네스 정리(1.5.0) — 진입점 간소화·선택적 컨텍스트 로딩·권한별 승인·필요 시 로그·의도 기반 문서 생성 |
| 1.5.1 | 이월 트리거 감시 복원(1.5.1) — 작업이 지정된 세션에서도 도래한 이월 트리거를 한 줄로 먼저 알림 |
<!-- CUMULATIVE:END -->
