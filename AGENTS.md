# Agent Instructions

This repository contains a portable AI Agent Skill for World Cup match previews and sports lottery planning.

## Primary Skill

Use `skills/worldcup-match-report/SKILL.md` as the entrypoint.

When the user asks for a World Cup or international football match preview, follow the workflow in that skill and load `skills/worldcup-match-report/references/report-spec.md` before generating the report.

## Output Expectations

- Generate a Chinese standalone HTML report.
- Verify current facts through live sources before making factual claims.
- Clearly separate verified facts, unavailable data, and inference.
- Keep betting guidance entertainment-oriented and budget-limited.
- Do not promise winnings or deterministic returns.

## Portability Notes

For tools that do not natively support Agent Skills, treat this repository as a rules package:

- Copy the core workflow from `SKILL.md`.
- Copy the detailed report contract from `references/report-spec.md`.
- Use the HTML file in `assets/` as a visual reference only.
- Preserve the source-backed, responsible-budget framing.
