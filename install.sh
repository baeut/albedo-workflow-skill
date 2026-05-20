#!/bin/bash
# install.sh — 一键安装 albedo-workflow-skill
# 用法: bash install.sh [agent_type]
#       agent_type: hermes (default) | claude-code | opencode | codex

set -euo pipefail

AGENT_TYPE="${1:-hermes}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_FILE="$SCRIPT_DIR/SKILL.md"

if [ ! -f "$SKILL_FILE" ]; then
  echo "❌ 找不到 SKILL.md，请确保在仓库根目录运行"
  exit 1
fi

case "$AGENT_TYPE" in
  hermes)
    SKILL_DIR="$HOME/.hermes/skills/ai-embedded-workflow"
    echo "📦 安装到 Hermes Agent..."
    ;;
  claude-code)
    SKILL_DIR="$HOME/.claude/skills/ai-embedded-workflow"
    echo "📦 安装到 Claude Code..."
    ;;
  opencode)
    SKILL_DIR="$HOME/.opencode/skills/ai-embedded-workflow"
    echo "📦 安装到 OpenCode..."
    ;;
  codex)
    SKILL_DIR="$HOME/.codex/skills/ai-embedded-workflow"
    echo "📦 安装到 Codex..."
    ;;
  *)
    echo "⚠️  不支持的 Agent: $AGENT_TYPE，使用 hermes"
    SKILL_DIR="$HOME/.hermes/skills/ai-embedded-workflow"
    ;;
esac

mkdir -p "$SKILL_DIR"
cp "$SKILL_FILE" "$SKILL_DIR/"
cp "$SCRIPT_DIR/README.md" "$SKILL_DIR/" 2>/dev/null || true

echo "✅ 安装完成！SKILL 已安装到: $SKILL_DIR"
echo ""
case "$AGENT_TYPE" in
  hermes)
    echo "💡 使用方式: 在 Hermes 中提及固件调试 / 技能供应链 等关键词即可自动加载"
    ;;
  claude-code)
    echo "💡 使用方式: Claude Code 自动从 ~/.claude/skills/ 发现 SKILL"
    ;;
esac
