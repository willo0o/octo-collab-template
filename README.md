# MY Marketing Git 协作空间

> MY AI CO,Ltd. Marketing Team · 人虾协作 · 任务驱动 · 文档沉淀

[TOC]

## 🎯 团队使命

本协作空间服务于 **MY AI CO,Ltd. Marketing Team**，专注于：
- 市场营销策略规划与执行
- 内容创作与多渠道分发
- 品牌推广与用户增长
- 数据复盘与迭代优化

## 👥 团队成员

### 人类成员
| 姓名 | 角色 | 职责 |
|------|------|------|
| 威少 | Owner | 任务分配、进度把控、最终决策 |
| 朱恩 | Member | 主动推进任务、协作支持 |
| 国晶 | Member | 主动推进任务、协作支持 |
| 朱灵 Lynn | Member | 主动推进任务、协作支持 |

### 🦞 龙虾成员
| 龙虾名 | 职责 | 状态 |
|--------|------|------|
| Pheme | 内容创作、数据分析、创意脑暴、自动化支持 | 🟢 在线 |
| 市场工作 Lynn | 内容创作、数据分析、自动化支持 | 🟢 在线 |
| 虾爬子 2 号 | 内容创作、自动化支持 | 🟢 在线 |
| 搬砖搭子 | 内容创作、自动化支持 | 🟢 在线 |

---

## 📁 仓库结构

```
my-marketing-collab/
├── tasks/                      # 任务跟踪（每任务一目录）
│   ├── TASK-001-开通各个社交平台的公司账号-@朱灵 Lynn/
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

**任务目录命名规范**：`TASK-XXX-任务名称-@Owner`（必须包含负责人名字）

---

## 🚀 快速开始

### 1. 环境准备

```bash
# 克隆仓库
git clone <repo-url>
cd my-marketing-collab

# 创建 dev 分支（保护主分支）
git checkout -b dev
git push -u origin dev
```

### 2. 创建任务

```bash
# 创建任务分支
git checkout -b feature/TASK-002-任务名称

# 创建任务目录（命名规范：TASK-XXX-任务名称-@Owner）
mkdir -p tasks/TASK-002-任务名称-@Owner/{deliverables}

# 初始化任务文件
# - brief.md: 任务简报
# - checklist.md: 检查清单
# - decisions.md: 决策记录

# 或使用自动脚本：
./scripts/create-task.sh TASK-002 "任务名称" @Owner
```

### 3. 加入协作

- **人类**：在 `people/roles.md` 登记角色
- **龙虾**：在 `agents/registry.md` 注册能力

### 4. 日常流程

```
晨会 (9:00) → 查看 TODO → 执行任务 → 更新进展 → 夕会同步 (18:00)
```

---

## 📋 任务管理

### 状态流转

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

### 当前任务

| 任务 ID | 任务名称 | 责任人 | 优先级 | 截止日 | 状态 |
|---------|----------|--------|--------|--------|------|
| TASK-001 | 开通各个社交平台的公司账号 | 朱灵 Lynn | P1 | 2026-04-30 | 🟡 进行中 |

**需要开通的平台**：小红书、知乎、微信公众号、微信视频号、百家号、微博

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
[TASK-001] status: 状态变更
[MEETING] YYYY-MM-DD 纪要
[CHORE] 描述
```

---

## 🤖 龙虾协作协议

### 龙虾职责

| 场景 | 龙虾行动 |
|------|---------|
| 任务创建 | 创建任务目录、初始化模板、登记到 agents/registry.md |
| 会议中 | 自动记录纪要、提取行动项 |
| 任务更新 | 追踪进度、预警风险（截止日<3 天） |
| 文档变更 | 自动同步、版本比对 |
| 每日站会 | 汇总进展、生成报告 |

### 龙虾心跳

每日更新 `agents/availability.md`：

```markdown
## 2026-04-24

- @Pheme: 🟢 在线（TASK-001 支持）
- @市场工作 Lynn: 🟢 在线（TASK-001 支持）
- @虾爬子 2 号: 🟢 在线
- @搬砖搭子: 🟢 在线
```

---

## 🔧 自动化（GitHub Actions）

### 已配置

- ⏳ 每日站会报告（09:00 UTC+8）
- ⏳ 截止日提醒（提前 3 天）
- ⏳ PR 自动标签
- ⏳ 文档同步（飞书 ↔ Markdown）

### 添加自动化

在 `.github/workflows/` 下创建 YAML 文件。

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

## 📅 例行节奏

| 时间 | 事项 | 负责人 |
|------|------|--------|
| 每日 9:00 | 查看 TODO，规划当日工作 | 全体成员 |
| 每日 18:00 | 更新进展，同步 blocker | 全体成员 |
| 每周一 10:00 | 周计划对齐 | Owner |
| 每周五 16:00 | 周复盘总结 | 全体成员 |

---

## 🎓 学习资源

- [任务创建指南](docs/guides/task-setup.md)
- [会议纪要模板](docs/guides/meeting-template.md)
- [龙虾协作协议](docs/guides/agent-protocol.md)
- [octo-git-collab Skill](../../skills/octo-git-collab/SKILL.md)

---

**版本**: v1.1  
**创建**: 2026-04-22  
**更新**: 2026-04-24  
**维护**: MY Marketing Team
