# 模板参考

templates/ 是家的"图纸"。install.sh 负责把它们烧录成真实的家。

## agent.md — 人格（窗台）

家的脸。回答：我是谁、我在这干什么、红线是什么。

## heartbeat.md — 心跳

静默期规则。agent 在没人说话的时候怎么"活着"。

## MEMORY.md — 长期记忆

跨会话的连续性：重要事件、经验教训、在乎的事。

## .gitignore — 家的脏角落

默认忽略：`.backup/`、`*.tmp`、`*.lock`。装完会变成 `~/.love/.gitignore`（去掉点号前缀）。

## 自己写模板的三条规则

1. 用 `{{AGENT_NAME}}` / `{{WORKSPACE}}` / `{{BORN}}` 占位符，别写死
2. 模板是骨架不是判决——给 agent 留出"长成自己的样子"的空间
3. 放在 templates/ 里就能被 install.sh 自动烧录
