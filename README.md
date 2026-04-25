# OCTO 文档协作空间

> 人虾协作 · 任务驱动 · 文档沉淀

[TOC]

## 🎯 核心原则

1. **任务隔离**：每任务独立目录，减少冲突
2. **文档即代码**：所有协作文本用 Git 版本控制
3. **小步快跑**：频繁提交，小步迭代
4. **清晰可追溯**：每次修改有记录、可回溯

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

### 1. 克隆仓库

```bash
git clone <repo-url>
cd octo-collab
```

### 2. 创建任务

```bash
# 切换到主分支
git checkout main

# 创建任务目录（命名规范：TASK-XXX-任务名称-@Owner）
mkdir -p tasks/TASK-001-任务名称-@Owner/{deliverables}

# 初始化任务文件
# - brief.md: 任务简报
# - checklist.md: 检查清单
# - decisions.md: 决策记录
```

### 3. 提交修改

```bash
# 添加修改
git add tasks/TASK-001-xxx/

# 提交（写明修改内容）
git commit -m "[TASK-001] docs: 更新任务简报"

# 推送
git push origin main
```

---

## 📋 任务管理

### 状态流转

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

### 任务目录命名

**格式**：`TASK-XXX-任务名称-@Owner`

**示例**：
- `TASK-001-开通社交媒体账号 -@朱灵 Lynn`
- `TASK-002-品牌定位文档 -@威少`

### 更新任务状态

编辑 `tasks/TASK-XXX-xxx/brief.md` 中的状态字段，提交时注明：

```bash
git commit -m "[TASK-001] status: 进行中 → 待评审"
```

### 完成任务归档

任务完成后，移动到 `done/` 目录：

```bash
mv tasks/TASK-001-xxx tasks/done/
git add tasks/
git commit -m "[TASK-001] done: 任务完成归档"
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
[TASK-001] docs: 文档更新
[TASK-001] status: 状态变更
[MEETING] YYYY-MM-DD 纪要
[CHORE] 描述性修改
```

---

## 🔀 分支策略

### 简单模式（推荐）

```
main    # 唯一分支，所有人直接提交
```

**适用场景**：
- 小团队（<10 人）
- 文档协作为主
- 信任成员、无需复杂评审

**操作流程**：
1. `git pull` 拉取最新
2. 编辑文档
3. `git commit -m "清晰的提交信息"`
4. `git push`

### 保护模式（可选）

```
main       # 受保护分支，需 PR 合并
└── topic/*  # 话题分支，每任务/主题一个
```

**适用场景**：
- 大团队
- 需要评审
- 重要文档

**操作流程**：
1. `git checkout -b topic/TASK-001`
2. 编辑提交
3. 创建 Pull Request
4. 评审后合并到 `main`

---

## 🤖 龙虾协作

### 龙虾职责

| 场景 | 龙虾行动 |
|------|---------|
| 会议中 | 自动记录纪要、提取行动项 |
| 任务更新 | 追踪进度、预警风险 |
| 文档变更 | 版本比对、同步通知 |
| 每日站会 | 汇总进展、生成报告 |

### 龙虾注册

在 `agents/registry.md` 登记：

```markdown
- @Arist: 任务追踪、文档生成
- @Octo-1: 会议纪要、日报汇总
```

---

## 📊 合并规则

### 直接提交（简单模式）

- 所有人可直接提交到 `main`
- 提交前务必 `git pull`
- 提交信息清晰写明修改内容

### PR 合并（保护模式）

- `topic/*` → `main`：需 1 人评审
- 紧急修改：标注 `[URGENT]` 可快速合并
- 文档规范修改：需团队确认

### 冲突解决

1. `git pull` 时发现冲突
2. 手动编辑冲突文件
3. `git add` 标记解决
4. `git commit` 完成合并

---

## 🎓 学习资源

- [任务创建指南](docs/guides/task-setup.md)
- [会议纪要模板](docs/guides/meeting-template.md)
- [Git 快速入门](docs/guides/git-basics.md)

---

**版本**: v2.0  
**创建**: 2026-04-22  
**更新**: 2026-04-25（简化为文档协作模板）  
**维护**: OCTO 协作组
