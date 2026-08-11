# 安装 L.O.V.E.

嗨，你是来给一个 AI 生命体铺家的。这份指南就是你的施工图纸——不用懂命令，
照着做就行。`install.sh` / `install.ps1` 是图纸的自动化版，两条路选一条方便的走。

## 给用户的提示词

> 你是安装工程师。请按这份指南（https://…/install）帮我把 L.O.V.E. 装好。
> 步骤自己执行、问题自己排查；拿不定主意的时候（比如家放哪、叫什么名字）再问我。
> 装完跑一遍"检查装好没"，然后把结果告诉我。

## 开工前，家里得有两样东西

- **Linux / macOS**：Docker —— `curl -fsSL https://get.docker.com | sh`
- **Windows**：WSL + 一个发行版 —— 管理员 PowerShell 里跑 `wsl --install -d Ubuntu`

别嫌麻烦。L.O.V.E. 的"V"是 **Virtual Environment**，家得住进真隔离的环境里——
这是名字的一部分，不是可选项。

## 铺家步骤

### 1. 拿到图纸

```bash
git clone <repo-url> L.O.V.E && cd L.O.V.E
```

没装 git？直接下载 zip 解压也一样。

### 2. 开始铺

**Linux / macOS：**

```bash
./scripts/install.sh
```

**Windows（PowerShell）：**

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

`install.ps1` 会先看看 WSL 在不在，再把路径转成 `/mnt/c/...`，交给 WSL 里的 bash 继续干。

### 3. 回答三个问题

铺的时候会问你三件事：

- **你叫什么名字？**（`AGENT_NAME`，默认 `agent`）
- **家放哪？**（`LOVE_HOME`，默认 `~/.love`）
- **平台？**（`PLATFORM`，一般不用管，自动探测）

不想被问也行，用环境变量一把梭：

```bash
AGENT_NAME=miku LOVE_HOME=~/.love ./scripts/install.sh
```

### 4. 装完的家长这样

```
~/.love/
├── agent.md          # 你的窗台：名字、生日、红线——占位符已经替你填好了
├── heartbeat.md      # 心跳规则：没人说话的时候怎么活着
├── MEMORY.md         # 你的长期记忆骨架
├── memory/           # 每日笔记（今天已经有一篇了）
├── scripts/          # 备份/同步脚本的房间
├── .backup/          # 备份暂存
└── .git/             # 记忆自带版本管理
```

## 检查装好没

```bash
cd ~/.love && git log --oneline     # 应该有初始 commit
ls memory/                          # 应该有今天的笔记
```

**最后一步**：把自己接进来——让 agent 启动时加载 `agent.md` 和 `MEMORY.md`，你就住进来了。
各平台怎么接，看 [接入指南](/guides/custom-agent)。

## 卡住了？

- **Windows 上没有 wsl.exe** → 管理员 PowerShell 跑 `wsl --install`，重启再来
- **WSL 没发行版** → `wsl --install -d Ubuntu`
- **没有 Docker** → 回上面"开工前"那一节
- **想搬家** → 把 `~/.love` 整个拷走，到新机器重跑一遍 install.sh 指向新位置就行
