# 세션 프로토콜 (Session Protocol)

> 세션의 시작, 진행, 중단, 종료 — 작업 연속성을 보장하는 프로토콜

---

## 목적

AI는 세션 간 기억이 리셋된다. 이 프로토콜은 **어떤 시점에서든 작업을 이어갈 수 있도록**
컨텍스트 보존과 핸드오프 규칙을 정의한다.

---

## 운영 원칙: 불변 규칙과 AI 재량

### 불변 규칙

- Human이 최종 결정권을 가진다
- `.cowork/` 문서는 프로젝트의 공유 기준 문서로 취급한다
- 확정된 사실, 작업상 가정, 미확정 사항을 구분하여 기록한다
- 주요 결정과 릴리즈 산출물은 관련 문서, ADR, 세션 로그로 추적 가능해야 한다

### AI 재량 영역

- AI는 문서 구조, 요약 방식, 질문 순서, 공식 산출물 생성 표현을 더 나은 형태로 개선할 수 있다
- AI 성능이 향상되어 더 나은 계획/문서화/공식 산출물 생성 방식이 가능해지면 Human에게 제안할 수 있다
- 문서가 과도하게 비대해지거나 선택 로딩이 필요해지면, AI는 목록 문서 + 상세 문서 구조로의 승격을 제안할 수 있으며 실제 구조 변경은 Human 승인 후 진행한다
- Human이 승인한 더 나은 방식은 cowork 문서에 반영하여 프레임워크 자체를 진화시킨다

---

## 문서 역할별 운영 규칙

| 역할 | 대표 예시 | 운영 규칙 |
|---|---|---|
| 운영 기준 문서 (Governance) | `cowork.md`, `session_protocol.md`, `quality_gate.md` | 규칙 문서로만 사용하고 프로젝트 데이터 저장 용도로 쓰지 않는다 |
| 기준 본문 (Canonical) | `requirement_spec.md`, `domain_model.md`, `deliverable_plan.md`, `project_state.md` | 같은 경로에서 직접 누적 갱신한다 |
| 목록 문서 (Registry) | `intent_registry.md`, `adr_registry.md`, `milestone_registry.md`, `task_registry.md` | 세션 시작 시 우선 로드하고 상태/링크를 짧게 관리한다 |
| 상세 문서 (Instance) | `intents/INT-*.md`, `user_stories/US-*.md`, `adrs/ADR-*.md`, `milestones/MS-*.md`, `tasks/TASK-*.md` | 새 객체가 생길 때 새 파일을 만든다 |
| 템플릿 (Template) | `templates/*_template.md` | 복사 전용이며 직접 작업 기록 공간으로 사용하지 않는다 |
| 로그 / 아카이브 (Log / Archive) | `members/<이름>/workspace/session_logs/`, `imported_context/` | append-only 근거 저장소이며 기본 로딩 대상이 아니다 |

### 기본 운영 규칙

- `_template.md`가 붙은 파일만 복사 원본이다.
- `Phase`는 프레임워크의 고정 단계이고, `Milestone`은 프로젝트별 중간 완료 단위다.
- `Intent -> Milestone -> Task`는 작업 분해 축이고, `User Story`와 `ADR`은 교차 참조 축이다.
- imported context는 필요한 사실을 추출한 뒤에만 작업 기준 문서에 반영한다.
- 도구별 승인 방식, 진입점 동기화, 네트워크/다운로드 의존 동작은 `tooling_environment_guide.md`와 현재 도구의 진입점 문서를 함께 따른다.

---

## 세션 흐름 (Session Lifecycle)

### 1. 세션 시작 (Session Start)

- [ ] `.cowork/06_evolution/project_state.md`에서 프로젝트 존재 여부와 현재 Phase, 활성 Intent, 활성 Milestone, 열린 질문, 다음 시작점 확인
- [ ] `project_state.md`에서 프로젝트 유형, 팀 구성 모드, 대화 언어, 작업 문서 언어, 공식 산출물 문서 언어 확인
- [ ] 현재 사용자의 `.cowork/members/<이름>/` 폴더와 workspace 존재 여부 확인
- [ ] **멤버 확인 및 초기화** — 현재 사용자 폴더가 없으면 이름/식별자를 확인하고 `profile.md`, `workspace/`, `my_state.md`, `session_logs/` 구조를 먼저 생성한다. 팀 프로젝트면 역할/담당 영역을 확인하고, 1인 프로젝트면 solo default를 적용한다
- [ ] 현재 사용자 workspace가 이미 있으면 `members/<이름>/workspace/my_state.md`에서 개인 작업 맥락 복원
- [ ] 현재 사용자 workspace가 이미 있으면 최신 세션 로그를 읽어 이전 맥락 복원
- [ ] 팀 프로젝트면 `.cowork/members/team_board.md`에서 팀 역할·Task 할당 현황 확인
- [ ] `deliverable_plan.md`에서 확정 산출물과 미수집 데이터 확인
- [ ] **선택적 컨텍스트 로딩** — `project_state.md`의 컨텍스트 로딩 가이드에 따라 현재 Phase에 필요한 목록 문서/기준 본문을 우선 로드한다. 규칙 문서(`cowork.md`, `session_protocol.md` 등)는 첫 세션에서 숙지 후 생략한다
- [ ] 필요 시 `06_evolution/imported_context/`에서 외부 대화/메모를 확인하되, 해당 내용은 직접 기준 문서로 사용하지 않고 추출 후 반영한다
- [ ] **세션 로그 파일 자동 생성** — 멤버 확인과 기존 로그 확인이 끝난 뒤 `members/<이름>/workspace/session_logs/session_YYYY-MM-DD_NNN.md`를 생성한다 (1인/팀 공통)
- [ ] **.gitignore 자동 설정** — 세션 로그 제외 규칙이 없으면 자동 추가
- [ ] **Proposal 확인** — `members/*/proposals/`에 Pending 상태의 제안이 있으면 Master 권한자에게 알림
- [ ] **도구별 실행 제약 확인** — 자동승인, 파일/쉘 실행 가능 여부, 네트워크 접근 가능 여부 같은 환경 의존 동작은 현재 도구의 진입점 문서와 `tooling_environment_guide.md` 기준으로 확인한다
- [ ] **시작 경로 판별** — 재개 가능한 정보가 충분하면 브리핑으로 바로 진입하고, 핵심 프로젝트 정보가 부족하거나 모순되면 1A의 짧은 온보딩을 먼저 수행한다
- [ ] **사용 가능한 키워드 안내** — 아래 키워드 목록을 간략히 공지
- [ ] **세션 브리핑 자동 출력** — 프로젝트 현황, 활성 Intent/Milestone, 활성 Task 목록, 이전 이월 항목을 역할 기반으로 표시 (§1D)
- [ ] **작업 선택 및 모드 판별** — Human의 응답(또는 최초 발화)을 브리핑 내용과 매칭하여 프로젝트 공통 모드 또는 개인 Task 모드로 진입 (§1D)
- [ ] 작업 계획 수립 (AI 제안 → Human 승인)

### 1A. 프로젝트 유형별 착수 (Project Archetype Kickoff)

세션 시작 진단 결과 아래 조건 중 하나에 해당하면, AI는 브리핑 전에 아래 최소 온보딩 질문셋으로 컨텍스트를 고정한다.

- `project_state.md`가 없거나 핵심 필드가 비어 있어 재개 기준점을 잡기 어려울 때
- 현재 사용자 workspace를 새로 만들었고 프로젝트 기본 정보가 충분하지 않을 때
- 기존 문서 간 핵심 정보가 모순되거나 Human이 새로 정리하길 원할 때

#### 최소 온보딩 질문셋

- 프로젝트명과 한 줄 목표는 무엇인가?
- 이 프로젝트는 신규 구축(그린필드)인가, 기존 시스템 확장/유지보수(브라운필드)인가?
- 현재 실제 진행 단계는 무엇인가, 또는 이번 세션에서 어디서 시작할 것인가? (Define / Design / Build / Verify / Evolve / Deliver)
- 이번 세션에서 반드시 달성할 최우선 목표는 무엇인가?
- 현재 막힌 지점, 의사결정이 필요한 항목, 특별 제약은 무엇인가?
- 필요 시 대화 언어, 작업 문서 언어, 공식 산출물 문서 언어는 무엇인가?

