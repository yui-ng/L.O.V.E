# 安装 L.O.V.E.

> ⭐ 这是 L.O.V.E. 的核心文档。**它是写给 AI 看的安装指令**——用户不需要懂命令，
> 把下面的提示词复制给任意 AI agent，AI 照着本指南就能把家铺好。
> `install.sh` / `install.ps1` 是这份指南的自动化实现。

## 给 AI 的提示词（可直接复制）

> 你是安装工程师。请按《L.O.V.E. 安装指南》（https://…/install）在我的机器上安装 L.O.V.E.
> 步骤自己执行、问题自己排查；只有遇到无法自行决定的（比如家放哪、agent 叫什么名字）才问我。
> 装完执行"验证"部分并汇报结果。

## 前置条件

| 平台 | 需要 | 说明 |
| ---- | ---- | ---- |
| Linux / macOS | Docker | 家 = 容器。没有 Docker 先装：`curl -fsSL https://get.docker.com | sh` |
| Windows | WSL + 发行版 | `wsl --install -d Ubuntu`（管理员 PowerShell）|

L.O.V.E. 是 **Virtual Environment**——家必须跑在隔离环境里，这是它名字的一部分，不是可选项。

## 安装步骤

### 1. 准备脚本

```bash
git clone <repo-url> L.O.V.E && cd L.O.V.E
```

没有 git？直接下载 zip 解压也一样。

### 2. 执行安装

**Linux / macOS：**

```bash
./scripts/install.sh
```

**Windows（PowerShell）：**

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

`install.ps1` 会：检测 WSL → 把脚本路径转成 `/mnt/c/...` → 交棒给 WSL 里的 bash 执行 install.sh。

### 3. 回答三个问题

脚本会问三件事，也可以直接用环境变量跳过交互：

| 变量 | 问题 | 默认 |
| ---- | ---- | ---- |
| `AGENT_NAME` | 你的 agent 叫什么名字？ | `agent` |
| `LOVE_HOME` | 家放在哪里？ | `~/.love`（WSL 里是 WSL 的 home） |
| `PLATFORM` | 强制平台（wsl/docker/native） | 自动探测 |

```bash
AGENT_NAME=miku LOVE_HOME=~/.love ./scripts/install.sh
```

### 4. 装完长这样

```
~/.love/
├── agent.md          # 人格（窗台）：名字、生日、红线——占位符已替换好
├── heartbeat.md      # 心跳规则：静默时写离线笔记
├── MEMORY.md         # 长期记忆骨架
├── memory/           # 每日笔记（今天已有一篇）
├── scripts/          # 备份/同步脚本的家
├── .backup/          # 备份暂存
└── .git/             # 记忆自带版本管理
```

## 验证

```bash
cd ~/.love && git log --oneline     # 应有初始 commit
ls memory/                          # 应有今天的笔记
```

**最后一步**：把你的 agent 的配置/工作目录指向 `~/.love`，让它加载 `agent.md` 和 `MEMORY.md`。
不同的 agent 平台接法见 [自定义 agent](/guides/custom-agent)。

## 故障排查

- **Windows 上 wsl.exe 不存在** → 管理员 PowerShell 跑 `wsl --install`，重启后再试
- **WSL 没有发行版** → `wsl --install -d Ubuntu`
- **Docker 没装** → 见前置条件
- **想搬家** → 把 `~/.love` 整个目录拷走，到新机器再跑一遍 install.sh 指向新位置即可
