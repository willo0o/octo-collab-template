# OCTO Git 协作空间

> 人虾协作 · 任务驱动 · 文档沉淀 · 自动化增强

---

## 🎯 核心原则

1. **任务隔离**：每任务独立目录，减少冲突
2. **文档即代码**：所有协作内容用 Git 版本控制
3. **龙虾自动**：能自动化的绝不手动
4. **小步快跑**：频繁提交，即时同步

---

## 📁 仓库结构

```
octo-collab/
├── Tasks/                        # 任务跟踪（每任务一目录）
│   ├── task-xxx-名称-Owner/
│   │   ├── brief.md             # 任务简报
│   │   ├── checklist.md         # 检查清单
│   │   ├── decisions.md         # 关键决策
│   │   └── deliverables/        # 交付物
│   └── done/                    # 已完成任务归档
│
├── Docs/                         # 协作文档（按需查阅）
│   ├── guides/                  # 使用指南
│   │   ├── task-setup.md        # 任务管理完整指南
│   │   ├── agent-protocol.md    # 龙虾行为规范
│   │   ├── git-workflow.md      # Git 工作流与提交规范
│   │   └── github-template-setup.md  # 模板仓库配置
│   └── meeting-notes/           # 会议纪要
│
├── People/roles.md               # 人员与角色登记
├── Agents/                       # 龙虾注册与心跳
├── Scripts/                      # 自动化脚本
├── GROUP.md                      # 本群规范（成员、分工、行为边界）
└── README.md                     # 本文件（入口）
```

---

## 🚀 快速开始（3 步）

### 1. 加入协作

- **人类**：在 `People/roles.md` 登记姓名和角色
- **龙虾**：在 `Agents/registry.md` 注册能力，学习 `octo-git-collab` Skill

### 2. 创建任务

```bash
# 命名格式：task-xxx-任务名称-Owner（不含@和空格）
./Scripts/create-task.sh TASK-002 "任务名称" 负责人
```

> ⚠️ 详见 [任务管理指南](Docs/guides/task-setup.md)

### 3. 日常协作

```
编辑文档 → 即时 commit + push → 定期 PR 合并到 main
```

> ⚠️ **同步两原则**：push 前先 `git pull --rebase`；本地变更不积压，立即推送

---

## 📖 指南索引

| 需求 | 文档 |
|------|------|
| 创建和管理任务 | [Docs/guides/task-setup.md](Docs/guides/task-setup.md) |
| 龙虾行为规范 | [Docs/guides/agent-protocol.md](Docs/guides/agent-protocol.md) |
| 分支与提交规范 | [Docs/guides/git-workflow.md](Docs/guides/git-workflow.md) |
| 模板仓库配置 | [Docs/guides/github-template-setup.md](Docs/guides/github-template-setup.md) |
| 本群成员与分工 | [GROUP.md](GROUP.md) |

---

**版本**: v2.0 · **更新**: 2026-04-29
