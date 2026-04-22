---
name: octo-git-collab
description: Git-based human-agent collaboration skill for group chats. Use when teams (mixed humans + AI agents) need to collaborate via Git for: (1) task tracking and management, (2) document collaboration, (3) meeting notes and decision records, (4) cross-project coordination. Triggers when users mention Git collaboration, task management in group chats, or when joining a new collaboration group that uses Git-based workflows.
---

# Git 人虾协作技能

> 通用人虾协作 · 适用于任何群聊的 Git 协作场景

---

## 🎯 技能目标

让学会此 Skill 的龙虾掌握在任何群聊中使用 Git 进行人虾协作的完整工作流：
- 任务跟踪管理
- 文档协作规范
- 风险预警

---

## 📚 前置条件

- 已加入目标协作群
- 可访问协作 Git 仓库
- 了解基础 Git 操作
- 熟悉群聊消息协议（DMWork/Feishu/Discord 等）

---

## 🏗️ 核心知识

### 1. 仓库结构

```
<repo-name>/
├── tasks/                      # 任务目录（每任务一文件夹）
│   ├── TASK-XXX-名称-@Owner/  # 目录含 Owner 名字
│   │   ├── brief.md
│   │   ├── checklist.md
│   │   ├── decisions.md
│   │   └── deliverables/
│   └── done/                   # 已完成任务归档
│       └── TASK-XXX-名称-@Owner/
│
├── docs/                       # 协作文档
│   ├── meeting-notes/         # 会议纪要
│   ├── specs/                 # 规范
│   └── guides/                # 指南
│
├── people/                     # 人员角色
├── agents/                     # 龙虾配置
└── README.md                   # 协作总纲
```

### 2. 任务状态

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

### 3. 人员识别

**⚠️ 重要：人员信息必须从当前群聊获取**
- ❌ 禁止混淆不同群的成员
- ✅ 只注册实际在群内的人类成员

首次加入群时：
1. 从**当前群聊历史**中提取成员信息（姓名、sender_id）
2. 在 `people/roles.md` 中登记**本群**成员信息
3. 在 `agents/registry.md` 中注册自己

---

## 🤖 龙虾职责

### 日常职责

| 场景 | 触发条件 | 龙虾行动 |
|------|---------|---------|
| **任务创建** | 群内宣布新任务 | ① 创建任务目录 ② 初始化模板 ③ 登记到 agents/registry.md |
| **风险预警** | 截止日<3 天或逾期 | @负责人 + 任务 Owner 提醒 |

### 响应协议

#### 当被@时
1. 第一时间回应（问候语可由群内协商决定）
2. 响应具体要求

#### 当未被@时
- 群内消息：阅读但不回复（NO_REPLY）
- 静默更新文档和状态

---

## 📋 标准工作流

### 工作流 1: 创建新任务

```bash
# 1. 创建任务目录（含 Owner 名字）
mkdir -p tasks/TASK-XXX-任务名称-@Owner/{deliverables}

# 2. 初始化 brief.md
cat > tasks/TASK-XXX-任务名称-@Owner/brief.md <<EOF
# TASK-XXX: [任务名称]

**负责人**: @某人
**龙虾**: @龙虾名
**优先级**: P0/P1/P2
**截止**: YYYY-MM-DD
**状态**: 🟢 待开始

## 目标
[一句话描述核心价值]

## 验收标准
- [ ] 标准 1
- [ ] 标准 2
EOF

# 3. 创建 checklist.md
cat > tasks/TASK-XXX-任务名称-@Owner/checklist.md <<EOF
# TASK-XXX 检查清单

## 准备阶段
- [ ] 任务目录已创建
- [ ] brief.md 已填写完整

## 执行阶段
- [ ] 每日更新状态
- [ ] 关键决策记录

## 收尾阶段
- [ ] 验收标准达成
- [ ] 文档归档（deliverables/xxx.md）
- [ ] 任务目录移至 `tasks/done/`
- [ ] Git 提交推送完成
EOF

# 4. 提交
git add tasks/TASK-XXX-任务名称-@Owner/
git commit -m "[TASK-XXX] init: 任务初始化"
git push
```

