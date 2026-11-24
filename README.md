# Lesson Prep — 商科 / 社科备课助手

> A WorkBuddy skill that turns textbook materials into a ready-to-use lesson plan.

## Description

**中文**：面向商科、经济、社科课堂的 WorkBuddy 备课技能。用户上传教材/课本/讲义的截图、PDF、Word 后，按页码逐页提取重点知识点（核心概念用英文，其余用中文），每页或每两页设计一次带参考答案的课堂互动，并在结尾总结整份材料的知识脉络与结构。

**English**: A WorkBuddy skill for business, economics and social-science teaching. Give it textbook screenshots, PDFs or Word files, and it produces a per-page breakdown of key points (core concepts in English, explanations in Chinese), one classroom interaction with a ready-to-use answer roughly every page or two, and a final summary of the knowledge map and structure.

## Features

- 📄 **按页梳理** — 读取 PDF / Word / 截图，按页码组织重点知识点
- 🧠 **概念英文，讲解中文** — `opportunity cost`（机会成本）这类核心术语保留英文，其余用中文
- 🎯 **课堂互动** — 每页或每两页一次，四类形式交替，每题都附参考答案
  1. 概念提问 + 参考答案
  2. 小练习 / 计算题（含步骤）
  3. 小组讨论 / 开放题（含引导方向）
  4. 情境应用 / 举例迁移
- 🗺️ **知识脉络总结** — 一句话主线、先修→核心→应用的逻辑链、模块回顾、中英对照表

## Installation

将本仓库放到 WorkBuddy 的用户级技能目录：

```bash
git clone <your-repo-url> ~/.workbuddy/skills/lesson-prep-business-social
```

目录结构需保持为：

```
~/.workbuddy/skills/lesson-prep-business-social/
├── SKILL.md
├── README.md
└── references/
    ├── output-template.md
    └── interaction-guide.md
```

## Usage

在 WorkBuddy 中上传教材类文件（截图 / PDF / Word），说一句「帮我备课」即可触发。常用说法：

- 「帮我备课，按页码梳理知识点」
- 「逐页提取重点，并设计课堂互动」
- 「总结这份讲义的知识脉络」

输出默认直接在对话中以结构化 Markdown 呈现，不主动生成文件。

## File Structure

| 文件 | 作用 |
| --- | --- |
| `SKILL.md` | 主流程与核心规则：读取材料 → 逐页提取 → 设计互动 → 总结脉络 → 输出 |
| `references/output-template.md` | 输出排版模板与填写示例 |
| `references/interaction-guide.md` | 四类互动的设计要点、商科/经济/社科示例与答案写法 |

## Notes

- 学科默认面向商科 / 经济 / 社科，其他学科沿用同一流程、替换专业内容即可。
- 核心概念首次出现写「英文（中文译名）」，之后可只用英文。
- 互动密度默认为每页到每两页一次，可按材料实际调整。
