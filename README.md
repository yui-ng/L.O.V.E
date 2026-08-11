# L.O.V.E.

> 给你的 AI 一个家 🐾

L.O.V.E. 是一套 Agent 环境配置集合（agent kickstart config set）——
像 Kickstart.nvim 之于 Neovim：**不造平台，只给一套开箱即用的配置骨架**。

`git clone` + 一个命令，你的 agent 就拥有：窗台（人格）、记忆、心跳、备份。

## 设计思路

- **文档即产品，AI 即安装器**：本体是 VitePress 文档站，核心是 `install.md`（AI 可读的安装指南）
- **装"家"，不装"主人"**：不绑定任何 agent 平台，只铺好家的骨架，用户把自己的 agent 接进来
- **Docker（\*nix）/ WSL（Windows）双轨**：一套配置两端复用

## 目录结构

```
love/
├── docs/                    # VitePress 本体（网站就是产品）
│   ├── index.md             # 首页："给你的 AI 一个家"
│   ├── install.md           # ⭐ 核心：安装指南（AI 可读）
│   ├── concepts/            # 概念：窗台/记忆/心跳
│   ├── guides/              # 进阶：自定义人格、模块扩展
│   └── reference/           # 配置项参考
├── scripts/
│   └── install.sh           # 一键安装
├── templates/               # 家装模板（{{WORKSPACE}} 占位符）
└── docker/                  # *nix 容器方案
```

## 状态

🚧 施工中——设计讨论阶段，骨架刚立起来。