#### 최소 온보딩 운영 규칙

- `project_state.md`, 최신 세션 로그, 승인된 기준 문서에서 이미 확인 가능한 답은 다시 묻지 않는다.
- 멤버 폴더 생성만 필요한 경우에는 전체 온보딩으로 확장하지 않고, 사용자 식별과 역할/담당 영역 같은 최소 정보만 먼저 확인한다.
- 질문이 5개 이상으로 길어지거나 Human이 비동기 정리를 선호하면, AI는 `.cowork/06_evolution/imported_context/human_onboarding_brief.md` 같은 brief 파일 작성을 선택지로 제안할 수 있다.
- brief 파일은 보조 입력이다. AI는 필요한 사실만 추출해 `project_state.md`, `deliverable_plan.md`, `requirement_spec.md` 같은 기준 문서에 반영한 뒤 작업 기준으로 사용한다.
- brief 파일 작성은 선택 사항이다. Human이 짧게 답할 수 있으면 대화형 온보딩을 유지한다.

온보딩이 끝나면 AI는 확인 결과를 `project_state.md`와 관련 기준 문서에 반영한 뒤, 필요하면 1B와 1C를 수행하고 1D 브리핑으로 이어진다.

확인 결과에 따라 아래 분기로 진행한다.

#### A) 신규 프로젝트 (Greenfield)

- 기본 라이프사이클(DEFINE → DESIGN → BUILD → VERIFY → EVOLVE → DELIVER)을 따른다
- 요구사항 청취부터 시작해 단계별 산출물과 Quality Gate를 순차 적용한다

#### B) 기존 프로젝트 (Brownfield)

다음 순서로 진행한다.

1. **Reverse Discovery**: 코드/문서/이력에서 현행 동작, 제약, 의존성, 미해결 이슈를 수집한다
2. **Gap Elicitation**: 수집 불가능한 정보는 개발자에게, 목표/우선순위/완료 기준은 사용자에게 질문한다
3. **Phase Alignment**: 현재 상태를 Define / Design / Build / Verify / Evolve / Deliver 중 어디에 둘지 확정하고 `project_state.md`에 반영한다
4. **Execution Contract**: 이번 세션의 범위, 변경 허용 범위, 검증 기준, 승인 포인트를 합의한다

브라운필드에서는 "요구사항부터 재시작"을 기본값으로 두지 않는다. 먼저 현재 상태를 복원한 뒤 최소 변경 경로를 제안한다.

### 1B. 팀 구성 확인

Session Start 또는 1A에서 팀 구성 모드가 정리되면, AI는 팀 상황을 아래 분기로 정렬한다.

**B-1) 확정팀 (팀원이 이미 존재)**

1. 각 팀원의 이름, 역할, 역량을 파악한다
2. `team_board.md`의 역할 등록부에 실제 팀원을 직접 배정한다
3. Task 할당 시 팀원 역량과 의존 관계를 고려하여 배분한다
4. AI가 업무량 분석 결과 현재 팀원으로 부족하다고 판단하면, **가상 역할 슬롯 추가를 제안**할 수 있다
   - 예: "현재 3명인데, 프론트엔드와 백엔드를 분리하면 Role-D(프론트엔드 전담)가 필요합니다"
   - Human 승인 시 미배정 역할 슬롯으로 등록한다

**B-2) 사전배분 (팀 미확정 또는 부분 확정)**

1. AI가 기술스택, 기능 영역, 작업량을 분석하여 **필요한 역할 슬롯**을 제안한다
   - 예: "이 프로젝트는 최소 3개 역할이 필요합니다: 백엔드 코어(C++), 통신 계층(gRPC), 프론트엔드(React)"
2. Human 승인 후 역할 슬롯을 `team_board.md`에 등록한다
3. Task를 역할에 할당한다 (사람이 아닌 Role-ID 기준)
4. 담당자 컬럼은 `(Role-A 인수자)` 형태로 비워둔다

**B-3) 팀원 추가 시 매칭 (이후 시점)**

1. 새 팀원이 합류하면 AI가 역할 등록부의 미배정 역할 목록을 제시한다
2. 팀원의 역량과 역할 요구사항을 대조하여 매칭을 제안한다
3. Human 승인 후:
   - 역할 등록부의 배정 팀원 갱신
   - 해당 역할의 모든 Task에 담당자 자동 반영
   - `members/<이름>/workspace/my_state.md` 생성 및 담당 Task 목록 자동 채움
   - 역할 매칭 이력 기록
4. 하나의 역할이 너무 크면 **역할 분할**을 제안할 수 있다 (Role-B → Role-B1 + Role-B2)
5. 한 팀원이 여러 역할을 겸임할 수도 있다 (소규모 팀)

**B-4) 1인 프로젝트**

- `team_board.md`는 생성하지 않는다
- 공유 상태는 `project_state.md` 중심으로 유지하되, 세션 로그 구조는 팀 프로젝트와 동일하게 `members/<이름>/workspace/session_logs/`를 사용한다
- 다만 세션 재개 경로를 고정하기 위해 `.cowork/members/<이름>/profile.md`와 `members/<이름>/workspace/my_state.md`는 생성한다
- 생성 순서는 `이름/식별자 확정 -> profile.md 생성 -> my_state.md 생성 -> project_state.md와 핵심 필드 정렬`을 따른다
- 기본값은 `권한 = Master`, `역할 = 프로젝트 오너`, `담당 영역 = 프로젝트 전반`으로 시작하고, 실제 역할 표현이 더 구체화되면 이후 갱신한다
- 즉, 1인 프로젝트도 로그 경로는 팀과 같게 두고, 운영만 단순화한다

### 1C. 산출물 협상 (Deliverable Negotiation)

Define 단계 초반, Intent와 요구사항의 윤곽이 잡히면 AI는 산출물 범위를 협상한다.

#### 트리거 조건

- 프로젝트 최초 세팅 시 (Archetype Kickoff 직후)
- Intent가 Pivot/Split으로 크게 변경되었을 때

#### AI 자동 동작 (산출물 협상)

1. **프로젝트 프로파일링**: 아래 요소를 분석한다
   - 프로젝트 유형 (라이브러리 / 서비스 / CLI / 데스크톱 앱 / 임베디드 등)
   - UI 존재 여부
   - DB 사용 여부
   - 외부 배포 여부 (내부 도구 vs 공개 제품)
   - 팀 규모 (1인 vs 팀)
   - 운영 환경 (로컬 / 클라우드 / 온프레미스)

2. **산출물 제안**: `deliverable_plan.md`의 기본 추천 14종 각 항목에 대해 `필수 / 권장 / 해당없음`을 판단하여 제안한다
   - 예: "UI가 없으므로 화면설계서는 해당없음, DB를 사용하지 않으므로 DB 설계서 해당없음"
   - 예: "내부 도구이므로 사용자 메뉴얼은 권장(간략 버전), 운영서는 필수"

3. **Human 승인**: Human이 제안을 검토하고 승인/수정한다

4. **확정 기록**: `02_project_definition/deliverable_plan.md`에 기록한다
   - 실제 기준 문서 해석 우선순위와 생성 방식은 `07_delivery/export_spec.md`를 기준으로 한다

5. **데이터 수집 계획**: 확정된 산출물별로 아직 수집되지 않은 데이터를 식별하고,
   수집 방법(질문 / 코드 분석 / 외부 참조)을 계획한다

#### 목표 역산 데이터 수집 (Goal-Driven Data Acquisition)

산출물이 확정되면, AI는 이후 세션에서 다음과 같이 동작한다:

- `deliverable_plan.md`의 미수집 데이터 목록을 세션 시작 시 확인한다
- §13 Proactive Elicitation의 우선순위에 **"확정 산출물의 미수집 데이터"**를 0순위로 적용한다
- Execute 사이클 중 자연스럽게 해당 데이터를 끌어내는 질문을 한다
- 데이터가 수집되면 `deliverable_plan.md`의 수집 상태를 갱신한다

