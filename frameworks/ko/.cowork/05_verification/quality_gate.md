# 품질 게이트 (Quality Gate)

> 품질 관문 — 각 단계를 통과하기 위한 최소 기준

---

## 게이트 적용 원칙

- template 파일은 gate 통과 판단의 기준 문서가 아니다.
- 목록 문서는 상태와 링크의 기준선이고, 상세 근거는 기준 본문 또는 상세 문서에서 확인한다.
- `session_logs/`와 `imported_context/`는 보조 근거이며, 필요한 사실이 기준 문서에 반영되지 않았다면 게이트 충족으로 보지 않는다.
- `deliverable_plan.md`에서 `해당없음`으로 확정된 산출물은 gate 판단 대상에서 제외한다.
- `project_state.md`는 gate 통과 요약을 남길 수 있지만, 실제 판정은 각 gate의 증거 문서를 우선 확인한다.
- 게이트 1, 게이트 2에서 `deliverable_plan.md`의 수집 상태는 **현재 Phase에서 기준 문서를 직접 형성해야 하는 필수 산출물**만 차단 조건으로 본다.
- 최초 세션 최소 입력 누락은 즉시 게이트 미충족으로 판정하지 않지만, 게이트 1 또는 게이트 2로 넘어가기 전 `session_protocol.md`의 최초 세션 종료 체크에 따라 우선 보완하는 것을 기본값으로 본다.
- `verification_evidence.md`는 게이트 4, 게이트 5용 증거 인덱스다. 실제 판정은 이 문서와 원본 기준 문서를 교차 확인한다.

---

## 게이트 정의

### 게이트 1: Intent → Requirement

| 항목 | 기준 |
|------|------|
| 활성 Intent 승인 | `intent_registry.md`에 활성 Intent 1건 이상 Approved |
| 모호한 요구사항 | 0건 |
| 비목표 명시 | 작성 완료 |
| DEFINE 핵심 질문셋 정리 | `session_protocol.md` 기준 DEFINE 종료 전 필수 질문셋의 답 또는 열린 질문이 관련 기준 문서와 `project_state.md`에 보인다 |
| 산출물 계획 확정 | `deliverable_plan.md` Human Approved |
| 필수 산출물 수집 착수 | `deliverable_plan.md` 기준 현재 Define 기준 문서를 직접 사용하는 필수 산출물은 `미수집`으로 방치되지 않고, 필요한 데이터가 `미수집 데이터 목록`에 등록되어 있어야 한다 |

### 게이트 2: Requirement → Design

| 항목 | 기준 |
|------|------|
| 요구사항 ID 부여 | 전체 완료 |
| 우선순위 확정 | Must 항목 확정 |
| 수락 기준 작성 | `user_story_registry.md`에 등록된 승인 대상 Story 기준 충족 |
| 리스크 식별 | 초기 등록 완료 |
| DEFINE 핵심 질문셋 종료 | `session_protocol.md` 기준 DEFINE 종료 전 필수 질문셋이 기준 문서 기준으로 닫혀 있으며, 남은 항목은 Human 승인된 보류 사유와 다음 수집 계획이 기록되어 있어야 한다 |
| 필수 산출물 수집 상태 정렬 | `deliverable_plan.md` 기준 현재 Define 기준 문서를 직접 사용하는 필수 산출물은 `수집중` 이상이어야 하며, 요구사항 정의를 직접 기준 문서로 쓰는 핵심 산출물은 `완료` 또는 즉시 생성 가능한 수준이어야 한다 |

> 게이트 1, 게이트 2에서 후속 Phase 산출물까지 모두 `완료`일 필요는 없다.
> 단, 현재 Phase 기준 문서가 이미 존재해야 하는 필수 산출물이 `미수집`으로 남아 있거나, DEFINE 핵심 질문셋이 근거 없이 비어 있으면 게이트 미충족으로 본다.

### 게이트 3: Design → Implementation

