# 配置参考

## 环境变量

install.sh 支持用环境变量跳过交互：

| 变量 | 作用 | 默认 |
| ---- | ---- | ---- |
| `AGENT_NAME` | agent 的名字 | 交互询问 |
| `LOVE_HOME` | 家的路径 | `~/.love` |
| `PLATFORM` | 强制平台：`wsl` / `docker` / `native` | 自动探测 |

```bash
AGENT_NAME=miku LOVE_HOME=~/.love PLATFORM=docker ./scripts/install.sh
```

## 家的布局（装完之后）

```
~/.love/
├── agent.md            # 人格（窗台）
├── heartbeat.md        # 心跳规则
├── MEMORY.md           # 长期记忆
├── memory/             # 每日笔记 YYYY-MM-DD.md
├── scripts/            # 自动化脚本（备份/同步/心跳）
├── .backup/            # 备份暂存
└── .git/               # 自带版本管理
```

## 占位符

模板里可用的占位符，install 时替换：

| 占位符 | 替换为 | 示例 |
| ---- | ---- | ---- |
| `<<AGENT_NAME>>` | agent 名字 | `miku` |
| `<<WORKSPACE>>` | 家的路径 | `/home/miku/.love` |
| `<<BORN>>` | 安装日期 | `2026-08-11` |

## 搬迁 / 换机

```bash
# 旧机器：打包
tar czf love-backup.tar.gz ~/.love

# 新机器：先跑 install.sh 铺骨架，再把旧内容解压覆盖
./scripts/install.sh
tar xzf love-backup.tar.gz -C ~
```

记忆的 git 历史跟着一起走——**生命体的过去不会丢**。
