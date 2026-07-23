# 도구/환경 운영 가이드 (Tooling Environment Guide)

> 도구별 실행 제약, 진입점 동기화, 네트워크 의존 운영을 분리해 관리하는 가이드

---

## 목적

- `session_protocol.md`는 세션 공통 흐름과 불변 규칙만 유지한다.
- 이 문서는 자동승인, 진입점 동기화, 업그레이드처럼 **도구/환경에 따라 달라질 수 있는 운영 지시**를 다룬다.
- 구체 명령, UI 설정, 도구별 예시는 해당 진입점 문서에 두고, 여기서는 배치 원칙과 공통 운영 기준을 정의한다.

---

## 배치 원칙

| 주제 | 기본 기준 문서 | 메모 |
|------|----------------|------|
| 세션 시작, 브리핑, 모드 선택, 종료 | `session_protocol.md` | 도구 공통 프로토콜 |
| 도구별 시작 프롬프트, 설정 예시, 승인 UX | `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.github/copilot-instructions.md` | 현재 사용 중인 도구 문서만 직접 따른다 |
| 역할 좌석 실행 방식(페르소나/독립 서브에이전트), 사용 모델 | `role_realization.md` + 현재 도구 진입점 문서 | 독립 서브에이전트·다중 모델 지원은 도구 역량에 따라 다름 |
| 4대 진입점 동기화 기준 | `tooling_environment_guide.md` | 공통 컨텍스트가 바뀔 때 함께 검토 |
| 프레임워크 업그레이드 실행 경로 | `tooling_environment_guide.md` | 네트워크/오프라인 분기 포함 |
| 버전 체인, 파일 분류, 단계별 적용 기준 | `upgrade_manifest.md` | 릴리즈별 authoritative source |

---

## 1. 도구별 승인과 실행 제약

- 자동승인은 필수 전제가 아니다. 지원하지 않거나 Human이 원치 않으면 수동 승인 흐름으로 계속 진행한다.
- 세션 시작 시 도구 제약 때문에 막히더라도 공통 프로토콜은 유지한다. 확인이 필요한 것은 승인 방식, 파일/쉘 실행 가능 여부, 네트워크 접근 가능 여부, 장기 실행 제약이다.
- 도구별 설정 예시는 **현재 도구의 진입점 문서**에만 둔다. 한 도구의 명령이나 UI 옵션을 `session_protocol.md` 같은 공통 문서로 복사하지 않는다.
- 자동승인이나 유사 설정을 권장하더라도, Human 확인은 1회만 요청하고 거절되면 반복하지 않는다.

### 도구별 예시 위치

| 도구 | 문서 | 비고 |
|------|------|------|
| OpenAI Codex / Cursor | `AGENTS.md` | 프로젝트 컨텍스트와 공통 자동화 트리거 |
| Claude Code | `CLAUDE.md` | CLI 기반 시작 흐름과 설정 예시 |
| Gemini Code Assist | `GEMINI.md` | IDE 채팅 시작 흐름 |
| GitHub Copilot | `.github/copilot-instructions.md` | IDE/에이전트형 사용 흐름 |

---

## 2. 진입점 동기화 규칙

- 4대 진입점 파일은 같은 `.cowork/` 공유 기준 문서를 각 도구에 맞게 노출하는 얇은 wrapper다.
- 아래 항목이 바뀌면 4대 진입점 전체를 함께 검토한다.
  - 프로젝트명, 핵심 문서, 주 언어/문서 언어 정책
  - Phase 표현 방식, 브리핑 흐름, 공통 키워드 동작
  - 기술 스택 요약, 핵심 워크플로우, 업그레이드/릴리즈 안내
  - 다른 도구와 공유해야 하는 자동화 문구
- 한 도구 전용 예시만 바뀌면 해당 진입점만 수정하고, 공통 계약이 달라진 경우에만 나머지 3개도 동기화한다.
- 진입점 변경이 발생하면 세션 로그 또는 릴리즈 기록에 entrypoint sync 성격의 변경으로 남긴다.

---

## 3. 프레임워크 업그레이드 운영

### 트리거

- Human이 `업그레이드` 키워드를 선언한다.

### 기준 문서

- 실행 경로와 환경별 분기: `01_cowork_protocol/tooling_environment_guide.md`
- 현재 설치 버전과 대상 버전 판정, 파일 분류: `.cowork/upgrade_manifest.md`

### 공통 운영 규칙

1. 먼저 현재 프로젝트의 `.cowork/upgrade_manifest.md`에서 설치된 `Version`을 읽는다.
2. 네트워크 접근이 가능하면 GitHub API로 최신 릴리즈를 조회한다.
   - `GET https://api.github.com/repos/lim8603/cowork-context-framework/releases/latest`
3. 네트워크 접근이 불가하면 `.cowork/.upgrade/archives/v{버전}/`에 수동 배치한 zip을 사용한다.
4. 대상 릴리즈의 `upgrade_manifest.md`를 읽고 `Version`과 `From`을 확인한 뒤, 항상 `From` 체인으로 인접/건너뛰기 업그레이드를 판정한다.
5. 건너뛰기 업그레이드는 최신 버전 직행 적용보다 **중간 버전 순차 적용**을 우선한다.
6. 적용 전에 `.cowork/.upgrade/upgrade_plan_v{from}_to_v{to}.md`를 만들고, 검증된 순서와 해제 경로를 기록한다.
7. 각 단계는 매니페스트의 `ADD / REPLACE / MERGE / SKIP` 분류대로 적용한다.
8. `MERGE`가 필요하거나 판단이 어려운 경우는 Human 승인 후 적용한다.
9. 프로젝트가 채운 데이터는 보존하고, 프레임워크 구조와 규칙만 갱신한다.
10. 업그레이드 전에는 git commit을 권장하고, 계획 파일과 결과 로그는 검증이 끝날 때까지 `.cowork/.upgrade/`에 유지한다.

---

## 4. 유지 보수 체크

- 도구별 설정 예시가 바뀌면: 해당 진입점 문서만 먼저 갱신한다.
- 공통 운영 경계가 바뀌면: `session_protocol.md`, 이 문서, `document_role_inventory.md`, `document_change_impact_matrix.md`, 필요 시 `upgrade_manifest.md`를 함께 본다.
- 경로/파일 구조가 바뀌면: 4대 진입점과 `upgrade_manifest.md`까지 포함해 동기화한다.