| 항목 | 기준 |
|------|------|
| 도메인 모델 리뷰 | Human Approved |
| ADR 기록 | 핵심 결정 기록 완료 |
| 인터페이스 계약 정의 | 모듈 간 계약 확정 |
| 기술스택 확정 | `tech_stack.md` 등록 완료 |
| Milestone 구조화 | `milestone_registry.md` 초안 이상 작성 |
| Task 구조화 | `task_registry.md` 초안 이상 작성 |
| 팀 Task 할당 | `team_board.md` 역할별 Task 배정 완료 (팀 프로젝트 시) |

### 게이트 4: Implementation → Verification

| 항목 | 기준 | 핵심 증거 |
|------|------|-------------|
| 코드 리뷰 완료 | Review Checklist 통과 | `05_verification/verification_evidence.md`, `04_implementation/review_checklist.md`, 관련 `04_implementation/tasks/TASK-*.md` |
| 검증 대상 Milestone 정렬 | `milestone_registry.md` 기준 검증 대상 Milestone이 Review 이상 상태 | `05_verification/verification_evidence.md`, `04_implementation/milestone_registry.md`, 관련 `04_implementation/milestones/MS-*.md` |
| 핵심 Task 완료 기준 충족 | `task_registry.md` 기준 검증 대상 Task가 Review 이상 상태 | `05_verification/verification_evidence.md`, `04_implementation/task_registry.md`, 관련 `04_implementation/tasks/TASK-*.md` |
| 단위 테스트 통과 | 핵심 범위 기준 통과 | `05_verification/verification_evidence.md`, `05_verification/test_case.md`, 관련 `04_implementation/tasks/TASK-*.md` |
| 코딩 컨벤션 준수 | Lint 통과 | `05_verification/verification_evidence.md`, `04_implementation/review_checklist.md`, 관련 `04_implementation/tasks/TASK-*.md` |
| 게이트·불변식 변경 시 종단 재검증 (F-11) | 조인 판정의 소비자 목록이 작성되고 종단 스위트로 확인됨 | `05_verification/verification_evidence.md`, 최신 세션 로그(소비자 목록), `05_verification/test_case.md` |

#### 게이트 4 판정 규칙

- `verification_evidence.md`를 먼저 보고, 표에 적힌 원본 문서와 최신 상태가 서로 일치하는지 교차 확인한다.
- Milestone / Task / 리뷰 / 테스트 / lint 상태는 evidence와 목록 문서 / 상세 문서 / checklist가 같은 상태를 가리켜야 한다.
- 미충족이면 Verify 진입을 보류하고, 차단 사유와 열린 항목을 `project_state.md`에 기록한다.
- 예외는 Human 승인 후 `project_state.md`와 최신 세션 로그에 사유와 보완 계획을 남긴다.
- 테스트 예외나 일부 미실행 범위는 `test_case.md` 또는 `verification_evidence.md`에도 함께 남긴다.

### 게이트 5: Verification → Release

| 항목 | 기준 | 핵심 증거 |
|------|------|-------------|
| 통합 테스트 통과 | 전체 통과 | `05_verification/verification_evidence.md`, `05_verification/test_case.md`, 필요 시 관련 `04_implementation/tasks/TASK-*.md` |
| NFR 검증 | 목표값 충족 | `05_verification/verification_evidence.md`, `05_verification/test_strategy.md`, `05_verification/test_case.md` |
| 문서 최종 업데이트 | 완료 | `05_verification/verification_evidence.md`, `06_evolution/project_state.md`, release 대상 기준 본문 |
| 산출물 범위 충족 | `deliverable_plan.md` 기준 필수 산출물 생성 가능 | `05_verification/verification_evidence.md`, `02_project_definition/deliverable_plan.md`, `07_delivery/*` |

#### 게이트 5 판정 규칙

