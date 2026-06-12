# World Cup Viewing & Lottery Assistant Skill

这个skill写给那些想看世界杯，有喜欢的球队和球员，却对其他信息一知半解的人，观赛时全靠解说来补场内外信息，想买点体彩吧也是纯凭感觉，没时间没精力去逐个研究。

这是一个面向 AI Agent 的可迁移 skill 包，它会围绕一场指定比赛，主动整理球队、赛程、阵容、球员资料、历史交锋、赔率变化、战术倾向和风险因素，生成一份独立 HTML 报告：既能当观赛指南，也能作为固定预算下的体育彩票参考方案。

它采用通用的 `SKILL.md + references + assets` 结构：只要你的 AI 工具支持 Agent Skills、规则文件、项目指令、斜杠命令或自定义上下文，就可以安装、导入或改造成自己的赛前分析助手。

## 示例

仓库中包含一份轻量示例报告：

- [阿根廷 vs 阿尔及利亚示例 HTML](examples/argentina-vs-algeria-2026-06-17.html)

你可以直接在浏览器打开这份文件，查看最终报告的版式、球员卡、战术板、概率解释和购彩方案模块。


## 它能帮你做什么

- 生成中文 HTML 赛前报告，结构适合直接阅读、分享和复盘。
- 汇总双方球队背景、世界杯历史、分组形势、比赛时间、场馆信息和重要看点。
- 整理完整名单、教练组、球员中文名、英文名、年龄、身高、体重、号码、俱乐部、人民币身价和球员照片。
- 为每名球员生成可点击球员卡，支持首发与替补完整查看。
- 预测首发阵容和战术方向，并明确标注哪些是已核验事实，哪些是赛前推断。
- 解释胜平负、让球、大小球、比分等常见玩法和赔率含义。
- 在固定预算内生成娱乐性购彩方案，例如默认 `100 元`、`每注 2 元` 的组合分配。
- 输出来源列表，要求关键事实可追溯，降低“凭感觉判断”的比例。

## 适合谁使用

- 想在世界杯开赛前快速了解一场比赛全貌的球迷。
- 关注巴西、阿根廷、葡萄牙等强队，但不熟悉阵容和对手信息的人。
- 想把海外赔率、球队实力、战术风险和中国体育彩票执行规则放在同一份报告里对照的人。
- 想为赛前分析建立一个稳定流程，而不是每场比赛临时从多个网页拼信息的人。
- 想把同一套赛前分析方法带到 Claude Code、Codex、Copilot、Cursor、Gemini CLI 或其他 AI Agent 工具中的用户。


## 适用工具

这个仓库优先按 Agent Skills 规范组织，同时也适合改造成其他 AI 工具的规则、命令或项目指令。常见使用方式如下：

| 工具 | 推荐用法 |
| --- | --- |
| GitHub Copilot Agent Skills | 使用 GitHub CLI `gh skill` 安装，或下载 `skills/worldcup-match-report/`。 |
| Claude Code | 使用 `gh skill` 安装到 Claude Code，或将 skill 目录导入 Claude Code skills。 |
| OpenAI Codex | 使用本仓库脚本安装到 Codex skill 目录，或使用 `gh skill`。 |
| Cursor | 使用 `gh skill` 支持的 Agent Skills 流程；也可以把 `SKILL.md` 和 `references/report-spec.md` 改成 Cursor Rules。 |
| Gemini CLI | 使用 `gh skill` 支持的 Agent Skills 流程；也可以把核心说明作为 Gemini 项目指令。 |
| Antigravity、Amp、Goose、Junie、OpenCode、Windsurf、Continue、Cline 等 | 优先尝试 GitHub CLI `gh skill` 支持的宿主参数；如果本机版本尚未覆盖，就按手动规则包迁移。 |
| Aider、Roo Code、Zed 以及其他支持规则文件或自定义上下文的工具 | 复制 `SKILL.md`、`references/report-spec.md` 和 `assets/`，作为项目规则、agent 指令或自定义命令使用。 |

核心原则很简单：这个 skill 的价值不依赖某个客户端，而在于一套可复用的赛前分析流程、证据规则、报告结构和视觉参考。


## 快速开始

### 方式一：GitHub CLI Agent Skills

如果你使用的工具支持 GitHub CLI 的 `gh skill`，推荐先预览再安装：

```bash
gh skill preview asttstxh/worldcup-Viewing-Lottery-Assistant-skill skills/worldcup-match-report
gh skill install asttstxh/worldcup-Viewing-Lottery-Assistant-skill skills/worldcup-match-report
```

如果你想指定宿主工具或安装范围，可在本机运行：

```bash
gh skill install --help
```

根据本机可用宿主选择对应的 `--agent` 与 `--scope` 参数。GitHub CLI 文档列出的宿主包含 GitHub Copilot、Claude Code、Cursor、Codex、Gemini CLI、Antigravity、Amp、Goose、Junie、OpenCode、Windsurf、Continue、Cline 等；实际可用列表以你本机 `gh skill install --help` 为准。

### 方式二：OpenAI Codex 本地安装

```bash
git clone https://github.com/asttstxh/worldcup-Viewing-Lottery-Assistant-skill.git
cd worldcup-Viewing-Lottery-Assistant-skill
bash scripts/install.sh
```

重启 Codex 后，可以这样使用：

```text
[$worldcup-match-report] 输出阿根廷 vs 阿尔及利亚分析报告
```

### 方式三：复制到其他 AI Agent 工具

如果你的工具还没有原生 Agent Skills 安装器，可以手动复制以下内容：

```text
skills/worldcup-match-report/SKILL.md
skills/worldcup-match-report/references/report-spec.md
skills/worldcup-match-report/assets/
```

然后把它们放入对应工具的项目规则、用户规则、命令目录、上下文目录或自定义 agent 说明中。使用时可以这样提出任务：

```text
使用 worldcup-match-report 的流程，输出巴西 vs 摩洛哥赛前观赛与购彩分析报告。
```

默认建议输出路径为：

```text
output/worldcup-betting-assistant/
```


## 仓库结构

```text
.
├── README.md
├── AGENTS.md
├── LICENSE
├── CONTRIBUTING.md
├── scripts/
│   └── install.sh
├── skills/
│   └── worldcup-match-report/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       ├── references/report-spec.md
│       └── assets/known-good-brazil-vs-morocco-2026-06-14.html
├── examples/
│   └── argentina-vs-algeria-2026-06-17.html
└── docs/
    └── report-preview.svg
```

## 使用边界

这个 skill 不是投注技巧承诺，也不提供确定性收益判断。报告中的购彩方案只适合作为娱乐预算下的信息整理和风险提示。实际购买前，请务必以当地法律法规、中国体育彩票销售终端显示的固定奖金、让球数、销售状态和截止时间为准。

如果中国体育彩票接口或固定奖金无法远程核验，报告会明确标注“未核验”，并使用已核验的公开赔率与概率信息作为参考，不会把推断包装成确定事实。

## English Summary

World Cup Viewing & Lottery Assistant Skill is a portable AI Agent Skill package for generating source-backed Chinese HTML match previews. It combines viewing guidance, squad research, player cards, tactical notes, odds explanation, risk flags, and a fixed-budget sports lottery plan. The package follows the `SKILL.md` pattern and can be used with Agent Skills hosts such as GitHub Copilot, Claude Code, Codex, Cursor, Gemini CLI, Antigravity, Amp, Goose, Junie, OpenCode, Windsurf, Continue, and Cline, or adapted into rules and custom instructions for other AI agent tools.
