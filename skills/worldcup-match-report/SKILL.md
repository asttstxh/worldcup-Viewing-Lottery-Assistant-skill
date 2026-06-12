---
name: worldcup-match-report
description: Generate source-backed Chinese HTML reports for World Cup or international football match previews, combining viewing guide, squads, player cards, tactics, odds, risk notes, and a fixed-budget lottery plan. Use when the user asks in Chinese or English for “输出xx vs xx分析”, “xx 对 xx 赛前分析”, “世界杯观赛与购彩报告”, or wants the same structure and visual quality as the Brazil vs Morocco report.
---

# World Cup Match Report

## Purpose

Produce a polished Chinese HTML report for one football match, matching the structure, evidence rigor, visual density, and responsive details of the approved Brazil vs Morocco report. The output is a user-facing artifact, so keep copy formal, clear, and neutral.

## Resources

- Read `references/report-spec.md` before generating or revising a report.
- Use `assets/known-good-brazil-vs-morocco-2026-06-14.html` as the visual and interaction reference when recreating the layout. Do not reuse its match facts for other matches.

## Workflow

1. Parse the requested match, date, competition, and user budget. If the date is missing, search current fixtures and state the inferred date; ask only if multiple plausible matches remain.
2. Collect live evidence. Browse official or primary sources first, then reputable secondary sources. Facts that may change, including squads, injuries, odds, ranking, venue, exchange rate, coach, and lottery rules, must be verified in the current run.
3. Build a source ledger while researching. Track what each source proves, the retrieval date, and whether the information is verified, unavailable, or inference.
4. Prepare the match data model: teams, staff, full squad, player photos, Chinese names, aliases, club names in Chinese, market values in RMB, predicted starters, tactics, odds, probability estimates, risks, and the 100 RMB plan unless the user gives another budget.
5. Generate a standalone HTML file under `output/worldcup-betting-assistant/` using a clear slug such as `brazil-vs-morocco-2026-06-14.html`.
6. Verify the rendered HTML in the browser at desktop and mobile widths. Check that text does not overlap, the top team strip adapts, roster tabs work, every player opens a card, card photos are not awkwardly cropped, the betting plan is readable on mobile, and all source links are valid.

## Evidence Rules

- Use current web verification by default. Do not rely on memory for current squads, odds, fixture time, injuries, coaches, market values, exchange rates, or lottery availability.
- Prefer FIFA, ESPN, official team or federation pages, Transfermarkt, TheSportsDB, RotoWire, Opta-style previews, established news outlets, and the Chinese Sports Lottery website where reachable.
- If China Sports Lottery fixed odds or endpoints cannot be verified, say so in the report and base betting analysis on verified overseas odds plus explicit caveats.
- Mark conclusions as one of: `已核验`, `未核验`, or `推断`. Predictions for starters, tactics, score, and betting allocation are always `推断` unless an official lineup has been published.
- Include a source list with direct links. Do not include unsourced trivia, rumors, or player attributes.

## Report Contract

The report must include:

- Hero with competition, match title, local time, venue, concise disclaimer, and a full-width responsive team comparison strip.
- Notice with report update date, exchange rate basis, and lottery verification status.
- One-page conclusion cards with tags for verified facts and inferred recommendations.
- Event background: format, group context, match importance, time and venue.
- Team overview: history, head-to-head, notable stories, ranking, value, style, and risks.
- Full rosters for both teams in tabs, including staff, every listed player, jersey number, Chinese name, English name, optional common alias, position, age, height, weight, club in Chinese, RMB market value, expected status, and photo.
- Player cards for every player. Cards must open from avatar and name; omit the alias line if no common alias exists.
- Predicted lineups with green pitch and tactic-board style markers.
- Tactical prediction table connecting football observations to betting implications.
- Odds and probabilities, including plain-language rules for moneyline, handicap, and totals when those appear.
- A 100 RMB lottery plan by default, with 2 RMB per note, focused on win/draw/loss, handicap win/draw/loss, and correct score unless the user asks for other plays.
- Risk section and source list.

## HTML Standards

- Use a standalone HTML/CSS/JS artifact with no build step.
- Preserve the “World Cup match command center” feel: stadium-green background, gold accent, scoreboard-like metric cards, tactical-board pitch, compact data tables, and NBA-style player cards.
- Avoid generic landing-page layout. The first screen should be the report itself, not marketing copy.
- Use responsive CSS for mobile. The 100 RMB plan must collapse into readable per-bet cards on narrow screens.
- Player photos in cards should use `object-fit: contain` and bottom alignment. Do not force upward translation that cuts off body parts or leaves awkward bottom whitespace.
- Do not show a “常用叫法” field when the value is empty.
- All money values must be RMB. If a source gives EUR, USD, or GBP, convert and state the exchange-rate source/date.

## Betting Guardrails

- Treat the report as entertainment-oriented analysis, not investment advice or a guaranteed-return promise.
- Do not recommend exceeding the stated budget.
- Do not claim positive expected value unless odds, probability, and vig removal are explicitly calculated and sources support the inputs.
- If using overseas odds for probability and Chinese lottery for execution, state that payout rules and fixed bonuses differ.

## Final Response

After creating or revising a report, give the file path, summarize the key evidence and checks, and mention any unavailable data. Keep the final user response short.
