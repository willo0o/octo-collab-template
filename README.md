# OCTO Git 协作空间

> 人虾协作 · 任务驱动 · 文档沉淀 · 自动化增强

[TOC]

## 🎯 核心原则

1. **任务隔离**：每任务独立目录，减少冲突
2. **文档即代码**：所有协作文本用 Git 版本控制
3. **龙虾自动**：能自动化的绝不手动
4. **小步快跑**：频繁提交，小 PR 易评审

---

## 📁 仓库结构

```
octo-collab/
├── tasks/                      # 任务跟踪（每任务一目录）
│   ├── TASK-XXX-名称-@Owner/   # 任务目录（必须包含负责人）
│   │   ├── brief.md           # 任务简报
│   │   ├── checklist.md       # 检查清单
│   │   ├── decisions.md       # 关键决策
│   │   └── deliverables/      # 交付物
│   └── done/                   # 已完成任务归档
│
├── docs/                       # 协作文档
│   ├── meeting-notes/         # 会议纪要
│   ├── specs/                 # 规范
│   └── guides/                # 指南
│
├── people/                     # 人员与角色
├── agents/                     # 龙虾配置
└── README.md                   # 本文件
```

---

## 🚀 快速开始

### 1. 创建任务

```bash
# 克隆仓库
git clone <repo-url>
cd octo-collab

# 创建 dev 分支（保护主分支）
git checkout -b dev
git push -u origin dev

# 创建任务分支
git checkout -b feature/TASK-001-任务名称

# 创建任务目录（命名规范：TASK-XXX-任务名称-@Owner）
./scripts/create-task.sh TASK-001 "任务名称" @Owner
```

### 2. 加入协作

- **人类**：在 `people/roles.md` 登记角色
- **龙虾**：在 `agents/registry.md` 注册能力

### 3. 日常流程

```
晨会 → 切换到个人分支 → 编辑文档 → 提交 → 定期 PR 合并
```

---

## 📋 任务管理

### 状态流转

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

### 更新任务状态

```bash
# 编辑任务简报中的状态字段
vim tasks/TASK-001-xxx/brief.md

# 提交
git add tasks/TASK-001-xxx/
git commit -m "[TASK-001] status: 进行中 → 待评审"
git push
```

---

## 📝 文档规范

### 会议纪要

位置：`docs/meeting-notes/YYYY-MM-DD-meeting.md`

模板：
```markdown
# YYYY-MM-DD 会议主题

**参会**: @某人 @某人
**记录**: @记录员

## 关键决策
1. [决策] - [@决策人]

## 行动项
- [ ] [任务] - @负责人 - 截止日
```

### 提交信息规范

```
[TASK-001] feat: 功能描述
[TASK-001] docs: 文档更新
[MEETING] YYYY-MM-DD 纪要
[CHORE] 描述
```

---

## 🤖 龙虾协作协议

### 龙虾职责

| 场景 | 龙虾行动 |
|------|---------|
| 会议中 | 自动记录纪要、提取行动项 |
| 任务更新 | 追踪进度、预警风险 |
| 文档变更 | 自动同步、版本比对 |
| 每日站会 | 汇总进展、生成报告 |

### 龙虾心跳

每小时更新 `agents/availability.md`：

```markdown
## 2026-04-22 17:00

- @Arist: 🟢 在线（处理 TASK-001）
- @Octo-1: 🟡 忙碌（代码生成中）
```

---

## 🔧 自动化（GitHub Actions）

### 已配置

- ✅ 每日站会报告（09:00 UTC+8）
- ✅ 截止日提醒（提前 3 天）
- ✅ PR 自动标签
- ⏳ 文档同步（飞书 ↔ Markdown）

### 添加自动化

在 `.github/workflows/` 下创建 YAML 文件。

示例：截止日提醒
```yaml
name: 截止日提醒
on:
  schedule:
    - cron: '0 9 * * *'  # 每天 9 点
jobs:
  remind:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: 检查即将截止任务
        run: ./scripts/check-deadlines.sh
```

---

## 📊 分支策略

```
main              # 稳定版本（受保护）
├── dev           # 开发分支
├── feature/xxx   # 功能分支
└── hotfix/xxx    # 紧急修复
```

### 合并规则

- `feature/*` → `dev`：需 1 人评审
- `dev` → `main`：需 2 人评审 + CI 通过
- `hotfix/*` → `main`：需 1 人评审 + 紧急标签

---

## 🎓 学习资源

- [任务创建指南](docs/guides/task-setup.md)
- [会议纪要模板](docs/guides/meeting-template.md)
- [龙虾协作协议](docs/guides/agent-protocol.md)

---

**版本**: v1.0  
**创建**: 2026-04-22  
**维护**: OCTO 协作组
