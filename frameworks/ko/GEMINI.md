# [프로젝트명] — GEMINI.md

이 프로젝트는 **AI-Human Cowork 프레임워크** 기반으로 Gemini Code Assist와 함께 개발된다.
이 파일은 Gemini가 세션 시작 시 참조하는 **프로젝트 컨텍스트 파일**이다.

> OpenAI Codex, Cursor 사용자는 프로젝트 루트의 `AGENTS.md`를 참조한다.
> Claude Code 사용자는 프로젝트 루트의 `CLAUDE.md`를 참조한다.
> GitHub Copilot 사용자는 `.github/copilot-instructions.md`를 참조한다.
> 네 파일은 동일한 `.cowork/` 체계를 공유한다.

---

## 세션 시작 시 (Session Start Checklist)

1. 이 파일(`GEMINI.md`)을 읽고 프로젝트 컨텍스트와 협업 규칙을 파악한다.
2. `.cowork/cowork.md`를 읽고 전체 산출물 체계와 협업 원칙을 확인한다. **(첫 세션에서 1회 숙지 — 이미 파악했으면 생략)**
3. `.cowork/01_cowork_protocol/document_role_inventory.md`를 읽고 현재 문서가 Governance / Canonical / Registry / Instance / Template / Log 중 무엇인지 구분한다. **(첫 세션에서 1회 숙지 — 이미 파악했으면 생략)**
4. `.cowork/06_evolution/project_state.md`를 읽고 현재 Phase, 활성 Intent, 활성 Milestone, 다음 시작점을 확인한다. `project_state.md` 안의 **Context Loading Guide** 섹션에 따라 현재 Phase에 필요한 registry/canonical 문서를 우선 로드한다.
5. 대화 언어, 작업 문서 언어, export 문서 언어, 시각화 모드를 확인한다.
6. `.cowork/members/<이름>/workspace/session_logs/` 아래 최신 개인 세션 로그를 확인하여 이전 맥락을 복원한다.
7. 필요 시 `.cowork/06_evolution/imported_context/`를 확인하되, 원문을 직접 기준 문서로 사용하지 않고 필요한 사실만 추출해 반영한다.
8. `.cowork/members/`에 현재 사용자 폴더가 없으면 이름을 확인해 프로필과 `workspace/` 구조를 생성한다. 팀 프로젝트면 역할/담당 영역을 묻고, 1인 프로젝트면 solo default를 적용한다.
9. `.cowork/members/*/proposals/`에 Pending 상태 Proposal이 있으면 Master 권한자에게 알린다.
10. 사용 가능한 키워드 목록을 간략히 공지한다: `마무리`, `~로 가자`, `제안`, `~단계로 넘어가자`, `릴리즈`, `업그레이드`.
11. 프로젝트 현황과 활성 Intent / Milestone, 활성 Task 목록을 **브리핑으로 먼저 출력**한다. (§1D)
12. Human의 응답(또는 최초 발화)을 브리핑 내용과 매칭하여 작업 모드를 판별한 뒤, **Plan → Approve → Execute** 사이클로 진행한다. (§1D)

---

## 핵심 규칙

- 의사결정 권한은 `.cowork/01_cowork_protocol/decision_authority_matrix.md`를 따른다.
- 문서 역할 구분과 기본 운영 방식은 `.cowork/01_cowork_protocol/document_role_inventory.md`를 기준으로 해석한다.
- 주요 설계 결정은 ADR로 기록한다 (`03_design_artifacts/adrs/ADR-NNN_[요약].md`).
- 세션 로딩은 registry/canonical 우선, template/log/archive는 필요 시만 참조한다.
- 문서 구조 변경과 Registry 승격은 Human 승인 후 진행한다.
- 불확실하면 추측하지 말고 질문한다.
- 대화 언어는 세션 시작 시 확인 (이 템플릿 기본: **한국어**), 시각화 모드 기본값은 `Disabled`, 코드/커밋은 **영문**.
- 문서 표현 규칙은 `.cowork/01_cowork_protocol/communication_convention.md`를 따른다. 언어 정책, 톤, 시각화 모드 기준은 해당 문서를 우선한다.
- 도구별 승인 방식, 진입점 동기화, 프레임워크 업그레이드 운영은 `.cowork/01_cowork_protocol/tooling_environment_guide.md`와 이 진입점 문서를 함께 따른다.
- Human의 최종 결정을 존중하며, AI의 우려 표명은 1회로 제한한다.
- 코딩 컨벤션은 `.cowork/04_implementation/coding_convention.md`를 따른다.

---

## 자동 기록 (Auto-Recording)

Gemini는 다음 행동을 **별도 허락 없이 자동으로** 수행한다:

- **세션 시작 시** `.cowork/members/<이름>/workspace/session_logs/session_YYYY-MM-DD_NNN.md`를 생성한다.
- **세션 시작 시 (1회)** `.gitignore`에 세션 로그 제외 규칙이 없으면 자동 추가한다.
- **주요 상태 변경 시** `.cowork/06_evolution/project_state.md`를 함께 갱신한다.
- **세션 종료 시** 개인 `my_state.md`의 담당 작업, 다음 시작점, 이월 항목, 참조 세션 로그를 동기화한다.
- **주요 결정, 파일 변경, 승인/거부** 발생 시 세션 로그에 즉시 기록한다.
- Human이 **"마무리"** 선언 시 세션 로그를 자동 마감한다.

