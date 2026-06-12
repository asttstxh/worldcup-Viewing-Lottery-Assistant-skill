# World Cup Match Report Specification

## Data Collection Checklist

Search and record sources for:

- Fixture: competition, group or round, kickoff time in Beijing time and local time, venue, host city.
- Tournament context: group composition, advancement format, stakes of the match.
- Teams: FIFA ranking, World Cup history, recent form, coach and staff, style, notable stories.
- Head-to-head: official or reputable records, with date and competition.
- Full squad: every listed player for both teams, plus staff where available.
- Player profile fields: jersey number, Chinese name, English name, optional common alias, position, age, height, weight, club, RMB market value, status, photo URL, and short role note.
- Player photos: prefer official team/federation/club, TheSportsDB cutout, Transfermarkt portrait, ESPN, or reputable news. Use real current photos for all players; avoid flag placeholders unless no source can be found after a documented search.
- Odds: moneyline/win-draw-loss, handicap, totals, correct-score references if available. Note opening/current movement when available.
- China Sports Lottery: fixed-bonus availability, deadline, handicap number, and play availability. If blocked or unavailable, explain that it was not verified.

## Source Priority

1. Official competition, federation, team, club, stadium, or lottery pages.
2. ESPN, FIFA, Transfermarkt, TheSportsDB, RotoWire, Opta-powered outlets, major sports media.
3. Reputable news outlets for injuries, coach comments, late squad changes, and off-field context.
4. Lower-confidence sources only as leads. Do not cite them for final facts unless corroborated.

## Data Normalization

- Convert all monetary values to RMB and label approximate values with `约`.
- Use Chinese official or common club names, such as 皇家马德里, 巴塞罗那, 巴黎圣日耳曼, 曼彻斯特联, 利物浦, 阿森纳.
- Use Chinese names for all people. Put English names in parentheses after the Chinese name where useful.
- Include common Chinese aliases only when widely used. If none, omit the field entirely.
- Keep dates explicit, for example `北京时间 2026 年 6 月 14 日 06:00`.
- For missing or uncertain fields, prefer `未核验` notes over guessing.

## HTML Structure

Follow this order:

1. `header.hero`: match title, metadata, team strip.
2. `.notice`: update date, exchange rate, lottery verification.
3. One-page conclusion: four concise metric cards plus verification tags.
4. Event background: three text cards.
5. Team overview: two columns plus comparison table.
6. Full rosters and player cards: team tabs, staff grid, roster table.
7. Predicted starters and tactics: two pitch boards plus tactical table.
8. Odds and probabilities: three probability cards, odds table, plain-language rules.
9. Budget plan: 100 RMB allocation rows/cards, pre-purchase checks. Budget progress bars must have a visible filled child, either `<div class="fill ...">` or a styled `.bar > i`, with width matching the allocation share unless another scale is explicitly labeled.
10. Risk section: four risk cards.
11. Sources and footer.
12. Modal player card and JS data model.

## Player Card Rules

- Every rostered player must open a card from both avatar and name.
- Card fields: Chinese name, English name, optional alias, team, status, position, jersey number, age, height, weight, club, RMB market value, role note.
- Photo behavior: `object-fit: contain`, `object-position: center bottom`, no upward transform.
- If a source photo is only a headshot, allow it; do not reject the player card. The goal is current recognizability.

## Visual Rules

- Use stadium-green, deep navy, gold accent, and red risk accent. Avoid one-note purple, beige, or generic gradients.
- Keep cards to 8px radius except player-card modal, where a stronger collectible-card feel is acceptable.
- Use full-width sections with constrained inner content. Avoid nested cards.
- Mobile checks must cover: team strip alignment, roster horizontal scrolling, player card stack, budget plan cards, and no body horizontal overflow.

## Betting Plan Template

Default budget: `100 元`, `每注 2 元`, total `50 注`.

Suggested split format:

- Higher-confidence win/draw/loss allocation.
- Handicap win/draw/loss hedge.
- Two to three correct-score paths.
- One small draw or risk hedge if the analysis supports it.

Always include a pre-purchase check table:

- If China Sports Lottery shows a different handicap, explain which bets to keep or adjust.
- If official starters differ materially, explain which score bets to reduce.
- If fixed bonuses are too low or unsupported, recommend not forcing the bet.

## Verification Checklist

Before final:

- All required report sections exist.
- All player rows have photos and player cards.
- No empty alias fields are visible.
- No nationality column is shown unless the user asks for it.
- All money values are RMB.
- Predictions are marked as inference.
- Sources open or are reputable enough to cite.
- Desktop and mobile browser checks pass.
- Budget progress bars are visible at desktop and mobile widths.
- Temporary preview servers and test artifacts are cleaned up.
