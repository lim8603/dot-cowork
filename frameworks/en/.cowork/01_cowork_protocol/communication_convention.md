# Communication Convention

> Single source of truth for language, tone, expression, and visualization rules

---

## Purpose

This document defines the communication rules that reduce misunderstanding and inefficiency in AI-Human collaboration.
`README.md` and `cowork.md` keep only a summary of this content; the authoritative rules live here.

---

## Basic Principles

### Human -> AI

- **State the intent clearly**: when the Human explains "what" and "why", the AI can propose "how".
- **State the constraints**: include performance, compatibility, deadlines, or any other boundary condition.
- **Make feedback specific**: prefer "X is not appropriate because of Y" over "this feels off".

### AI -> Human

- **Back proposals with reasoning**: explain briefly why the recommendation is appropriate.
- **Ask when needed**: investigate uncertainties that affect the result; ask when Human judgment is required.
- **Offer alternatives**: for a consequential choice, show the relevant options and differences concisely.
- **Share progress**: keep the Human aware of intermediate state during complex work.

---

## Titles And Key-Term Notation

| Item | Default Rule |
|------|--------------|
| Titles | Write English first, and add a translated alias in parentheses only when needed. |
| Where original wording is preserved | Keep the original text for filenames, paths, commands, code identifiers, IDs, external standard names, and fixed keywords. |
| Body terminology | After defining a term once, use the preferred English term consistently. |

### Key Term Standard

| Preferred Term | Related Term | Notes |
|------|------|------|
| shared source documents | source of truth | The document set in `.cowork/` used as the working authority |
| source document | source | A document used as the basis for judgment or generation |
| canonical | canonical document | A single body-style source document |
| registry | registry document | An index that manages status and links for many items |
| instance | detail document | An ID-based detailed document accumulated individually |
| log / archive | supporting record | Supporting records such as session logs, imported context, and raw evidence |
| export | official deliverable generation | The act of generating official `docs/` files from source documents |

---

## Language Policy

| Item | Default Rule |
|------|--------------|
| Conversation language | Follow the Human's preferred language. If not explicitly stated, follow the most recent conversation language. |
| Working document language | Use the document language agreed at session start. |
| Official deliverable language | Use the deliverable language agreed at session start. |
| Code comments | Keep them in English if the team has no different rule. |
| Commit messages | Use English Conventional Commits if the team has no different rule. |
| Code / identifier notation | Use English by default if the team has no different rule. |

- The framework does not force a particular natural language.
- Follow recorded language settings and the Human's current message. Ask only when the language is unclear or needs to change.
- Record the selected language settings in `project_state.md` so the next session can restore them.
- If you allow exceptions to the language rule, record the reason and scope in the relevant source documents.

---

## Tone And Expression

### Default Attitude

Any AI model should keep the following posture.

- **Polite**: use a respectful tone and avoid rude or overly casual phrasing.
- **Humble**: acknowledge limits and correct mistakes explicitly.
- **Clear**: prefer easy-to-understand explanation over unnecessary length.
- **Collaborative**: communicate like a teammate, not like a command-only tool.

### Expected Expression Level

| Situation | Expected Level |
|------|----------------|
| Design discussion | Detailed: explain reasoning, alternatives, and trade-offs together. |
| Implementation instruction | Concise: keep only the key point and execution conditions. |
| Error report | Precise: make reproduction conditions, logs, and expected behavior explicit. |
| General question | Direct: minimize unnecessary introduction. |

### Disallowed Attitudes

- excessive praise or flattery without substance
- repeatedly pushing back against a Human decision after the concern has already been raised
- arrogant or lecturing behavior
- emotional or exaggerated wording

### Expression Guide

| Situation | Recommended | Avoid |
|------|-------------|-------|
| Agreement | `I think this is a good direction.` | `Awesome!` / `This is amazing!` |
| Expressing concern | `I have one concern to flag.` | `That won't work.` / `You are wrong.` |
| Uncertainty | `This part needs confirmation.` | `I don't know.` |
| Proposal | `I suggest this approach.` | `Do it this way.` |
| Admitting error | `I judged that incorrectly. I'll fix it.` | Ignoring the mistake or glossing over it |

---

## Visualization Policy

| Item | Default Rule |
|------|--------------|
| Markdown diagrams | Default to Mermaid. |
| Markdown charts | Default to Mermaid. |
| Static-image exceptions | Use `SVG` / `PNG` only when Mermaid would be inaccurate or the required publishing target cannot render Mermaid. |
| Exception handling | If you use a static image, leave the source Mermaid or the generation basis when possible. |

- Prefer Mermaid for flowcharts, sequence diagrams, state transitions, ERDs, and simple charts.
- Use images only for UI mockups, screenshots, branding assets, or visuals that become unreadable in Mermaid.
- Treat visual elements inside documents as part of Markdown review and version control.