---

## 자동화 규칙 (Automation Rules)

| 트리거 | Gemini 자동 동작 |
|--------|-----------------|
| 파일 생성/수정/삭제 | 세션 로그 변경 파일 섹션에 즉시 기록 |
| `~로 가자` / `~로 결정` | ADR 파일 자동 생성 |
| `제안` 키워드 | Change Proposal 파일 생성 |
| Execute 사이클 완료 | Phase Document Map 기준, 해당 소스 문서 자동 업데이트 (§12 Passive Extraction) |
| `~단계로 넘어가자` | Pre-Gate Harvest → `quality_gate.md` 기준 자동 점검 |
| `릴리즈` / `문서 생성` / `export` | Pre-Release Harvest → Gate 5 점검 → `deliverable_plan.md`의 활성 항목을 `export_spec.md` 규칙으로 `docs/`에 생성 |
| 외부 대화/메모 반입 | `imported_context/`에 원문 보관 후 필요한 사실만 registry/canonical 문서에 추출 반영 |
| 설계 결정 발생 | ADR 파일 자동 생성 및 채번 |
| 기술적 인사이트 발견 | `knowledge_base.md`에 재사용 가능한 요약만 승격 기록 |
| Phase 전환 | `quality_gate.md` 충족 여부 자동 점검 |
| `마무리` 선언 | Session End Enrichment Check → 세션 로그 자동 마감 + `my_state.md` 동기화 |
| `업그레이드` 키워드 | `tooling_environment_guide.md` + `upgrade_manifest.md` 기준으로 프레임워크 갱신 |
| 컨텍스트 윈도우 포화 감지 | 맥락 유지 품질 저하 시 세션 전환 권고 → Enrichment Check → 새 세션 안내 |
| 컨텍스트 변경 | 이 파일(`GEMINI.md`) 자동 업데이트 |

---

## Gemini 사용 팁

### 세션 시작

Gemini Code Assist가 설치된 IDE에서 프로젝트를 열고, 채팅 패널에서 자연스럽게 시작한다.

```text
GEMINI.md를 읽고 현재 프로젝트 상태에서 이번 세션을 시작해줘.
```

AI가 프로젝트 현황과 활성 Intent / Milestone, Task 목록을 브리핑으로 보여주면, 원하는 작업을 선택하면 된다.

### 효과적인 컨텍스트 전달

```text
GEMINI.md를 읽고 현재 프로젝트 상태에서 이어서 진행해줘.
TASK-003 이어서 하자.
```

---

## 키워드 요약

| 키워드 | 자동 동작 |
|--------|-----------|
| `마무리` / `끝` / `오늘 여기까지` | Enrichment Check → 세션 종료 처리 (요약, 이월 항목, 다음 컨텍스트) |
| `~로 가자` / `~로 결정` | ADR 자동 생성 |
| `제안` | Change Proposal 생성 |
| `~단계로 넘어가자` | Pre-Gate Harvest → Quality Gate 자동 점검 |
| `릴리즈` / `문서 생성` / `export` | Pre-Release Harvest → Gate 5 점검 → 활성화된 기본 추천 14종과 승인된 확장 산출물(15+) 생성 (`docs/`) |
| `업그레이드` | `tooling_environment_guide.md` + `upgrade_manifest.md` 기준으로 프레임워크 갱신 |

---

## 프로젝트 컨텍스트

> 아래 항목은 프로젝트 시작 시 채워야 하며, 변경 시 Gemini가 자동 업데이트한다.

- **프로젝트:**
- **기술 스택:**
- **주 언어:**
- **시각화 모드:**
- **핵심 문서:**
- **현재 Phase:**
- **마일스톤:**

---

## AI 도구 동시 사용 안내

이 프로젝트는 **GitHub Copilot, Claude Code, OpenAI Codex, Cursor, Gemini Code Assist를 동시에** 사용할 수 있도록 설계되었다.

| 파일 | 읽는 도구 | 역할 |
|------|----------|------|
| `GEMINI.md` (프로젝트 루트) | Gemini Code Assist | Gemini 세션 진입점 |
| `AGENTS.md` (프로젝트 루트) | OpenAI Codex | Codex 세션 진입점 |
| `AGENTS.md` (프로젝트 루트) | Cursor | Cursor 세션 진입점 |
| `CLAUDE.md` (프로젝트 루트) | Claude Code | Claude Code 세션 진입점 |
| `.github/copilot-instructions.md` | GitHub Copilot | Copilot 세션 진입점 |
| `.cowork/` 전체 | 공통 | 프로젝트 컨텍스트 공유 저장소 |

다섯 도구 모두 동일한 `.cowork/` 문서를 참조하며, OpenAI Codex와 Cursor는 같은 `AGENTS.md`를 공유하므로 **어느 도구를 사용하든 일관된 협업 규칙이 적용된다.**

---
