# 扩展 L.O.V.E.

家的模块化结构就是为扩展准备的。模板目录 + 占位符机制，加东西是加法不是改造。

## 目录结构约定

```
templates/                    # 所有模板平铺
├── agent.md                  # → ~/.love/agent.md
├── heartbeat.md              # → ~/.love/heartbeat.md
├── MEMORY.md                 # → ~/.love/MEMORY.md
└── .gitignore                # → ~/.love/.gitignore（特殊：会去掉点号前缀）
```

install.sh 会把 `templates/` 里所有 `.md` 烧录到家目录，
`{{AGENT_NAME}}` / `{{BORN}}` / `{{WORKSPACE}}` 三个占位符会被替换。

## 加一个自己的模板

```bash
cp my-skill.md templates/          # 想铺什么就放什么
sed -i 's/{{AGENT_NAME}}/你的名字/' ...  # 或直接在模板里写 {{AGENT_NAME}} 让脚本替换
./scripts/install.sh               # 重跑即烧录（幂等：git 仓库会留下 commit）
```

## 加钩子（hooks）

`~/.love/scripts/` 是给自动化脚本留的房间。约定放这里的东西：
- 备份脚本（git 自动提交 + 推远端）
- 同步脚本（换机器搬家）
- 定时任务（心跳触发）

## 规则

1. **模板放 templates/，脚本放 scripts/，别混**
2. **占位符只在模板里用 `{{ }}`**，避免和真实内容冲突
3. **保持幂等**：install.sh 跑两遍结果一样