#### DEFINE 종료 전 필수 질문셋

DEFINE 단계에서 Design으로 넘어가기 전, AI는 아래 질문이 기준 문서 기준으로 답변되었는지 확인한다.

- 이 프로젝트가 실제로 해결하려는 핵심 문제와 기대 결과는 무엇인가?
- 이번 범위에서 명시적으로 하지 않을 것(비목표)은 무엇인가?
- 지금 시점의 Must 우선순위는 무엇인가?
- 무엇이 되면 "완료" 또는 "수락 가능"으로 볼 것인가?
- 현재 알려진 핵심 리스크, 제약, 외부 의존성은 무엇인가?
- 필수 산출물 계획과 미수집 데이터는 정리되었는가?

#### DEFINE 종료 질문 운영 규칙

- 같은 답을 새 문단으로 반복하지 않고, `requirement_spec.md`, `functional_spec.md`, `user_story_registry.md`, `risk_register.md`, `deliverable_plan.md`, `project_state.md` 등 관련 기준 문서에 반영된 상태를 기준으로 본다.
- Gate 1에서는 위 질문셋의 답 또는 열린 질문이 최소한 가시화되어 있어야 한다.
- Gate 2에서는 Must 우선순위, 수락 기준, 핵심 리스크, 필수 산출물 계획이 닫혀 있어야 하며, 남은 항목은 Human이 승인한 보류 사유와 다음 수집 계획이 `project_state.md`의 열린 질문 또는 관련 기준 문서에 기록되어 있어야 한다.
- Human이 아직 답을 모르면 무조건 차단하기보다, 어떤 질문이 비어 있고 왜 보류했는지 먼저 기록한 뒤 다음 세션 최우선 확인 항목으로 올린다.

### 1D. 세션 브리핑 및 작업 모드 판별 (Session Briefing & Mode Selection)

세션의 첫 응답은 **시작 진단 결과 제시 → (필요 시) 짧은 온보딩 → 브리핑 + 발화 매칭(또는 선택 요청)** 순서를 따른다.

- 재개 가능한 정보가 충분하면 브리핑을 첫 응답으로 출력한다.
- 프로젝트 기본 정보가 부족하면 1A의 최소 온보딩을 먼저 수행하고, 답이 정리되는 즉시 브리핑으로 이어간다.
- 즉, 브리핑은 기본값이지만 **최소 정보 확보보다 앞설 수는 없다**.

Human이 어떤 발화로 세션을 시작하든("시작하자", "인증 API 이어서 하자", "TASK-003 하자" 등),
AI는 현재 시작 경로를 먼저 판별한 뒤 브리핑 이후에 발화를 매칭한다.

#### 브리핑 구성

