# AI 嵌入式固件开发与多 Agent 技能编排系统

> **一条 SKILL 完整复现四大核心工作流：固件调试闭环 + 技能供应链 + 上下文优化 + 多渠道编排**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Hermes Agent](https://img.shields.io/badge/Hermes-Agent-8A2BE2)](https://hermes-agent.nousresearch.com)

---

## 🌟 这是什么？

一个**即装即用的 AI Agent SKILL**，完整复写了生产级嵌入式固件开发与多 Agent 技能编排的全链路工作流。不论你在用 Hermes、Claude Code、OpenCode 还是 Codex，装上就能用。

### 核心能力

| 工作流 | 一句话说明 | 效果 |
|--------|-----------|------|
| 🔧 **固件调试闭环** | Bug→排查→修复→知识沉淀，4步走 | 调试从小时级→分钟级 |
| 🔄 **技能供应链** | 每日自动发现→审核→安装→同步技能 | 覆盖 8+ Agent 框架 |
| 🎯 **上下文优化** | 按需加载技能，触发词匹配 | Token 消耗 ↓40% |
| 📡 **多渠道编排** | 微信/邮件/飞书三端自动化 | 晨报/周报/微信分身 |

---

## 📦 快速开始

```bash
git clone https://github.com/baeut/albedo-workflow-skill.git
cd albedo-workflow-skill

# 安装到 Hermes
cp SKILL.md ~/.hermes/skills/ai-embedded-workflow/SKILL.md

# 或者安装到 Claude Code
cp SKILL.md ~/.claude/skills/ai-embedded-workflow/SKILL.md
```

> 完整安装指南 → [查看 SKILL.md](./SKILL.md#2-快速安装)

---

## 🏗️ 系统架构

```
                    ┌─────────────────────┐
                    │ ④ 多渠道编排        │
                    │ (晨报/周报/微信分身) │
                    └─────────┬───────────┘
                              │
    ┌─────────────────────────▼─────────────────────────┐
    │              ③ 上下文优化引擎                      │
    └─────────┬──────────────────────────────┬───────────┘
              │                               │
    ┌─────────▼──────────┐      ┌────────────▼──────────┐
    │ ① 固件调试闭环     │      │ ② 技能供应链           │
    │ bug→排查→修复→沉淀  │      │ 发现→审核→转化→同步    │
    └────────────────────┘      └───────────────────────┘
```

---

## 🔧 使用场景

### 嵌入式工程师
- 遇到 NAND Flash bug，Agent 自动检索历史文档、分析错误码、定位根因
- 修改代码后自动提交、同步 VMware 编译验证
- 排查报告自动沉淀到知识库

### AI Agent 用户
- 每日自动发现 GitHub 上新出的 Agent skills
- 自动评估质量并安装到本地
- 跨 Agent 技能同步（Hermes ↔ Claude Code ↔ OpenCode）

### 自动化爱好者
- 三端接入（微信/邮件/飞书）
- 每日晨报自动推送
- 微信分身自动回复

---

## 📊 性能指标

| 指标 | 数据 |
|------|------|
| 月均 API 调用 | 20,195 次 |
| 月均 Token 消耗 | 18.87 亿 (DeepSeek V4 Pro/Flash) |
| 技能库规模 | 100+ Skills，适配 8+ Agent 框架 |
| 知识库 | 1,362 篇双向链接笔记 |
| 固件调试效率 | 小时级 → 分钟级 |
| 上下文优化 | Token 消耗 ↓40% |

---

## 🤝 贡献

欢迎 PR！请遵循以下原则：

1. 保持 SKILL.md 格式兼容
2. 新功能附带使用示例
3. 更新 README 文档

---

## 📄 许可

MIT License - 随意使用、修改、分发。
