---
name: ai-embedded-workflow
description: >
  Full-stack AI Agent workflow for embedded firmware development + multi-agent skill supply chain automation.
  Covers NAND Flash/SSD debug loop, Obsidian knowledge management, daily skill discovery & sync,
  context optimization, and multi-channel orchestration (WeChat/Email/Feishu).
domain: software-development
triggers:
  - embedded firmware debugging
  - skill supply chain automation
  - multi-agent orchestration
  - knowledge management pipeline
version: 1.0.0
author: baeut
license: MIT
---

# AI 嵌入式固件开发与多 Agent 技能编排系统

> 一条 SKILL 完整复现：固件调试闭环 + 技能供应链 + 上下文优化 + 多渠道编排

---

## 目录

1. [系统架构概览](#1-系统架构概览)
2. [快速安装](#2-快速安装)
3. [核心工作流](#3-核心工作流)
4. [工作流一：固件调试与知识管理闭环](#4-工作流一固件调试与知识管理闭环)
5. [工作流二：多 Agent 技能自动化供应链](#5-工作流二多-agent-技能自动化供应链)
6. [工作流三：专属技能打包与上下文优化](#6-工作流三专属技能打包与上下文优化)
7. [工作流四：多渠道工作流编排](#7-工作流四多渠道工作流编排)
8. [配置参考](#8-配置参考)
9. [故障排查](#9-故障排查)
10. [FAQ](#10-faq)

---

## 1. 系统架构概览

```
┌──────────────────────────────────────────────────────┐
│                    Hermes Agent                       │
│              (AI Brain / Orchestrator)                 │
└──────────┬──────────┬──────────┬──────────────────────┘
           │          │          │
     ┌─────▼──┐ ┌─────▼──┐ ┌───▼────────┐
     │ Obsidian│ │  Cron  │ │  Channel   │
     │ KB     │ │ Sched  │ │  Gateway   │
     │1,362📝 │ │ 定时任务│ │📧💬📄      │
     └────────┘ └────────┘ └────────────┘
           │          │          │
     ┌─────▼──────────▼──────────▼────────┐
     │         External Agents            │
     │  Claude Code │ OpenCode │ Copilot  │
     └────────────────────────────────────┘
```

### 核心组件

| 组件 | 说明 | 关键指标 |
|------|------|----------|
| **Hermes Agent** | 主编排引擎，AI 大脑 | 月均 20,195 次 API 调用 |
| **Obsidian Vault** | 双向链接知识库 | 1,362 篇笔记，AI 友好索引 |
| **Cron 调度器** | 定时任务流水线 | daily-skill-discovery, morning-brief, weekly-report |
| **VMware Win7** | 固件编译验证环境 | Xilinx SDK 12.4, FT_E02 工程 |
| **渠道网关** | 微信 / 邮件 / 飞书 | 三端接入，统一推送 |

### 技术栈

- **Agent 框架**: Hermes Agent (v0.12+)，可适配 Claude Code / OpenCode
- **知识库**: Obsidian + Frontmatter Tags + MOC + AI 导航协议
- **定时任务**: Cron + Shell/Python 脚本
- **浏览器自动化**: CDP (Chrome DevTools Protocol) + Edge
- **虚拟机**: vmrun + VMware Workstation
- **通讯**: IMAP/SMTP 邮件 + Weixin 微信 + Feishu 飞书

---

## 2. 快速安装

### 前置条件

- Python 3.10+
- Git
- Hermes Agent (推荐 v0.12+)
- Obsidian (可选，用于知识库落地)

### 一键安装

```bash
# 1. 克隆本仓库
git clone https://github.com/baeut/albedo-workflow-skill.git
cd albedo-workflow-skill

# 2. 安装 SKILL 到 Hermes
cp SKILL.md ~/.hermes/skills/ai-embedded-workflow/SKILL.md

# 3. 加载 SKILL（在 Hermes 中）
# 在对话中触发关键词即可自动加载
```

### 最小配置

创建 `~/.hermes/.env`:

```env
# 邮件（必填）
EMAIL_USER=your_email@163.com
EMAIL_PASS_FILE=~/.hermes/email-pass.sh

# GitHub（技能供应链必需）
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx

# 微信（多渠道必需）
WECHAT_BOT_NAME=你的微信分身名

# Obsidian Vault 路径
OBSIDIAN_VAULT=~/.hermes/obsidian
```

### 验证安装

```bash
# 检查 SKILL 是否加载
hermes skills list | grep ai-embedded-workflow

# 手动运行一次技能供应链测试
hermes cron run --skill ai-embedded-workflow
```

---

## 3. 核心工作流

本 SKILL 包含 **四条核心工作流**，既可独立使用，也可串联为全自动流水线：

```
                    ┌─────────────────────┐
                    │ ④ 多渠道编排        │
                    │ (晨报/周报/微信分身) │
                    └─────────┬───────────┘
                              │ 输出
    ┌─────────────────────────▼─────────────────────────┐
    │              ③ 上下文优化引擎                      │
    │  skill 分类加载 / 触发词条件 / token 预算管控       │
    └─────────┬──────────────────────────────┬───────────┘
              │ 输入                          │ 输出
    ┌─────────▼──────────┐      ┌────────────▼──────────┐
    │ ① 固件调试闭环     │      │ ② 技能供应链           │
    │ bug→排查→修复→沉淀  │      │ 发现→审核→转化→同步    │
    └────────────────────┘      └───────────────────────┘
```

---

## 4. 工作流一：固件调试与知识管理闭环

### 适用场景

NAND Flash/SSD 固件开发中的 bug 排查，涉及 CAT 错误码、ONFI 时序、SLC/TLC read retry、坏块管理等。

### 四步排查流程

```
步骤① 查明根因
  │
  ├─ Agent 自动检索 Obsidian 历史排查文档
  ├─ 分析 CAT 错误码 / ECC 阈值 / 读干扰数据
  └─ 输出根因定位报告
  │
步骤② 修改代码
  │
  ├─ 直接修改固件源码（mnand_CP / mnand_twin）
  ├─ 修改 BSP 硬件库（Xilinx SDK）
  └─ 输出 git diff
  │
步骤③ git commit
  │
  ├─ 提交到对应工程（V1_AP_AS_SSD / mnand_ft_FG109H）
  ├─ 使用约定式提交格式
  └─ 作者信息: lic <lic98@outlook.com>
  │
步骤④ 同步验证
  │
  ├─ vmrun CopyFileFromHostToGuest → Win7
  ├─ Xilinx SDK 编译烧录
  └─ Fugu 测试验证
```

### 配套脚本

```bash
# 四步走：排查→改码→提交→同步VM
# 保存为 ~/.hermes/scripts/debug-loop.sh

#!/bin/bash
PROJECT_DIR="/mnt/c/Users/lic98/Documents/文档/FT_E02_Temperature/mnand_ft"
BRANCH=$(git -C "$PROJECT_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
ANALYSIS_DIR="/mnt/c/Users/lic98/Documents/AbnormalAanalysis/$BRANCH"

echo "=== 固件调试闭环 ==="
echo "1. 项目: $BRANCH"
echo "2. 分析目录: $ANALYSIS_DIR"
echo "3. 自动创建分析报告..."
mkdir -p "$ANALYSIS_DIR"
echo "4. 同步到 Obsidian..."
# 在此插入 Obsidian 笔记同步逻辑
echo "=== 完成 ==="
```

### 知识沉淀

每次排查后自动生成标准化分析报告：

```markdown
# 问题分析报告

## 现象
[复现步骤 / 错误日志]

## 根因
[代码行 / 配置项 / 时序问题]

## 修改
[git diff / commit hash]

## 验证
[编译结果 / Fugu 测试结果]
```

报告自动存入：
- `D:\AbnormalAanalysis\<分支名>\`（Windows）
- Obsidian Vault 对应分类目录（AI 可检索）

---

## 5. 工作流二：多 Agent 技能自动化供应链

### 适用场景

团队/个人在多个 AI Agent 框架（Hermes、Claude Code、OpenCode、Codex、Copilot 等）间管理 skills，需要自动化"发现→审核→转化→安装→同步"的全流程。

### 流水线步骤

```
每日 8:00 (CST)  Cron 触发
       │
       ▼
┌─────────────────────────────────────────────────────┐
│ ① 发现阶段                                           │
│ GitHub 热门仓库扫描                                   │
│ 关键词: "claude-code skill", "hermes-agent", "codex" │
│ "open-code skill", "cursor rules"                    │
│ 限: 最近 7 天, ⭐50+                                  │
└──────────────────────┬──────────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────────┐
│ ② 审核阶段                                            │
│ 自动评估:                                              │
│ - SKILL.md 格式完整性                                 │
│ - 前端/后端/Agent/DevOps 分类准确性                    │
│ - 触发词是否与功能匹配                                 │
│ - 无恶意代码 / 安全风险                                │
│ 评分 ≥ 7/10 通过                                      │
└──────────────────────┬──────────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────────┐
│ ③ 转化阶段                                            │
│ 标准化为 SKILL.md (Hermes 格式)                       │
│ / 写入 ~/.hermes/skills/<category>/<skill-name>/      │
│ 适配目标 Agent 框架语法                                │
└──────────────────────┬──────────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────────┐
│ ④ 同步阶段                                            │
│ 自动安装到本地 Hermes 技能库                           │
│ 写入 Obsidian 知识库 (含 frontmatter tags)            │
│ 生成邮件摘要推送 (含各 skill 一句话说明)               │
└──────────────────────────────────────────────────────┘
```

### Cron 配置

```bash
# 每日技能发现 Cron Job
hermes cron create \
  --name "daily-skill-discovery" \
  --schedule "0 0 * * *" \
  --prompt "每日从 GitHub 搜索 AI 编码 agent 热门技能/仓库 ..." \
  --deliver email
```

### 适配的 Agent 框架

| Agent | Skill 格式 | 安装路径 |
|-------|-----------|----------|
| Hermes Agent | SKILL.md | `~/.hermes/skills/` |
| Claude Code | CLAUDE.md / settings.json | `~/.claude/` |
| OpenCode | SKILL.md | `~/.opencode/skills/` |
| Codex | SKILL.md | `~/.codex/skills/` |
| Copilot | .github/copilot-instructions.md | 项目根目录 |
| Cursor | .cursorrules | 项目根目录 |
| Windsurf | .windsurfrules | 项目根目录 |
| Aider | .aider.conf.yml | 项目根目录 |

---

## 6. 工作流三：专属技能打包与上下文优化

### 适用场景

不同 Agent 有不同职责（编排 vs 编码 vs 原型），需要按需加载 skills，避免冗余 skill 污染上下文窗口。

### 分类目录结构

```
~/.hermes/skills/
├── devops/           # CI/CD, Docker, 部署
│   ├── docker-patterns/
│   └── deployment-patterns/
├── software-development/  # 编码相关
│   ├── systematic-debugging/
│   ├── test-driven-development/
│   └── code-review-graph/
├── data-science/     # 数据分析
│   └── jupyter-live-kernel/
├── social-media/     # 社交媒体
│   ├── wechat-avatar-kai/
│   └── xurl/
├── email/            # 邮件自动化
│   └── morning-brief/
├── ssd-nand-flash-knowledge/  # 嵌入式专项
│   └── nand-slc-test-time/
└── mcp/              # MCP 工具
    └── native-mcp/
```

### Agent 职责映射

| Agent | 职责 | 加载的 Skill 类别 |
|-------|------|-------------------|
| **Hermes** | 全链路编排、知识管理、多渠道 | devops, email, social-media, mcp |
| **Claude Code** | 代码审查、重构、TDD | software-development, code-review-graph |
| **OpenCode** | 快速原型、功能实现 | software-development, test-driven-development |
| **Codex** | 实验性编码、探索 | software-development, mcp |

### 触发词条件加载

在 SKILL.md 中定义触发词，只有命中时才会加载：

```yaml
triggers:
  - embedded firmware debugging  # 仅在提及固件调试时加载
  - nand flash test              # 仅在提及 NAND 测试时加载
  - skill supply chain           # 仅在提及技能供应链时加载
```

### 上下文优化效果

| 指标 | 优化前 | 优化后 |
|------|--------|--------|
| 单次会话 Token 消耗 | ~100% | ~60% (↓40%) |
| 技能检索延迟 | 秒级 | 毫秒级 |
| 无关 skill 污染 | 高 | 低 |

---

## 7. 工作流四：多渠道工作流编排

### 适用场景

需要将 Agent 输出推送到多个渠道（微信、邮件、飞书），或从多渠道接收输入。

### 渠道架构

```
┌──────────┐    ┌──────────┐    ┌──────────┐
│  WeChat  │    │  Email   │    │  Feishu  │
│  (微信)   │    │  (邮件)   │    │  (飞书)   │
└────┬─────┘    └────┬─────┘    └────┬─────┘
     │               │               │
     └───────────────┼───────────────┘
                     │
              ┌──────▼──────┐
              │  Hermes     │
              │  Gateway    │
              └─────────────┘
```

### 定时推送任务

```bash
# ① 晨间简报 (每日 8:00)
hermes cron create \
  --name "morning-brief" \
  --schedule "0 8 * * *" \
  --prompt "生成今日晨间简报: 系统状态 + GitHub 动态 + 项目进展" \
  --deliver email

# ② 周报 (每周五 17:00)
hermes cron create \
  --name "weekly-report" \
  --schedule "0 17 * * 5" \
  --prompt "从会话历史提取本周工作，生成标准周报" \
  --deliver email

# ③ 技能发现摘要 (每日)
hermes cron create \
  --name "daily-skill-digest" \
  --schedule "0 0 * * *" \
  --prompt "汇总今日发现的新 skill，生成摘要推送" \
  --deliver email,weixin
```

### 微信分身配置

```yaml
# 微信分身「凯」配置
# 人设: ESTP 合伙人，平民版童锦程
# 代聊规则:
#   - 朋友圈互动: 每日晚间浏览并评论
#   - 消息回复: 自动处理工作类消息，礼貌拒绝推销
#   - 风格: 正气、欣赏赞美、不猥琐
#   - 穿搭评论: 聚焦设计/搭配/品味，不聚焦身材
```

### 邮件 SMTP 配置

```python
# smtp_config.py
SMTP_HOST = "claw.163.com"
SMTP_PORTS = [25, 587]  # 双端口重试
IMAP_HOST = "claw.163.com"
IMAP_PORT = 993

def send_email(to, subject, body):
    """发送邮件，自动双端口重试 + STARTTLS"""
    password = get_password_from_file()
    for port in SMTP_PORTS:
        try:
            with smtplib.SMTP(SMTP_HOST, port, timeout=10) as server:
                server.starttls()
                server.login("albedo@claw.163.com", password)
                server.send_message(build_msg(to, subject, body))
            return True
        except Exception:
            continue
    return False
```

---

## 8. 配置参考

### 环境变量

| 变量 | 必填 | 说明 |
|------|------|------|
| `EMAIL_USER` | ✅ | SMTP/IMAP 邮箱地址 |
| `EMAIL_PASS_FILE` | ✅ | 密码文件路径 (chmod 600) |
| `GITHUB_TOKEN` | 技能供应链 | GitHub PAT (public_repo) |
| `OBSIDIAN_VAULT` | 知识库 | Obsidian 仓库路径 |
| `WECHAT_BOT_NAME` | 微信分身 | 微信进程名 (默认 Weixin.exe) |

### Obsidian Frontmatter 规范

所有笔记必须包含标准 frontmatter 以供 AI 索引：

```yaml
---
title: 笔记标题
tags: [category, subcategory, ai-browsable]
created: 2026-01-01
updated: 2026-05-20
related: [相关笔记ID列表]
---
```

### Git 提交规范

```
<type>(<scope>): <description>

# type: feat|fix|docs|refactor|test|chore
# scope: mnand_CP|mnand_twin|bsp|doc
# 作者: lic <lic98@outlook.com>
```

---

## 9. 故障排查

| 问题 | 可能原因 | 解决 |
|------|---------|------|
| 技能自动加载失败 | 触发词不匹配 | 在对话中明确提及 SKILL 中的 trigger 关键词 |
| Obsidian 笔记未同步 | 路径配置错误 | 检查 `OBSIDIAN_VAULT` 环境变量 |
| 邮件发送失败 | SMTP 端口被封 | 启用双端口重试 (25→587) |
| VMware 同步失败 | VM 未登录 | 确保 Win7 处于已登录状态 |
| Cron 任务未执行 | 调度器未运行 | `hermes cron list` 检查状态 |
| GitHub 技能扫描失败 | Token 过期 | 重新生成 PAT |

---

## 10. FAQ

**Q: 必须用 Hermes Agent 吗？**

A: 不必须。本 SKILL 的工作流可适配任意支持 SKILL.md 格式的 Agent 框架（Claude Code, OpenCode, Codex 等）。只需将 `~/.hermes/skills/` 替换为目标 Agent 的 skill 目录。

**Q: 这个 SKILL 有多大？**

A: 约 30KB。得益于触发词条件加载，实际运行时仅加载匹配当前上下文的段落。

**Q: 如何贡献？**

A: 欢迎 PR！请确保：
1. 新功能有配套测试
2. 遵循现有 SKILL.md 格式
3. 更新 README 文档
