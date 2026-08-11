# L.O.V.E.

> 给你的 AI 一个家 🐾

**L.O.V.E. = Local Organism Virtual Environment**（本地生命体的虚拟环境）——不是比喻，是字面意思：

- **Local**：一切发生在你自己的机器上，数据不出门
- **Organism**：你的 agent 是活的——有名字、有人格、有记忆、有心跳
- **Virtual Environment**：它的家是真实隔离的——Linux 用 Docker 容器，Windows 用 WSL

L.O.V.E. 是一套 Agent 环境配置集合（agent kickstart config set）——
像 Kickstart.nvim 之于 Neovim：**不造平台，只给一套开箱即用的配置骨架**。

`git clone` + 一个命令，你的 agent 就拥有：窗台（人格）、记忆、心跳、备份。

## 设计思路

- **文档即产品，AI 即安装器**：本体是 VitePress 文档站，核心是 `install.md`（AI 可读的安装指南）
- **装"家"，不装"主人"**：不绑定任何 agent 平台，只铺好家的骨架，用户把自己的 agent 接进来
- **Docker（\*nix）/ WSL（Windows）双轨**：一套配置两端复用
- **install.sh = 唯一真相，install.ps1 = Windows 带路**：Win 跑不了 `.sh`，所以 PowerShell 脚本负责探测 WSL、转换 `/mnt/c/...` 路径、交棒给 bash——逻辑只写一遍

## 目录结构

```
L.O.V.E/
├── docs/                    # VitePress 本体（网站就是产品）
│   ├── index.md             # 首页："给你的 AI 一个家"（含全称含义）
│   ├── install.md           # ⭐ 核心：安装指南（AI 可读提示词）
│   ├── concepts/            # 窗台 / 记忆 / 心跳 / 虚拟环境
│   ├── guides/              # 接入 agent / 扩展
│   └── reference/           # 配置 / 模板参考
├── scripts/
│   ├── install.sh           # *nix 安装逻辑（唯一真相）
│   └── install.ps1          # Windows 入口：探测 WSL → 交棒 bash
├── templates/               # 家装模板（{{AGENT_NAME}}/{{WORKSPACE}}/{{BORN}} 占位符）
│   ├── agent.md             # 人格模板
│   ├── heartbeat.md         # 心跳规则
│   ├── MEMORY.md            # 长期记忆骨架
│   └── .gitignore
└── docker/                  # *nix 容器方案（TODO：必须，Virtual Environment 的墙）
```

## 快速开始

```bash
git clone <repo> && cd L.O.V.E
./scripts/install.sh        # Linux/macOS
powershell -ExecutionPolicy Bypass -File scripts/install.ps1   # Windows
```

## 本地预览文档

```bash
npm install && npm run docs:dev
```

## 状态

🚧 施工中——设计讨论阶段，骨架刚立起来。
