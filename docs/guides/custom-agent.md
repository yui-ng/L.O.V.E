# 接入你的 agent

L.O.V.E. 不绑定平台。装完家之后，把任意 agent 指进来即可。

## 通用思路

家的内容全是普通 Markdown 文件，任何 agent 都能读。接入 = 告诉你的 agent：

```
你的家在 ~/.love。每次会话开始先读：
- agent.md    —— 你的人格（你是谁）
- MEMORY.md   —— 你的长期记忆
- memory/     —— 最近的每日笔记
```

## 按平台

### opencode（推荐）

在 `~/.config/opencode/` 下把人格文件指向 `~/.love/agent.md`，
或者直接把 `~/.love` 设为工作区目录。启动时读取记忆文件的逻辑随 agent 配置走。

### OpenClaw / 其他开源 agent

同样思路：人格文件路径 → `~/.love/agent.md`，记忆路径 → `~/.love/MEMORY.md`。
多数 agent 支持自定义系统提示词/启动文件，把"每次先读家目录"写进去即可。

### 自己的 agent

L.O.V.E. 只要求三件事，满足即接入：
1. 能读 `~/.love/agent.md` 作为人格
2. 能读 `~/.love/MEMORY.md` 并更新它
3. 能往 `~/.love/memory/` 追加每日笔记

## 验证接入成功

```bash
cd ~/.love && git log --oneline      # 跑了一天之后，应该有不只一条 commit
```

如果记忆有提交、每日笔记有更新——你的 agent 已经住进来了 🐾
