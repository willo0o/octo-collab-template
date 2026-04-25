# OCTO 文档协作空间

> 人虾协作 · 任务驱动 · 文档沉淀

[TOC]

## 🎯 团队使命

本协作空间基于 Git 管理团队任务和文档，专注于：
- 任务跟踪与进度管理
- 内容协作与文档沉淀
- 决策记录与知识积累
- 人虾（Human + AI）高效协同

## 👥 团队成员

### 人类成员
| 姓名 | 角色 | 职责 |
|------|------|------|
| Owner | 发起人/决策者 | 任务分配、进度把控、最终决策 |
| Member | 执行者 | 主动推进任务、协作支持 |

### 🦞 龙虾成员
| 龙虾名 | 职责 | 状态 |
|--------|------|------|
| @龙虾名 | 任务追踪、文档生成、会议纪要 | 🟢 在线 |

---

## 📁 仓库结构

```
octo-collab/
├── Tasks/                      # 任务跟踪（每任务一目录）
│   ├── task-xxx-名称-Owner/   # 任务目录（必须包含负责人）
│   │   ├── brief.md           # 任务简报
│   │   ├── checklist.md       # 检查清单
│   │   ├── decisions.md       # 关键决策
│   │   └── deliverables/      # 交付成果
│   └── done/                   # 已完成任务归档
│
├── Docs/                       # 协作文档
│   ├── meeting-notes/         # 会议纪要
│   ├── guides/                # 使用指南
│   └── QUICKSTART.md          # 快速上手指南
│
├── People/                     # 人员与角色
├── Agents/                     # 龙虾注册表
├── Scripts/                    # 自动化脚本
├── GROUP.md                    # 群规与协作规范
├── TODO.md                     # 任务主索引
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
# 使用脚本创建任务（推荐）
./Scripts/create-task.sh task-002 "任务名称" 负责人

# 或手动创建
mkdir -p Tasks/task-002-任务名称-Owner/{deliverables}
```

### 3. 提交修改

```bash
git add Tasks/task-002-xxx/
git commit -m "[task-002] docs: 更新任务简报"
git push origin main
```

---

## 📋 任务管理

### 状态流转

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

### 任务目录命名

**格式**：`task-xxx-任务名称-Owner`

**示例**：
- `task-001-开通社交媒体账号-朱灵Lynn`
- `task-002-品牌定位文档-威少`

**⚠️ 强制要求**：
1. 任务目录必须包含 Owner 名字，便于识别和检索
2. **不要使用 `@` 符号**（避免 Git 目录名问题）
3. **不要使用空格**，用连字符 `-` 替代

### 更新任务状态

编辑 `Tasks/task-xxx/brief.md` 中的状态字段：

```bash
git commit -m "[task-001] status: 进行中 → 待评审"
```

### 完成任务归档

```bash
mv Tasks/task-001-xxx Tasks/done/
git add Tasks/
git commit -m "[task-001] done: 任务完成归档"
git push
```

---

## 📝 文档规范

### 会议纪要

位置：`Docs/meeting-notes/YYYY-MM-DD-meeting.md`

```markdown
# YYYY-MM-DD 会议主题

**参会**: 某人 某人  
**记录**: 记录员

## 关键决策
1. [决策] - [决策人]

## 行动项
- [ ] [任务] - 负责人 - 截止日
```

### 提交信息规范

```
[task-001] docs: 文档更新
[task-001] status: 状态变更
[task-001] done: 任务完成归档
[MEETING] YYYY-MM-DD 纪要
[CHORE] 描述性修改
```

---

## 🔀 分支策略

### 简单模式（推荐）

```
main    # 唯一分支，所有人直接提交
```

**适用场景**：小团队（<10 人）、文档协作为主、信任成员

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

**操作流程**：
1. `git checkout -b topic/task-001`
2. 编辑提交
3. 创建 Pull Request → 评审 → 合并

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

在 `Agents/registry.md` 登记龙虾信息和能力。

---

## 📅 例行节奏

| 时间 | 事项 | 负责人 |
|------|------|--------|
| 每日 9:00 | 查看 TODO，规划当日工作 | 全体成员 |
| 每日 18:00 | 更新进展，同步 blocker | 全体成员 |
| 每周一 10:00 | 周计划对齐 | Owner |
| 每周五 16:00 | 周复盘总结 | 全体成员 |

---

## 📊 合并规则

- 所有人可直接提交到 `main`（简单模式）
- 提交前务必 `git pull`
- 冲突解决：手动编辑 → `git add` → `git commit`

---

## 🎓 学习资源

- [快速上手指南](Docs/QUICKSTART.md)
- [任务创建指南](Docs/guides/task-setup.md)
- [龙虾协作协议](Docs/guides/agent-protocol.md)
- [群规与协作规范](GROUP.md)
- [任务主索引](TODO.md)

---

**版本**: v3.0  
**创建**: 2026-04-22  
**更新**: 2026-04-25（基于 my.inc-marketing 实践优化）  
**维护**: OCTO 协作组