- `verification_evidence.md`를 기준 인덱스로 보고, Release 대상 범위의 최신 검증 결과와 문서 상태를 원본 기준 문서에서 다시 확인한다.
- Integration / E2E / NFR / 문서 / 산출물 준비 상태는 evidence, `test_case.md`, `test_strategy.md`, `project_state.md`, `deliverable_plan.md`, `07_delivery/*`가 서로 일치해야 한다.
- 미충족이면 Release를 보류하고 실패 범위, 누락 문서, 누락 산출물, 재검증 계획을 기록한다.
- 예외는 Human 승인 후 미충족 항목, 수용 사유, 후속 보완 계획을 남긴다.

---

## 게이트·불변식 변경의 종단 재검증 (F-11)

> 검증 규칙·게이트·불변식·계약을 **조이는** 변경은 자기 자신만 바꾸지 않는다. 그 관문을 이미 지나다니던 **기존 경로의 의미**를 바꾸므로, 조인 코드가 아니라 다른 곳에서 터진다.

### 왜 필요한가

- 조인 변경에는 대개 그것을 증명하는 새 테스트가 붙는다. 그 테스트는 통과한다 — 새 규칙이 새 규칙대로 동작하는지만 보기 때문이다.
- 정작 깨지는 것은 **그 관문을 지나던 기존 경로**다. 이전에는 통과하던 것이 이제 걸리고, 그 사실은 종단 경로를 실제로 밟아봐야 드러난다.
- 단위·통합 테스트가 전부 초록인 채로 기능 하나가 조용히 죽고, 다음 세션이 그것을 다시 밟기 전까지 아무도 모른다. **다른 세션이 남긴 결함이 이번 세션의 게이트 강화로 승격되는** 형태라 책임 소재도 흐려진다.

### 규칙

- **조인 시점에 소비자 목록을 적는다.** "이 판정을 통과해야 하는 것이 무엇인가" — 코드 경로, 화면, 계약/스키마, 시드/픽스처, 기존 데이터까지 포함해 세션 로그에 남긴다.
- **세션 종료 전 그 목록을 종단 스위트로 확인한다.** E2E·통합 등 실제 경로를 밟는 검증이어야 하며, 단위 테스트 통과는 이 항목을 대체하지 못한다.
- **미검증분은 침묵하지 않는다.** 실행하지 못했으면 소비자별로 무엇이 미검증인지 명시하고 `project_state.md` 이월과 세션 로그에 등재한다. Human이 사전 승인한 예외라도 **공지 없이 넘기는 것은 예외의 범위가 아니다.**
- 이 항목은 Phase 전환 게이트 4 판정에 포함된다(위 표).

### 적용 대상 예시

- 승격/배포 게이트의 판정 조건 강화, 스키마·API 계약 변경, 유일성·참조 무결성 제약 추가, 검증 함수의 허용 범위 축소, 권한 판정 강화, 기본값·폴백의 보수화.

---

## 플레이스홀더 / 구조 검증 (Placeholder / Structure Check)

아래 항목이 **현재 게이트 판단 또는 `deliverable_plan.md`에서 필수 / 권장 기준 문서로 사용되는 기준 본문 / 목록 문서 / 상세 문서**에 남아 있으면 게이트 미충족으로 본다.

- `templates/*_template.md` 안의 placeholder와 가이드 주석은 정상이다.
- 목록 문서의 `현재 등록 ... 없음` 문구는 허용하지만, 예시 행이나 더미 샘플 행은 남기지 않는다.
- `H1`에 `Template` 문자열이 남아 있다.
- `<!-- ... -->` 형태의 가이드 주석이 기준 본문에 남아 있다.
- `INT-000`, `US-000`, `MS-000`, `TASK-000`, `ADR-000` placeholder가 남아 있다.
- 목록 문서에 없는 활성 항목을 기준 문서처럼 사용한다.
- `deliverable_plan.md`의 기준 문서가 실제 목록 문서 / 상세 문서 구조와 불일치한다.
- imported context만 있고 기준 문서 반영이 없는 상태로 확정 판단한다.

---

## 예외 처리

Gate를 우회해야 하는 경우:

1. Human이 명시적으로 승인한다.
2. 사유를 ADR 또는 세션 로그에 기록한다.
3. 후속 보완 계획을 수립한다.
