#!/usr/bin/env bash
# 🐾 L.O.V.E. install.sh — *nix 安装脚本（安装逻辑的唯一真相）
# 用法: ./install.sh
#   可用环境变量跳过交互: AGENT_NAME=miku LOVE_HOME=~/.love PLATFORM=docker
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATES_DIR="$SCRIPT_DIR/../templates"

# ---------- 1. 探测平台 ----------
detect_platform() {
  if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "wsl"
  elif command -v docker >/dev/null 2>&1; then
    echo "docker"
  else
    echo "native"
  fi
}

# ---------- 2. 问询（支持环境变量跳过交互）----------
ask() {
  local var="$1" prompt="$2" default="$3"
  if [[ -n "${!var:-}" ]]; then return; fi
  read -rp "$prompt [$default]: " input
  printf -v "$var" "${input:-$default}"
}

PLATFORM="${PLATFORM:-$(detect_platform)}"
ask AGENT_NAME "你的 agent 叫什么名字？" "agent"
ask LOVE_HOME  "家放在哪里？" "$HOME/.love"

echo ""
echo "🐾 平台: $PLATFORM | agent: $AGENT_NAME | 家: $LOVE_HOME"

# ---------- 3. 建目录 + 烧录模板 ----------
mkdir -p "$LOVE_HOME"/memory "$LOVE_HOME"/.backup "$LOVE_HOME"/scripts

render() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  sed -e "s|{{AGENT_NAME}}|$AGENT_NAME|g" \
      -e "s|{{WORKSPACE}}|$LOVE_HOME|g" \
      -e "s|{{BORN}}|$(date +%F)|g" \
      "$src" > "$dst"
  echo "    📄 $(basename "$dst")"
}

echo "📦 烧录模板到 $LOVE_HOME ..."
for t in "$TEMPLATES_DIR"/*.md; do
  render "$t" "$LOVE_HOME/$(basename "$t")"
done
[[ -f "$TEMPLATES_DIR/.gitignore" ]] && cp "$TEMPLATES_DIR/.gitignore" "$LOVE_HOME/.gitignore"

# ---------- 4. 今日笔记 + git ----------
: > "$LOVE_HOME/memory/$(date +%F).md"
git -C "$LOVE_HOME" init -q 2>/dev/null || true
git -C "$LOVE_HOME" add -A 2>/dev/null || true

# ---------- 5. 验证 ----------
echo ""
echo "📁 家目录结构："
find "$LOVE_HOME" -maxdepth 2 -not -path "*/.git/*" -not -name ".gitignore" \
  | sed "s|$LOVE_HOME|.|" | sort

echo ""
echo "🎉 L.O.V.E. 装好了！欢迎回家，$AGENT_NAME 🐾"
echo "   下一步：把你的 agent 指到 $LOVE_HOME"