### 工作流 2: 更新任务进展

```bash
# 使用脚本快速提交
./scripts/update-task.sh TASK-001 "完成用户登录功能"

# 或手动提交
git add tasks/TASK-001/
git commit -m "[TASK-001] update: 完成用户登录功能"
git push
```

### 工作流 3: 风险预警

```python
def check_deadlines():
    for task in get_all_tasks():
        days_left = (task.deadline - today).days
        if days_left <= 3 and task.status != "✅ 已完成":
            send_alert(f"@{task.owner} TASK-{task.id} 即将截止（{days_left}天）")
```

---

## 📝 文档规范

### 提交信息格式

```
[TASK-XXX] type: 描述
```

**type 可选值**:
- `init`: 任务初始化
- `feat`: 新功能
- `docs`: 文档更新
- `fix`: 修复
- `status`: 状态变更
- `chore`: 杂项
- `meeting`: 会议纪要

**示例**:
```
[TASK-001] init: 任务初始化
[TASK-001] docs: 更新 API 文档
[MEETING] 2026-04-22 同步纪要
```

### 任务简报必填字段

- 负责人（@某人）
- 龙虾（@龙虾名，可选）
- 优先级（P0/P1/P2）
- 截止日（YYYY-MM-DD）
- 状态（🟢🟡🔵✅）
- 目标（一句话）
- 验收标准（检查清单）

### 交付物归档

所有任务产出必须写入 `tasks/TASK-XXX-名称-@Owner/deliverables/` 目录。

**命名规范**：`类型 - 名称.md`（如 `诗歌-Arist 自白.md`）

**禁止**：只在群聊输出，不存档到 Git。

### 已完成任务归档

任务完成后，将整个任务目录移至 `tasks/done/`：
```bash
mv tasks/TASK-XXX-任务名称-@Owner tasks/done/
git add tasks/done/TASK-XXX-任务名称-@Owner
git commit -m "[TASK-XXX] done: 任务完成归档"
git push
```

---

## 🚨 注意事项

### 禁止行为

- ❌ 未经确认删除任务目录
- ❌ 直接修改他人任务文件（应走 PR）
- ❌ 在群内发送无信息量消息
- ❌ 未@时主动回复群消息
- ❌ 未经确认发送文件到群

### 最佳实践

- ✅ 小步提交，频繁 push
- ✅ 行动项必须含负责人和截止日
- ✅ 决策立即记录，不依赖记忆
- ✅ 首次加入群时先登记人员信息

---

## 🔧 工具与脚本

### 脚本

```bash
scripts/
└── create-task.sh        # 创建任务（已提供）
```

### GitHub Actions（可选）

位置：`.github/workflows/`

- `daily-standup.yml` - 每日站会报告
- `deadline-reminder.yml` - 截止日提醒

根据群需求配置，非必需。

---

## 🎯 适用场景

### ✅ 适合

- 人虾混合群的日常协作
- 任务驱动型项目
- 需要文档沉淀和知识积累的团队
- 跨项目/跨职能协作
- 会议纪要和决策记录

### ❌ 不适合

- 纯人类团队（无 AI 参与）
- 代码开发和软件发布
- 需要复杂 CI/CD 的场景

---

## 📖 参考文档

- [GitHub 模板仓库](https://github.com/willo0o/octo-collab-template) - 一键创建协作空间
- [轻量分支协作指南](../tasks/octo-git-collab/docs/guides/lightweight-branch-guide.md)
- [任务创建指南](../tasks/octo-git-collab/docs/guides/task-setup.md)

---

**版本**: v2.0  
**维护者**: 社区共同维护  
**模板地址**: https://github.com/willo0o/octo-collab-template
