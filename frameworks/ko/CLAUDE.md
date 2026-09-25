# [프로젝트명] — CLAUDE.md

Claude Code가 사용하는 프로젝트 진입점이다. 현재 사용자의 요청을 우선하고, 필요한 `.cowork/` 문서만 읽어 작업한다. 다른 도구의 진입점과 사용법은 `.cowork/README.md`를 참조한다.

## 시작과 재개

- 요청한 작업이 명확하면 `.cowork/06_evolution/project_state.md`에서 활성 작업과 제약을 확인하고, 해당 작업의 목록 문서·기준 본문·상세 문서만 추가로 읽어 바로 진행한다. 일반 브리핑이나 작업 재선택을 요구하지 않는다.
- 작업이 지정되지 않았으면 `project_state.md`의 활성 Intent·Milestone·Task, 다음 시작점, 이월 항목을 짧게 브리핑하고 작업을 선택받는다.
- 프로젝트 시작·재개 작업에서 상태가 비어 있거나 핵심 정보가 모순될 때만 `.cowork/01_cowork_protocol/session_protocol.md` §1A에 따라 필요한 사항을 묻는다. 읽기 전용 요청에는 온보딩을 적용하지 않는다.
- 이전 결정이나 미완료 작업의 근거가 필요할 때만 관련 개인 `my_state.md`, 최신 세션 로그, 승인된 ADR을 읽는다. 자세한 로딩 기준은 `project_state.md`의 컨텍스트 로딩 가이드를 따른다.

## 실행과 권한

- `.cowork/01_cowork_protocol/decision_authority_matrix.md`의 H/J/A 수준을 따른다. H/J 결정은 Human의 판단 또는 승인을 받고, A 범위의 작업은 진행 후 결과를 보고한다. 이미 승인된 범위는 반복해서 승인받지 않는다.
- 주요 설계 결정은 `.cowork/01_cowork_protocol/session_protocol.md` §ADR 자동 생성의 승격 기준으로 판단한다. 해당하지 않는 결정은 관련 기준 문서나 세션 로그에 기록한다.
- `제안`, `릴리즈`, `업그레이드` 같은 단어만으로 파일 생성·배포·프레임워크 변경을 시작하지 않는다. 사용자가 해당 동작을 요청한 맥락인지 확인하고 관련 절차를 따른다.
- 결과를 바꾸는 불확실성은 먼저 코드와 문서를 조사한다. 조사로 풀리지 않고 Human의 판단이 필요한 경우에 질문한다.
- Human의 결정을 존중한다. 같은 근거로 우려를 반복하지 않되, 새로운 중대한 근거가 나오면 알린다.

## 문서와 기록

- `.cowork/`의 문서 역할은 `.cowork/01_cowork_protocol/document_role_inventory.md`를 따른다. 목록 문서·기준 본문을 우선 읽고 템플릿·로그·아카이브는 필요할 때만 연다.
- 실제 작업에서 상태나 결정이 바뀌면 해당 기준 문서와 `project_state.md`를 갱신한다. 세션 로그는 작업 연속성에 필요한 결정·변경·미완료 사항을 기록할 때 사용한다. 읽기 전용 요청만으로 로그나 멤버 파일을 만들지 않는다.
- 첫 세션 로그를 만들 때 필요한 `.gitignore` 규칙을 확인한다. 세션 종료 요청 또는 작업 인계 시에는 다음 시작점과 미완료 사항을 동기화한다.
- 문서 체계의 새 기준 문서나 목록 문서 승격은 Human 승인 사항이다. 기존 문서의 일반적인 내용 수정과 작업 파일 생성은 권한 매트릭스에 따른다.
- 대화·문서 언어와 표현은 `.cowork/01_cowork_protocol/communication_convention.md`, 코딩 방식은 `.cowork/04_implementation/coding_convention.md`를 따른다.

## 프로젝트 기준 위치

- **프로젝트:** [프로젝트명]
- **현재 상태·다음 행동:** `.cowork/06_evolution/project_state.md`
- **기술 스택:** `.cowork/03_design_artifacts/tech_stack.md`
- **산출물 범위:** `.cowork/02_project_definition/deliverable_plan.md`
- **세션·게이트·업그레이드 절차:** `.cowork/01_cowork_protocol/session_protocol.md`, `.cowork/05_verification/quality_gate.md`, `.cowork/01_cowork_protocol/tooling_environment_guide.md`