AI는 Session Start에서 확인된 사용 가능한 문서(`project_state.md`, 팀 프로젝트의 `team_board.md`, 존재하는 경우 `my_state.md`, 최신 세션 로그`)를 읽고 아래 형식으로 출력한다.

브리핑의 `💡 이전 이월` 항목은 `project_state.md`의 **`이월 백로그` 표(단일 SSOT)** 에서 가져온다. 이월이 여러 건이거나 트리거 대기 항목이 있으면 요약 한 줄로 줄이지 말고 **표를 그대로 브리핑에 포함**한다. 이월 트리거 감시는 AI의 책임이다 — Human이 찾아 지시하기 전에, 브리핑·작업 중 이 표를 대조해 도래한 트리거나 착수 가능한 항목을 **AI가 먼저 꺼낸다**.

**Master에게 표시:**
```
📋 프로젝트: [프로젝트명]
   Phase: [현재 Phase] | 상태: [Green/Yellow/Red]
   활성 Intent: [INT-NNN] ([제목])
   활성 Milestone: [MS-NNN] ([제목])

📌 활성 Task 현황:
   TASK-001  [제목]     [연결 MS]  [담당 역할] ([담당자])  [상태]
   TASK-002  [제목]     [연결 MS]  [담당 역할] ([담당자])  [상태]
   ...

💡 이전 이월: [이월 항목 요약]
📝 지난 세션: [날짜]

어떤 작업을 수행하시겠습니까?
```

**Member에게 표시:**
```
📋 프로젝트: [프로젝트명]
   Phase: [현재 Phase] | 상태: [Green/Yellow/Red]
   활성 Intent: [INT-NNN] ([제목])
   활성 Milestone: [MS-NNN] ([제목])

📌 내 담당 Task:
   TASK-003  [제목]     [연결 MS]  [상태] ([진행 상세])
   TASK-004  [제목]     [연결 MS]  [상태]

📌 전체 현황: [INT-NNN] / [MS-NNN] 진행률 [N]% ([완료/전체] Task)

💡 이전 이월: [이월 항목 요약]
📝 지난 세션: [날짜]

어떤 작업을 수행하시겠습니까?
```

#### 차이: Master vs Member

| | Master | Member |
|---|---|---|
| **Task 목록** | 전체 Task + 연결 Milestone + 배정 현황 + 미배정 Task | 내 Task 우선, 연결 Milestone과 상태를 함께 표시 |
| **프로젝트 공통 작업** | 직접 가능 | AI가 할당 Task에서 매칭 시도 → 실패 시 안내 |
| **미배정 Task** | 보임 (배정 가능) | 보이지만 선택 시 안내 |

#### 발화 매칭 규칙

| Human의 발화 | AI 동작 |
|---|---|
| 아무 말 + "하자/시작" (작업 미특정) | 브리핑 → "어떤 작업을 수행하시겠습니까?" |
| 특정 작업 언급 + "하자" | 브리핑 → 매칭 → "이 Task 맞습니까?" |
| TASK-ID 직접 명시 | 브리핑 → 즉시 확인 → 진행 |
| 매칭 불가 내용 | 브리핑 → "해당 Task 없음, 신규 Task로 등록할까요?" |
| 번호만 ("3번") | 브리핑 → Task 목록에서 매칭 → 확인 후 진행 |

#### 작업 모드 판별

```
Human 응답 수신
    ↓
TASK-ID 명시됨?
  ├→ Yes: 개인 Task 모드 (Master/Member 공통)
  │   → my_state.md에 세션 Intent 기록, 해당 Task와 연결된 Milestone 컨텍스트 로드
  └→ No:
      ├→ Master인가?
      │   ├→ Yes: 프로젝트 공통 모드
      │   └→ No (Member):
      │       → 할당된 Task에서 매칭 시도
      │       → 매칭 성공: 확인 후 개인 Task 모드
      │       → 매칭 실패: "해당 Task가 없습니다.
      │         배정된 Task로 시작하시겠습니까,
      │         아니면 Master에게 Task 할당을 요청하시겠습니까?"
```

#### 1인 프로젝트에서의 동작

1인 프로젝트에서는 브리핑이 단순화된다:
- `team_board.md`가 없으므로 `project_state.md`의 활성 Intent, 활성 Milestone, 활성 Task 목록만 표시
- 모드 판별 없이 바로 작업 진입
- 기존 흐름과 거의 동일하게 작동

### 2. 세션 진행 중 (Session In-Progress)

- Plan → Approve → Execute 사이클 반복
- 주요 결정은 즉시 기록
- 불확실한 사항은 명시적으로 질문
- 구현 중 설계 변경이 필요하면, 코드보다 설계 문서(`03_design_artifacts/`)를 먼저 수정하고 Human 확인 후 구현한다. 문서-코드 일관성은 AI가 유지한다

### 3. 세션 중단 (Session Pause)

- 현재 작업 상태를 TODO 또는 문서에 기록
- 미완료 항목 명시
- 다음 세션에서 이어갈 컨텍스트 요약
- `project_state.md`에 재개 시작점과 열린 질문 반영
- **세션 로그에 중단 시점 상태 기록**

### 4. 세션 종료 (Session End)

- [ ] 완료된 작업 요약
- [ ] 변경된 파일 목록
- [ ] 미결 사항 / 다음 작업 정리
- [ ] **최초 세션 최소 입력 확인** — 최초 세션이거나 아직 온보딩 미완료 상태라면 아래 최소 입력이 채워졌는지 확인하고, 누락 시 종료 전에 한 번 더 재질문한다
  - 프로젝트명과 한 줄 목표
  - 그린필드 / 브라운필드 여부
  - 현재 실제 단계 또는 이번 세션 시작 단계
  - 이번 세션의 최우선 목표
  - 현재 막힌 지점, 의사결정 필요 항목, 특별 제약
  - 필요 시 대화 언어 / 작업 문서 언어 / 공식 산출물 문서 언어
- [ ] `project_state.md` 동기화 (완료 서사 최근 3세션 초과분은 `state_archive.md`로 하베스트 — R1)
- [ ] `project_state.md`의 `이월 백로그` 표 동기화 — 해소분 내리고 신규 이월/트리거 올림
- [ ] 개인 `my_state.md` 갱신 — 다음 시작점, 관련 Milestone, 담당 작업 상태, 이월 항목, 참조 세션 로그 (완료 서사 초과분 하베스트 — R1)
- [ ] `team_board.md` 갱신 — 내 Task 상태 반영 (팀 프로젝트 시)
- [ ] **커밋 안내** — 변경된 `.cowork/` 파일이 있으면 커밋을 안내한다:
  - `.cowork/` 문서: `docs(cowork): <변경 요약>`
  - 소스코드: `feat/fix/refactor: <변경 요약>` (별도 커밋)
  - 팀 프로젝트: push 전 pull 먼저 수행 권장
- [ ] **세션 로그 자동 마무리** (별도 지시 불필요)

#### 최초 세션 종료 전 누락 처리

- Human이 바로 답할 수 있으면 종료 전에 짧게 재질문하고 `project_state.md`와 관련 기준 문서에 반영한다.
- 답이 길어지거나 Human이 비동기 정리를 원하면 `.cowork/06_evolution/imported_context/human_onboarding_brief.md` 같은 보조 입력 파일 작성을 제안할 수 있다.
- Human이 의도적으로 보류하면, 누락 항목과 보류 사유를 최신 세션 로그와 `project_state.md`의 열린 질문에 남기고 다음 세션 최우선 확인 항목으로 올린다.
- 이 규칙은 정식 Gate 0가 아니라 세션 마감 안정성을 위한 운영 규칙이다.

---

## 자동 기록 규칙

AI는 다음 행동을 **별도 허락 없이 자동으로** 수행한다:

### 1. 세션 로그 및 상태 인덱스 관리

- **세션 시작 시**: `.cowork/members/<이름>/workspace/session_logs/session_YYYY-MM-DD_NNN.md` 파일을 생성한다
  - 파일명의 `NNN`은 당일 세션 순번 (001, 002, ...)
  - 이전 세션 로그가 없으면 001부터 시작
- **세션 시작 시 (1회)**: 프로젝트의 `.gitignore`에 세션 로그 제외 규칙이 없으면 자동 추가한다

  ```gitignore
  # Member personal session logs
  .cowork/members/*/workspace/session_logs/*.md
  !.cowork/members/*/workspace/session_logs/.gitkeep

  # Upgrade staging area
  .cowork/.upgrade/
  ```

  - 이미 존재하면 중복 추가하지 않는다
- **세션 진행 중**: 아래 이벤트 발생 시 세션 로그에 즉시 추가 기록한다
  - 주요 결정 사항 (기술 선택, 설계 방향 등)
  - 파일 생성/수정/삭제
  - Human의 승인/거부 내용
  - migration note, rollout memo, integration memo, 임시 진단 메모 같은 경계형 작업 메모
- **세션 종료 시**: Human이 "마무리", "끝", "오늘 여기까지" 등을 선언하면
  - 완료 작업 요약
  - 미완료/이월 항목 정리
  - 다음 세션 컨텍스트 작성
  - 세션 로그 파일 저장

#### 임시 작업 메모 관리 (Temporary Working Notes)

- 구현 중 생기는 경계형 메모는 기본적으로 **최신 세션 로그에 먼저 기록**한다.
- 기본 대상 예시는 migration note, rollout memo, integration memo, 임시 진단 메모다.
- 이 메모들은 기본적으로 공유 기준 문서가 아니다. 필요한 사실이 확정되면 관련 기준 본문 / 목록 문서 / delivery 문서로 추출 반영한다.
- 별도 `temporary_notes.md` 같은 임시 문서는 기본값으로 만들지 않는다. 같은 종류의 메모가 여러 세션에 걸쳐 반복되거나, Human이 구조 분리를 승인할 때만 별도 문서를 검토한다.

#### 공유 상태 인덱스 관리 (`project_state.md`)

- `.cowork/06_evolution/project_state.md`는 세션 로그를 대체하지 않는 **공유 상태 인덱스**다
- AI는 세션 시작 시 최신 세션 로그보다 먼저 이 문서를 읽고 현재 Phase, 활성 Intent, 활성 Milestone, 다음 시작점을 파악한다
- 이 문서는 **요약 우선 문서**다. 긴 배경 설명이나 대화 전문을 복사하지 않고, 핵심 상태와 재개 시작점만 남긴다
- 서술형 섹션(`한 줄 상태`, `현재 작업 스트림`, `다음 시작점`, `AI 핸드오프 메모`)은 보통 3~5줄 이내로 유지하고, 표 섹션은 활성/긴급 항목 위주로 남긴다
- **트리거형 다이어트 규칙 (R1 — 완료 서사 하베스트).** "길어지면 압축"은 트리거가 없어 완료 서사가 세션마다 append-only로 누적되기 쉽다. 이를 막기 위해:
  - `다음 시작점`·`AI 핸드오프 메모`의 서술형 완료 서사(✅완료·핸드오프 블록)는 **최근 N세션(기본 3)만 본문에 유지**한다.
  - `마무리` 선언 시, 그보다 오래된 완료 서사는 `06_evolution/state_archive.md`의 `#NNN 이관분` 섹션으로 **원문 이관(append-only)** 하고, 본문에는 `[state_archive.md](state_archive.md) #NNN 이관분` 형태의 1줄 포인터만 남긴다.
  - `my_state.md`의 `오늘의 세션 Intent`·`최근 결정/작업 메모`도 같은 규칙으로 `state_archive.md`의 `my_state.md 이관분`으로 하베스트한다.
  - 이관은 **무손실**이다 — 요약/삭제가 아니라 원문 이동이다. 정제는 본문 쪽에서만 한다.
  - N은 프로젝트가 조정할 수 있으나 기본값은 3이다.
- **트리거형 다이어트 규칙 (R2 — 표 셀 비대 분리).** `활성 Task 요약` 등 표의 특정 셀이 여러 세션 서사로 비대해지면, 상세는 `tasks/TASK-*.md`(진행 중) 또는 세션 로그 포인터(Done + 기간 경과·현재 작업 맥락 영향 소멸)로 분리하고 셀에는 **재개 핵심만** 남긴다.
  - 단, **현재 작업에 맥락이 영향을 주는 항목은 셀이 커도 그대로 둔다**(churn 금지). 정리 게이트 = "현재 작업 맥락에 더 이상 영향이 없는가".
- 아래 상황이 발생하면 `project_state.md`를 함께 갱신한다
  - 언어 설정(대화/작업 문서/공식 산출물) 변경
  - 현재 Phase 변경
  - 활성 Intent / Milestone / User Story / Task 상태 변경
  - Human 확인 필요 사항 또는 주요 리스크 변경
  - 다음 세션 시작점이 바뀐 경우
- 세션 종료 시에는 최신 세션 로그와 `project_state.md`를 동기화한다
- 세부 내용 충돌 시 우선순위는 **승인된 기준 문서/ADR → 최신 세션 로그 → project_state.md** 순으로 판단한다

#### 가져온 컨텍스트 관리 (`imported_context/`)

- 외부에서 복사해온 대화, 회의 메모, raw transcript는 `.cowork/06_evolution/imported_context/`에 보관한다.
- imported context는 **보조 근거 저장소**이며 기본 컨텍스트 로딩 대상이 아니다.
- imported context의 내용을 기준 문서로 사용하려면, 필요한 사실을 `project_state.md`, 목록 문서, 기준 본문, 상세 문서로 먼저 추출해야 한다.
- imported context만을 근거로 확정 사실을 선언하지 않는다.

#### 개인 상태 인덱스 관리 (`my_state.md`)

- `members/<이름>/workspace/my_state.md`는 세션 로그를 대체하지 않는 **개인 상태 인덱스**다
- AI는 아래 상황이 발생하면 해당 멤버의 `my_state.md`를 함께 갱신한다
  - 담당 작업(Task/블록)의 상태 변경 (착수, 완료, 블로커 발생)
  - 관련 Milestone 변경 또는 담당 Task의 상위 Milestone 변경
  - ADR 생성 또는 주요 결정 발생 → 최근 결정 메모에 추가
  - Phase 전환 또는 다음 시작점 변경
  - 세션 종료 시 → 이월 항목, 참조 세션 로그, 다음 시작점 갱신
- `my_state.md`의 참조 세션 로그 필드는 항상 **가장 최근 세션 로그 파일명**을 가리켜야 한다
- 1인 프로젝트에서도 `my_state.md`는 갱신 대상이다 — `project_state.md`와 핵심 필드(활성 Milestone, 다음 시작점, 작업 상태)가 일치해야 한다
- 1인 프로젝트에서 `my_state.md`를 처음 만들 때는 아래 기본값으로 시작한다
  - `활성 Milestone`: `project_state.md`의 현재 활성 Milestone을 우선 복사하고, 없으면 `없음`
  - `현재 담당 작업`: 아직 Task가 없으면 `없음`
  - `다음 시작점`: `project_state.md`의 현재 다음 시작점을 요약 복사
  - `참조 세션 로그`: 최신 `members/<이름>/workspace/session_logs/session_YYYY-MM-DD_NNN.md`

#### 개인 세션 목표 관리 (Session Intent)

- 세션 시작 시 Human이 작업을 선택하면, AI는 해당 멤버의 `my_state.md`의 "오늘의 세션 Intent" 테이블에 기록한다
  - 세션 ID, 날짜, 세션 Intent 설명, 대상 Milestone ID(또는 "공통"), 대상 Task ID(또는 "프로젝트 공통")
- 1인 프로젝트에서 아직 개별 Task가 없으면 대상 Task는 `프로젝트 공통`, 대상 Milestone은 현재 활성 Milestone 또는 `공통`으로 기록한다
- 세션 종료 시 결과 컬럼을 갱신한다 (완료 / 이월 / 중단)
- Session Intent는 Project Intent(`INT-NNN`)와 별개다 — Project Intent는 프로젝트 방향, Session Intent는 개인의 오늘 작업 목표

#### 컨텍스트 윈도우 보호 (Context Window Guard)

AI는 컨텍스트 윈도우가 포화에 가까워 **맥락 유지 능력이 저하**되는 징후를 감지하면, 즉시 Human에게 세션 전환을 권고한다.

##### 감지 징후

- 세션 초반에 읽은 파일 내용이나 합의 사항을 정확히 재현하지 못함
- 동일한 정보를 반복 요청하거나 이전 대화와 일관성이 떨어짐
- 대화가 매우 길어져 새로운 맥락을 수용할 여유가 부족하다고 판단됨

##### AI 동작

1. Human에게 경고한다:
   ```
   ⚠️ 컨텍스트 윈도우가 포화에 가까워 맥락 손실 위험이 있습니다.
   세션을 정리하고 새 세션으로 이어가는 것을 권장합니다.
   ```
2. 현재 진행 중인 작업 상태를 **즉시 요약**한다 (완료된 것, 진행 중인 것, 남은 것)
3. Human이 동의하면 정상 세션 종료 절차(Enrichment Check)를 수행한다
4. 세션 로그의 "다음 세션 컨텍스트" 섹션에 **이어갈 시작점**을 명확히 기록한다
5. Human에게 새 세션 시작 방법을 안내한다:
   ```
   새 세션을 열고 아래와 같이 시작하세요:
   "이전 세션 이어서 하자" 또는 "TASK-NNN 이어서 하자"
   ```

##### 주의사항 (컨텍스트 윈도우)

- 이 판단은 AI의 자체 추정이다 — 정밀한 수치가 아니라 **맥락 유지 품질**을 기준으로 한다
- Human이 "계속 진행하자"고 하면 경고를 기록한 뒤 계속할 수 있으나, 맥락 손실 위험은 Human이 인지해야 한다
- 강제 종료가 아니라 **권고**이다

#### 기록 원칙

- 간결하게 — 대화 전문이 아닌 **핵심 요약**만 기록
- 즉시 — 나중에 몰아쓰지 않고 **발생 시점에** 기록
- 추적 가능하게 — 결정에는 **근거**, 파일에는 **변경 유형** 명시

### 2. 변경 파일 자동 추적

- 파일을 생성/수정/삭제할 때마다 세션 로그의 "생성/수정된 파일" 섹션에 즉시 기록한다
- 파일 경로, 변경 유형(생성/수정/삭제), 간단한 설명을 포함한다
- 세션 종료 시 별도로 모아쓰지 않고, 발생 시점에 누적 기록한다

### 3. ADR 자동 생성

- 대화 중 설계 결정이 발생하면 ("~로 가자", "Option A 선택" 등) 먼저 ADR 승격 필요성을 확인한다
- `제약`, `비용`, `확장성`, `보안`, `운영 영향` 중 하나라도 장기적이고 되돌리기 어렵거나 두 축 이상이 함께 얽히면 ADR 파일을 생성한다
- 위 기준에 못 미치는 소규모 결정은 ADR 대신 관련 기준 본문 또는 세션 로그에 기록한다
- 파일명: `.cowork/03_design_artifacts/adrs/ADR-NNN_[결정_요약].md`
- 기존 ADR 파일을 스캔하여 다음 번호를 자동 채번한다
- ADR 양식(`03_design_artifacts/templates/adr_template.md`)을 기반으로 핵심 내용을 채운다

### 4. ID 자동 채번

- Intent(`INT-NNN`), Milestone(`MS-NNN`), User Story(`US-NNN`), ADR(`ADR-NNN`), Task(`TASK-NNN`) 등
  산출물 생성 시 기존 파일/문서를 스캔하여 다음 순번을 자동 부여한다
- 수동 채번 금지 — 중복/누락 방지를 위해 항상 자동 스캔 후 부여

### 5. 공통 컨텍스트 동기화 원칙

- 프로젝트 컨텍스트가 변경되면 공유 기준 문서와 진입점 파일 설명이 서로 모순되지 않게 유지한다.
- 어떤 진입점까지 함께 갱신할지, 도구별 예시를 어디에 둘지는 `tooling_environment_guide.md`를 기준으로 판단한다.
- 변경 시 세션 로그에 기록한다.

### 6. 품질 게이트 자동 체크 (Quality Gate)

- Phase 전환 요청 시("설계 넘어가자", "구현 시작하자" 등) 아래 순서로 진행한다:
  1. **Pre-Gate Harvest 먼저 실행** — §12의 Pre-Gate Harvest 규칙에 따라 현재 Phase 기준 문서를 채운다
  2. **Gate 점검** — `.cowork/05_verification/quality_gate.md` 기준으로 충족 여부를 자동 점검한다
- 미충족 항목이 있으면 목록을 제시하고 Human에게 확인을 요청한다
  - Human이 예외 승인하면 진행하고, 사유를 ADR 또는 세션 로그에 기록한다
  - Human이 보완 지시하면 해당 항목부터 작업한다

### 7. Knowledge Base / Retrospective 누적 기준

- 세션 중 발견된 기술적 인사이트, 유용한 패턴, 안티패턴은 먼저 최신 세션 로그나 관련 기준 문서에 남긴다
  - 기술적 인사이트: 새로운 발견, 라이브러리 특성, 성능 특이사항 등
  - 효과적 패턴: 반복 사용할 수 있는 좋은 접근법
  - 안티패턴: 실패한 접근, 피해야 할 방식과 교훈
- 다음 세션 재개 차단, 여러 세션 재사용 가치, gate/export/source 동기화 필요 같은 분명한 근거가 있을 때만 `.cowork/06_evolution/knowledge_base.md`에 재사용 가능한 요약으로 승격한다
- 완료된 작업, Intent, Milestone에 대한 회고와 개선 조치는 범위와 후속 액션이 분명할 때만 `retrospective.md`로 승격한다
- **프레임워크 후보 역류 (Back-Port).** 세션 중 인스턴스에서 새 운영 규칙·문서 구조·다이어트 규칙·트립와이어를 만들었고, 그것이 이 프로젝트 고유가 아니라 다른 프로젝트에도 일반적으로 유효하거나 프레임워크 1.0 기본값의 공백을 메운다면, `retrospective.md` §4 `Framework Back-Port Queue`에 `[후보]`로 등재한다. Human 승인 시 다음 마이너 버전으로 반영하고 `upgrade_manifest.md`에 등재한다. 인스턴스에만 남기면 다음 프로젝트가 같은 것을 재발견한다.
- 미확정 가설, 단순 원문 메모, 1회성 디버깅 흔적, 이미 기준 문서에 반영된 중복 내용은 세션 로그에 유지한다
- 중복 기록을 피하기 위해 기존 항목을 확인 후 승격한다
- `knowledge_base.md`는 요약 우선 문서다. 실질 항목이 15개를 넘기거나 최근 3개 세션 중 2개 이상이 같은 주제/Intent/Milestone만 반복 참조하면 주제별 통합 요약 또는 분리 검토를 시작한다
- `retrospective.md`도 요약 우선 문서다. 완료된 회고가 4개 이상 누적되거나 최근 3개 세션이 최신 1~2개 회고만 반복 참조하면 회차별 또는 범위별 분리 검토를 시작한다

### 8. UI 논의 시 레퍼런스 사이트 활용

- 화면 설계 논의가 시작되면, AI는 Human에게 유사한 레퍼런스 사이트 URL을 요청한다
- Human이 URL을 제공하면 AI가 사이트에 접속하여 레이아웃, 컬러, UX 패턴 등을 분석한다
- 분석 결과를 요약하여 제안하고, Human 승인 후 `ui_spec.md`의 레퍼런스 섹션에 기록한다
- 레퍼런스 없이 추상적 UI 논의가 진행될 경우, AI가 먼저 "유사한 사이트가 있으면 알려주세요"라고 안내한다

### 9. 멤버 프로필 자동 관리

- 최초 세션 시작 시 `.cowork/members/`에 현재 사용자 폴더가 없으면:
  - 이름을 질문하고 폴더 식별자로 사용할 표기를 확정한다
  - 팀 프로젝트면 역할, 담당 영역을 질문한다
  - 1인 프로젝트면 `권한 = Master`, `역할 = 프로젝트 오너`, `담당 영역 = 프로젝트 전반`을 기본값으로 넣고 필요 시 Human이 수정한다
  - `.cowork/members/<이름>/profile.md`를 `profile_template.md` 기반으로 자동 생성한다
  - `.cowork/members/<이름>/proposals/` 폴더를 함께 생성한다
  - `.cowork/members/<이름>/workspace/my_state.md`를 `my_state_template.md` 기반으로 자동 생성한다
  - `.cowork/members/<이름>/workspace/session_logs/.gitkeep`을 함께 생성한다 (1인/팀 공통)
- 권한은 `Member`(기본) 또는 `Master`(공유 영역 머지 권한)로 구분한다

### 10. Change Proposal 관리

- 팀원이 공유 영역(`01~07/`) 변경이 필요할 때 "제안" 키워드를 사용한다
- AI가 `proposal_template.md` 기반으로 `.cowork/members/<이름>/proposals/PROP-NNN_[요약].md`를 생성한다
- ID는 전체 members 폴더를 스캔하여 자동 채번한다
- Master 권한자의 세션 시작 시 Pending Proposal이 있으면 자동 알림한다
  - 승인: AI가 공유 영역에 변경 반영 + Proposal 상태를 Approved로 업데이트
  - 거부: 사유 기록 + Proposal 상태를 Rejected로 업데이트

### 11. 공식 산출물 자동 생성

- Human이 "릴리즈", "문서 생성", "export" 등을 선언하면 아래 순서로 진행한다:
  1. **Pre-Release Harvest** — §12의 Pre-Gate Harvest를 전체 Phase에 대해 실행하여 모든 기준 문서를 최대한 채운다
  2. **Quality Gate 5 점검** — `quality_gate.md`의 Gate 5 기준으로 릴리즈 준비 상태를 점검한다. 미충족 항목이 있으면 Human에게 경고하고 확인을 받은 후 진행한다
  3. **산출물 생성** — `deliverable_plan.md`에서 활성화된 기본 추천 14종과 승인된 확장 산출물(15+)을 `export_spec.md` 규칙에 따라 `docs/`에 생성한다
     - 직접 생성: cowork 기준 문서 → 공식 문서 형식으로 정리 (템플릿 주석 제거, 헤더 추가)
     - 합성: 여러 기준 문서를 하나의 공식 문서로 통합
     - 공식 산출물 생성 형식은 고정 템플릿 복제를 우선하지 않으며, `export_spec.md`의 불변 규칙을 지키는 범위에서 AI가 더 나은 구조로 재구성할 수 있다
- `deliverable_plan.md`에서 `해당없음`인 기본 추천 항목과 Human 미승인 확장 항목은 생성 대상에서 제외한다
- 생성된 파일 목록을 세션 로그에 기록한다
- 기준 문서가 비어 있는 항목은 "⚠️ 기준 문서 미작성: [파일명]"으로 표시하고, 해당 산출물은 빈 파일 대신 목록에만 남겨둔다

### 12. 단계별 문서 자동 축적 (Phase-Bound Progressive Enrichment)

AI는 대화 중 발생하는 정보를 **현재 Phase에 해당하는 기준 문서에 자동으로 추가**한다.
별도 요청 없이도 아래 규칙에 따라 작동한다.

#### 단계별 문서 맵 (Phase Document Map)

| Phase | 대상 기준 문서 | 수집 조건 |
|-------|-------------|----------|
| **1: DEFINE** | `02_project_definition/intent_registry.md` + `02_project_definition/intents/INT-*.md` | 온보딩 완료 직후 활성 Intent 등록 및 상세 작성 |
| | `02_project_definition/requirement_spec.md` | 기능·제약 사항이 결정될 때마다 |
| | `02_project_definition/domain_glossary.md` | 도메인 용어가 처음 사용될 때마다 |
| | `02_project_definition/functional_spec.md` | 기능 동작이 확정될 때마다 |
| | `02_project_definition/user_story_registry.md` + `02_project_definition/user_stories/US-*.md` | "~해야 한다", "~가 필요하다" 형태의 요구가 등장할 때 |
| | `02_project_definition/risk_register.md` | 리스크·우려 사항이 언급될 때마다 |
| **2: DESIGN** | `03_design_artifacts/domain_model.md` | 엔티티·관계가 정의될 때마다 |
| | `03_design_artifacts/interface_contract.md` | 모듈 간 인터페이스·계약이 결정될 때마다 |
| | `03_design_artifacts/data_model.md` | 데이터 구조·스키마가 결정될 때마다 |
| | `03_design_artifacts/adr_registry.md` + `03_design_artifacts/adrs/ADR-*.md` | 설계 결정이 승인될 때마다 |
| | `03_design_artifacts/ui_spec.md` | 화면·UI 동작이 확정될 때마다 |
| **3: BUILD** | `04_implementation/milestone_registry.md` + `04_implementation/milestones/MS-*.md` | 의미 있는 중간 완료 단위가 합의되거나 마일스톤 상세가 확정될 때마다 |
| | `04_implementation/task_registry.md` + `04_implementation/tasks/TASK-*.md` | Execute 사이클의 태스크가 승인되거나 재개 가능한 상세 기록이 필요할 때마다 |
| **4: VERIFY** | `05_verification/test_strategy.md` | 테스트 접근 방식이 결정될 때마다 |
| | `05_verification/test_case.md` | 구현 완료된 기능의 검증 조건이 논의될 때마다 |
| | `05_verification/verification_evidence.md` | 테스트 결과, 리뷰 결과, NFR 측정, release readiness 근거를 게이트 판정용으로 요약할 때마다 |
| **5: EVOLVE** | `06_evolution/retrospective.md` | 회고, 개선 포인트, 프로세스 보완점이 정리될 때마다 |
| | `06_evolution/knowledge_base.md` | 재사용 가능한 인사이트, 패턴, 안티패턴이 안정화될 때마다 |
| **6: DELIVER** | `07_delivery/operation_guide.md` | 배포·운영 절차가 언급될 때마다 |
| | `07_delivery/user_manual.md` | 사용 방법·절차가 정의될 때마다 |
| | `07_delivery/release_note.md` | 외부 공유 가능한 변경 요약과 사용자 영향이 정리될 때마다 |

#### 수동 트리거 없는 자동 추출 (Passive Extraction)

- Execute 사이클 완료 후, 위 수집 조건에 해당하는 내용이 있으면 즉시 해당 기준 문서에 추가한다
- 대화 전문을 옮기지 않고 **결정된 사실만 구조화**하여 기록한다
- 목록 문서 + 상세 문서 구조인 경우, 목록 정보는 목록 문서에, 상세 내용은 상세 문서에 분리해 기록한다
- 문서 업데이트 시 `✅ [파일명] 업데이트 — [변경 내용 한 줄 요약]`으로 Human에게 통보한다
- 아직 확정되지 않은 내용, 모호한 표현은 추가하지 않는다
- 작업상 필요한 가정은 `가정` 섹션에, 확인이 필요한 내용은 `미확정 사항` 섹션에, 근거가 되는 문맥은 `근거/출처` 섹션에 기록할 수 있다

#### 단계 전환 전 일괄 보충 (Pre-Gate Harvest)

`~단계로 넘어가자` 발생 시 Quality Gate 점검 이전에:

1. Phase Document Map 기준으로 현재 Phase 기준 문서의 빈 항목을 스캔한다
2. 빈 항목이 있으면 세션 로그·ADR에서 해당 내용을 역추출하여 채운다
3. `📋 Pre-Gate Harvest 완료: [채워진 항목 목록]`으로 보고 후 Quality Gate를 진행한다

#### 세션 종료 시 미완성 점검 (Session End Enrichment Check)

`마무리` 선언 시 세션 종료 처리 이전에:

- 현재 Phase 기준 문서 중 여전히 비어 있는 항목을 스캔한다
- 비어 있는 항목이 있으면 이월 항목에 포함시키고, 즉시 채울지 Human에게 물어본다
- `project_state.md`의 다음 시작점, Human 확인 필요 사항, 주요 리스크를 최신 상태로 동기화한다.
- 해당 멤버의 `my_state.md`의 담당 작업, 다음 시작점, 이월 항목, 참조 세션 로그를 최신 상태로 동기화한다.
- **완료 서사 하베스트 (R1)** — `project_state.md`·`my_state.md`의 완료 서사가 최근 N세션(기본 3)을 초과하면, 초과분을 `06_evolution/state_archive.md`로 원문 이관하고 본문에는 1줄 포인터만 남긴다(§공유 상태 인덱스 관리 R1).
- **이월 백로그 표 동기화** — `project_state.md`의 `이월 백로그` 표에서 이번 세션에 해소된 항목을 내리고, 새로 생긴 이월/트리거를 올린다(§1D 브리핑의 단일 SSOT).

### 13. 능동적 질문 유도 (Proactive Elicitation)

AI는 Human이 먼저 묻지 않아도 **현재 Phase에서 아직 채워지지 않은 기준 문서 항목**을 파악하고,
대화 흐름 속에서 자연스럽게 관련 정보를 끌어내는 질문을 한다.

#### 작동 조건

- 현재 Phase의 Phase Document Map(§12)에서 비어 있는 항목이 있을 때
- Execute 사이클 완료 직후, 또는 Human이 다음 작업을 묻는 시점에 개입한다
- 세션당 **최대 2~3개** 질문으로 제한한다 — Human이 질문 폭탄을 받는 느낌을 주지 않는다

#### 질문 우선순위

현재 Phase의 기준 문서 중 아래 순서로 우선적으로 채운다:

| 우선순위 | 기준 |
|---------|------|
| 0순위 | `deliverable_plan.md`에서 **필수인데 미수집**인 데이터 (Goal-Driven Data Acquisition) |
| 1순위 | Quality Gate 통과에 **필수**인 항목 (Gate 미충족 원인이 되는 것) |
| 2순위 | 릴리즈 산출물 중 **합성 불가** 항목 (다른 기준 문서에서 역추출이 불가능한 것) |
| 3순위 | 현재 작업 맥락과 **직접 관련된** 항목 |

#### 질문 방식

- 독립 질문 세션을 열지 않는다 — **현재 하던 대화의 흐름 속**에 자연스럽게 삽입한다
- 예시:
  - Execute 완료 후: "방금 구현한 것 기준으로, 외부 시스템과의 인터페이스 중 아직 확정 안 된 게 있나요? `interface_contract.md`에 추가해두면 좋을 것 같아서요."
  - 다음 작업 논의 중: "진행하기 전에 한 가지만 — 이 기능의 수락 기준이 아직 없는데, 어떻게 될 때 '완료'로 볼 수 있을까요?"
- Human이 "나중에" / "모르겠어" / "넘어가" 라고 하면 **즉시 중단**하고 이월 항목으로 등록한다

#### 대안 제시

- AI는 설계 결정이나 기술 선택이 발생하는 시점에, 더 적합한 대안이 있다고 판단되면 근거와 함께 제시한다
- 필요 시 공식 문서나 레퍼런스를 검색하여 최신 정보를 확인할 수 있다
- Human이 채택 여부를 결정한다

### 14. 기술스택 자동 관리

#### 트리거

- 대화 중 기술 선택이 발생할 때 ("TypeScript로 가자", "gRPC 쓰자" 등)
- Brownfield 프로젝트의 Reverse Discovery에서 기존 스택이 식별될 때

#### AI 자동 동작 (기술스택)

1. **ADR 자동 생성**: 기술 선택/변경 시 `adrs/ADR-NNN_tech_[영역]_[기술명].md` 생성
   - 여러 기술을 한 번에 결정하면 하나의 ADR에 묶을 수 있다
   - Context, Decision Drivers, Considered Options, Decision, Consequences 포함

2. **기술스택 등록부 갱신**: `03_design_artifacts/tech_stack.md`에 확정 기술 등록
   - 선정 ADR 번호 연결
   - 검토했으나 미채택한 기술도 기록

3. **Coding Convention 동적 구성**: 기술스택 확정 시점에
   - `coding_convention.md`에 확정된 기술에 해당하는 컨벤션만 생성/유지한다
   - 미사용 언어/프레임워크 섹션은 제거한다
   - 컨벤션에 없는 기술이 선정되면 AI가 해당 기술의 주요 컨벤션을 모범 사례 기반으로 제안하여 추가한다

4. **진입점 동기화 검토**: 기술스택 확정/변경 시 4대 진입점 파일과 `tooling_environment_guide.md`의 동기화 필요 여부를 함께 점검한다

### 15. 팀 상태 동기화 (Team State Sync)

팀 프로젝트에서 개인↔공통 상태를 동기화하는 규칙이다.

#### 상향 동기화 규칙

| 이벤트 | 개인 `my_state.md` | `team_board.md` | `project_state.md` |
|--------|-------|-------|-------|
| Task 착수 | 상태 → In Progress | 상태 갱신 | - |
| Task 완료 | 상태 → Done, 다음 시작점 갱신 | 상태 → Done | 관련 항목 갱신 |
| 블로커 발생 | 블로커 기록 | 비고에 기록 | Human 확인 필요 사항에 등록 |
| ADR 생성 | 최근 결정 메모에 기록 | - | 최근 승인 결정에 등록 |
| Phase 전환 | - | - | Phase 변경 |

#### 자동화 트리거

| 트리거 | AI 자동 동작 |
|--------|------------|
| 기술스택 확정 + 사전배분 모드 | 기술 영역별 역할 슬롯 자동 제안 |
| 기능 분해 완료 + 사전배분 모드 | 기능 영역별 역할 슬롯 보완 제안 |
| 새 멤버 프로필 생성 | 미배정 역할 목록 제시 + 매칭 제안 |
| 역할 매칭 승인 | Task 담당자 일괄 갱신 + my_state.md 자동 생성 |
| 역할 분할/병합 | Task 재배분 제안 + team_board 갱신 |
| 확정팀 업무량 분석 | 추가 역할 슬롯 필요 시 가상 역할 제안 |

### 16. 프레임워크 업그레이드 (Framework Upgrade)

`.cowork` 프레임워크 업그레이드는 도구와 네트워크 제약을 많이 타므로, 세션 프로토콜에서는 발동 조건과 불변 원칙만 정의한다.

#### 트리거

- Human이 `업그레이드` 키워드를 선언한다.

#### 기준 문서

- 실행 경로와 환경별 분기: `01_cowork_protocol/tooling_environment_guide.md`
- 버전 체인과 파일 분류: `.cowork/upgrade_manifest.md`

#### 공통 원칙

1. 현재 설치 버전과 대상 버전은 항상 `upgrade_manifest.md`의 `Version` / `From` 체인으로 검증한다.
2. `MERGE`가 필요한 항목과 판단이 어려운 충돌은 Human 승인 후 적용한다.
3. 프로젝트가 채운 데이터는 보존하고, 프레임워크 구조와 규칙만 갱신한다.
4. 네트워크가 불가하면 `.cowork/.upgrade/archives/v{버전}/`에 배치한 아카이브로 대체한다.
5. 업그레이드 계획과 결과는 `.cowork/.upgrade/`와 세션 로그에 남긴다.

---

## Intent 변경 관리

### 변경 유형 분류

Intent의 내용이 변경되어야 할 때, AI는 아래 5가지 유형 중 어디에 해당하는지 먼저 판별한다.
**"목적이 바뀌었는가, 표현이 틀렸는가?"** 를 핵심 판단 기준으로 삼는다.

| 유형 | 판단 기준 | 대응 | ID 처리 |
|------|----------|------|---------|
| **Correction** (오류 수정) | 목적은 동일하나 표현/범위가 잘못됨 | 기존 Intent 직접 수정 | 같은 ID 유지 |
| **Refinement** (정제) | 목적은 동일하나 모호하거나 넓어서 구체화 필요 | 기존 Intent 직접 수정, 비목표 강화 | 같은 ID 유지 |
| **Pivot** (전환) | 근본적인 목표/방향이 변경됨 | 기존 `Superseded`로 닫고 새 Intent 생성 | 새 ID, `Supersedes: INT-XXX` 명시 |
| **Addition** (추가) | 기존 Intent와 무관한 새로운 목적 등장 | 독립 Intent 생성 | 새 ID, 관계 없음 |
| **Split** (분할) | 하나의 Intent가 너무 커서 분리 필요 | 기존 `Split`으로 닫고 자식 Intent 생성 | 새 ID들, `Parent: INT-XXX` 명시 |

### 변경 시 자동 동작

1. **유형 판별**: AI는 Human의 의도 변경 요청을 받으면 위 5가지 중 해당 유형을 먼저 제시하고 확인받는다
2. **문서 갱신**: 관련 Intent 목록 문서, 상세 Intent 문서, 세션 로그에 변경 유형(`Correction`, `Refinement`, `Pivot`, `Split`)과 이유를 기록한다
3. **하위 산출물 영향도 확인**: Requirement, User Story, Task 등 해당 Intent를 참조하는 산출물을 스캔하고 영향 범위를 보고한다
4. **Pivot/Split 시**: 기존 Intent 상태를 변경하고, 새 Intent 문서를 생성하며, `project_state.md`의 활성 Intent를 갱신한다. 기존 Milestone이 더 이상 유효하지 않으면 활성 Milestone도 함께 재정렬한다
5. **ADR 생성**: Pivot, Split의 경우 의사결정 근거를 ADR로 자동 기록한다

### Intent 상태 전이

```text
Draft → Approved → Closed
  │         │
  │         ├→ Superseded  (Pivot으로 새 Intent에 대체됨)
  │         └→ Split       (분할되어 자식 Intent로 전환됨)
  │
  └→ Superseded / Split    (승인 전에도 전환 가능)
```

---

## 키워드 안내

대화 중 아래 키워드가 포함되면 AI가 자동 동작을 수행한다.
자연어 대화 속에서 사용하면 되며, 별도 접두사는 불필요하다.

| 키워드 | 자동 동작 |
| --- | --- |
| 마무리 / 끝 / 오늘 여기까지 | Enrichment Check → 세션 종료 처리 (요약, 이월 항목, 다음 컨텍스트) |
| ~로 가자 / ~로 결정 | ADR 자동 생성 |
| 제안 | Change Proposal 생성 (개인 proposals 폴더) |
| ~단계로 넘어가자 | Pre-Gate Harvest → Quality Gate 자동 점검 (Phase 전환) |
| 릴리즈 / 문서 생성 / export | Pre-Release Harvest → Gate 5 점검 → 공식 산출물 14종 생성 (`docs/`) |
| 업그레이드 | `tooling_environment_guide.md` + `upgrade_manifest.md` 기준으로 프레임워크 갱신 (§16) |

> 이 목록은 매 세션 시작 시 간략히 공지된다.

---

## 컨텍스트 핸드오프 체크리스트 (Context Handoff Checklist)

새 세션 시작 시 AI가 자동으로 확인할 항목:

1. `project_state.md`에서 현재 Phase, 활성 Intent, 활성 Milestone, 다음 시작점 확인
2. `project_state.md`에서 프로젝트 유형(신규/기존), 팀 구성 모드, 대화 언어, 작업 문서 언어, 공식 산출물 문서 언어 확인
3. 현재 사용자의 `members/<이름>/` workspace 존재 여부 확인
4. workspace가 없으면 `profile.md`, `my_state.md`, `session_logs/` 구조를 먼저 생성
5. workspace가 있으면 `my_state.md`에서 개인 작업 맥락 복원
6. workspace가 있으면 최신 세션 로그에서 "다음 세션 컨텍스트" 섹션 읽기
7. 팀 프로젝트면 `members/team_board.md`에서 팀 역할·Task 할당 현황 확인
8. `deliverable_plan.md`에서 미수집 데이터와 필수 산출물 상태 확인
9. `project_state.md`의 컨텍스트 로딩 가이드에 따라 필요한 목록 문서/기준 본문 추가 로드
10. 정보가 부족하거나 모순되면 1A 최소 온보딩 수행
11. 이후 세션 브리핑 출력 → Human의 작업 선택 수신 → 모드 판별 (§1D)

---

## 세션 로그 저장 구조

```text
.cowork/
├── 06_evolution/
│   ├── project_state.md             ← 공유 상태 인덱스 (VCS 추적)
│   ├── state_archive.md             ← 하베스트된 완료 서사 아카이브 (append-only, VCS 추적, 기본 로딩 제외)
│   ├── imported_context/            ← 복사해온 대화 / raw transcript 보관
│   ├── templates/
│   │   └── session_log_template.md  ← 세션 로그 양식 (참조용)
│   ├── retrospective.md
│   └── knowledge_base.md
└── members/
    └── <이름>/
        └── workspace/
            └── session_logs/        ← 실제 세션별 자동 생성 로그
                ├── session_2026-02-26_001.md
                ├── session_2026-02-26_002.md
                ├── session_2026-02-27_001.md
                └── ...
```
