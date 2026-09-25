# 협업 컨텍스트 엔지니어링 (Cowork Context Engineering)

> AI-Human 협업 개발 프레임워크 빠른 시작

---

## 무엇을 해결하나

AI 코딩 도구는 세션이 끊기면 맥락을 잃기 쉽다.
이 프레임워크는 `.cowork/` 문서 구조를 통해 대화에서 나온 결정과 상태를 누적하고,
다음 세션에서 AI가 다시 읽어 복원할 수 있게 만든다.

핵심 아이디어는 단순하다.

> **산출물이 곧 AI의 기억이다.**

---

## 이 프레임워크가 하는 일

- 작업을 시작할 때 AI가 `project_state.md`에서 현재 상태를 확인하고 필요한 문서만 추가로 읽는다. 작업이 지정되지 않았을 때 브리핑한다.
- 작업 중 결정은 목록 문서, 기준 본문, 상세 문서에 맞는 위치로 누적한다.
- 현재 Phase에 맞는 문서만 우선 로드해 컨텍스트를 효율적으로 사용한다.
- 공식 산출물 생성 요청 시 `deliverable_plan.md`에서 승인된 활성 항목을 `docs/`에 생성한다.

---

## 빠른 시작

1. `.cowork/`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md`를 프로젝트 루트에 복사한다.
2. 사용하는 AI 도구에서 해당 진입점 파일을 읽게 한다.
3. 원하는 작업을 바로 요청한다. 작업을 지정하지 않으면 AI가 현재 상태를 브리핑한다.

---

## 진입 프롬프트

| 도구 | 시작 방법 |
|------|-----------|
| OpenAI Codex | `AGENTS.md를 읽고 project_state.md의 현재 상태에서 이번 작업을 이어서 해줘.` |
| Cursor | `AGENTS.md를 읽고 project_state.md의 현재 상태에서 이번 작업을 이어서 해줘.` |
| Claude Code | `claude "CLAUDE.md를 읽고 오늘 세션을 시작해줘"` |
| Gemini Code Assist | `GEMINI.md를 읽고 project_state.md의 현재 상태에서 이번 작업을 이어서 해줘.` |
| GitHub Copilot | Copilot Chat을 열고 대화를 시작하면 `.github/copilot-instructions.md`가 자동으로 로드된다. |

---

## 세션에서 기대하는 흐름

1. AI가 `project_state.md`에서 현재 상태를 확인하고 요청과 관련된 문서를 읽는다.
2. 요청한 작업이 명확하면 진행한다. 작업이 지정되지 않았으면 활성 작업을 브리핑하고 선택을 받는다.
3. H/J 결정은 Human 승인 후 실행하고, A 범위의 작업은 수행 후 결과를 보고한다.

세부 절차와 자동화 규칙은 [session_protocol.md](01_cowork_protocol/session_protocol.md)를, 도구·환경 의존 운영은 [tooling_environment_guide.md](01_cowork_protocol/tooling_environment_guide.md)를 기준으로 본다.

---

## `.cowork/` 구조 한눈에 보기

| 경로 | 역할 |
|------|------|
| `01_cowork_protocol/` | 협업 규칙, 권한, 세션 프로토콜 |
| `02_project_definition/` | Intent, 요구사항, 기능 정의 |
| `03_design_artifacts/` | 설계 산출물과 ADR |
| `04_implementation/` | Milestone, Task, 구현 규약 |
| `05_verification/` | 테스트와 gate 판정 |
| `06_evolution/` | 공유 상태, 회고, 지식 축적 |
| `07_delivery/` | 공식 산출물 생성 규칙과 공식 산출물 |
| `members/` | 개인 상태와 세션 로그 |

전체 구조와 라이프사이클은 [cowork.md](cowork.md)를 참조한다.

---

## 먼저 읽으면 좋은 문서

| 문서 | 읽을 때 | 역할 |
|------|----------|------|
| `README.md` | 처음 접할 때 | 입문용 요약과 사용법 |
| `cowork.md` | 구조와 원칙을 이해할 때 | 마스터 운영 기준 문서 |
| `01_cowork_protocol/session_protocol.md` | 세션 절차를 확인할 때 | 세션 운영 기준 |
| `01_cowork_protocol/tooling_environment_guide.md` | 도구 설정, 진입점 동기화, 업그레이드 운영이 필요할 때 | 환경 의존 운영 기준 |
| `01_cowork_protocol/communication_convention.md` | 언어, 톤, 시각화 규칙이 필요할 때 | 표현 기준 문서 |
| `01_cowork_protocol/document_role_inventory.md` | 문서 분류가 헷갈릴 때 | 역할 인벤토리 |

---

## 요청 예시

| 요청 의도 | 동작 |
|--------|------|
| 설계 방향 확정 | 영향도를 판단해 ADR 또는 관련 기준 문서에 기록 |
| 공유 영역 변경을 Proposal로 제출 | Change Proposal 생성 |
| `~단계로 넘어가자` | 현재 단계 문서 보완 후 quality gate 점검 |
| `마무리` | 세션 종료 처리와 이월 항목 점검 |
| 공식 산출물 생성 | Gate 5 점검 후 승인된 활성 산출물 생성 |

---

## 릴리즈와 문서 생성

공식 산출물 생성을 요청하면 AI는 `deliverable_plan.md`와 `export_spec.md`를 기준으로 승인된 활성 항목을 생성한다. 단어를 언급한 것만으로 생성하지 않는다.

- 산출물 품질은 그 이전까지 기준 문서에 얼마나 충실히 축적되었는지에 비례한다.
- 확장 산출물은 필요 시 AI가 제안하고 Human이 승인해 추가한다.
- 세부 목록, 기준 문서 매핑, 생성 방식은 `deliverable_plan.md`와 `export_spec.md`를 기준으로 본다.
- 공식 산출물 생성은 고정 형식 복제를 목표로 하지 않고, 추적성과 필수 정보 보존을 우선한다.

---

## 참고

- 구조, 라이프사이클, 문서 역할 상위 원칙: [cowork.md](cowork.md)
- 세션 시작/진행/종료 절차: [01_cowork_protocol/session_protocol.md](01_cowork_protocol/session_protocol.md)
- 도구 설정, 진입점 동기화, 업그레이드 운영: [01_cowork_protocol/tooling_environment_guide.md](01_cowork_protocol/tooling_environment_guide.md)
- 언어 정책, 톤, 시각화 규칙: [01_cowork_protocol/communication_convention.md](01_cowork_protocol/communication_convention.md)
- 문서 분류와 운영 인벤토리: [01_cowork_protocol/document_role_inventory.md](01_cowork_protocol/document_role_inventory.md)

---

*Cowork Context Engineering v1.0 · 임승현 (<lim8603@gmail.com>)*
