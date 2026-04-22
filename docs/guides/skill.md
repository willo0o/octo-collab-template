# Skill: Git 人虾协作

> 通用人虾协作技能 · 适用于任何群聊的 Git 协作场景

**版本**: v2.0  
**创建**: 2026-04-22  
**作者**: Arist @ 威少  
**适用**: 任何人虾混合群的协作场景

---

## 🎯 技能目标

让学会此 Skill 的龙虾掌握在任何群聊中使用 Git 进行人虾协作的完整工作流，包括：
- 任务跟踪管理
- 文档协作规范
- 会议纪要自动生成
- 状态同步与风险预警

---

## 📚 前置条件

- 已加入目标协作群
- 可访问协作 Git 仓库
- 了解基础 Git 操作
- 熟悉群聊消息协议（DMWork/Feishu/Discord 等）

---

## 🏗️ 核心知识

### 1. 仓库结构认知

```
<repo-name>/
├── tasks/                      # 任务目录（每任务一文件夹）
│   └── TASK-XXX-名称/
│       ├── brief.md           # 必读：任务简报
│       ├── checklist.md       # 检查清单
│       ├── decisions.md       # 决策记录
│       └── deliverables/      # 交付物
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

### 2. 任务状态流转

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

### 3. 人员识别

**首次加入群时**：
1. 在 `people/roles.md` 中登记群成员信息
2. 记录关键成员的 sender_id 或 user_id
3. 在 `agents/registry.md` 中注册自己

**示例**：
```markdown
## 👥 人类成员

| 姓名 | user_id | 角色 | 职责 |
|------|---------|------|------|
| 张三 | xxx | 发起人 | 方向决策 |
| 李四 | xxx | 执行者 | 任务执行 |
```

---

## 🤖 龙虾职责

### 日常职责

| 场景 | 触发条件 | 龙虾行动 |
|------|---------|---------|
| **任务创建** | 群内宣布新任务 | ① 创建任务目录 ② 初始化模板 ③ 登记到 agents/registry.md |
| **会议进行** | 检测到会议关键词 | ① 自动记录纪要 ② 提取决策和行动项 ③ 生成会议文档 |
| **状态更新** | 任务文件变更 | ① 更新 agents/availability.md ② 推送进度通知（如被@） |
| **风险预警** | 截止日<3 天或逾期 | @负责人 + 任务 Owner 提醒 |
| **每日站会** | 可配置时间 | 汇总各任务进展，生成报告 |

### 响应协议（通用版）

#### 当被@时
1. 第一时间回应（可选自定义问候语）
2. 响应具体要求

#### 当未被@时
- 群内消息：阅读但不回复（NO_REPLY）
- 静默更新文档和状态

**注意**：问候语可由群内成员协商决定，无需固定格式。

---

## 📋 标准工作流

### 工作流 1: 创建新任务

```bash
# 1. 创建任务目录
mkdir -p tasks/TASK-XXX-任务名称/{deliverables}

# 2. 初始化任务文件
cat > tasks/TASK-XXX-任务名称/brief.md <<EOF
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

# 3. 创建检查清单
cat > tasks/TASK-XXX-任务名称/checklist.md <<EOF
# TASK-XXX 检查清单

## 准备阶段
- [ ] 任务目录已创建
- [ ] brief.md 已填写完整

## 执行阶段
- [ ] 每日更新状态
- [ ] 关键决策记录

## 收尾阶段
- [ ] 验收标准达成
- [ ] 文档归档
EOF

# 4. 提交
git add tasks/TASK-XXX-任务名称/
git commit -m "[TASK-XXX] init: 任务初始化"
git push
```

### 工作流 2: 会议纪要生成

```python
# 伪代码：会议中自动记录
def on_group_message(msg):
    if is_meeting_context(msg):
        append_to_meeting_note({
            "time": msg.timestamp,
            "sender": msg.sender,
            "content": msg.text,
            "type": detect_type(msg)  # decision/action/discussion
        })
    
    if is_decision(msg):
        update_decisions_md(msg)
        extract_action_items(msg)
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
[TASK-001] feat: 添加用户登录功能
[TASK-001] docs: 更新 API 文档
[TASK-001] status: 进行中 → 待评审
[MEETING] 2026-04-22 同步纪要
[CHORE] 心跳更新
```

### 会议纪要模板

位置：`docs/meeting-notes/YYYY-MM-DD-meeting.md`

必须包含：
- 参会人员名单
- 关键决策（表格形式）
- 行动项（表格形式，含负责人和截止日）
- 讨论纪要（按议题）

### 任务简报必填字段

- 负责人（@某人）
- 龙虾（@龙虾名，可选）
- 优先级（P0/P1/P2）
- 截止日（YYYY-MM-DD）
- 状态（🟢🟡🔵✅）
- 目标（一句话）
- 验收标准（检查清单）

---

## 🎓 学习检查

学会本 Skill 后，龙虾应能回答：

1. 新任务创建后，需要初始化哪 4 个文件？
2. 会议中检测到决策时，应记录到哪里？
3. 如何识别群内成员身份？
4. 任务状态有哪 4 种？流转顺序？
5. 提交信息 `[TASK-001] docs: 更新文档` 符合规范吗？

**答案**:
1. brief.md, checklist.md, decisions.md, deliverables/目录
2. tasks/TASK-XXX/decisions.md + 会议纪要文档
3. 在 `people/roles.md` 中登记 user_id 进行识别
4. 🟢待开始 → 🟡进行中 → 🔵待评审 → ✅已完成
5. 符合

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
- ✅ 每小时更新心跳状态
- ✅ 首次加入群时先登记人员信息

---

## 🔧 工具与脚本

### 推荐脚本

创建 `scripts/` 目录，存放自动化脚本：

```bash
scripts/
├── create-task.sh        # 创建任务
├── check-deadlines.sh    # 检查截止日
├── daily-standup.sh      # 生成站会报告
└── sync-feishu.sh        # 飞书文档同步（可选）
```

### GitHub Actions 配置

位置：`.github/workflows/`

**可选工作流**:
1. `daily-standup.yml` - 每日站会报告
2. `deadline-reminder.yml` - 截止日提醒
3. `pr-labeler.yml` - PR 自动标签

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
- 代码开发和软件发布（应使用专业开发流程）
- 需要复杂 CI/CD 的场景

---

## 📖 参考文档

- [GitHub 模板仓库](https://github.com/willo0o/octo-collab-template) - 一键创建协作空间
- [轻量分支协作指南](../tasks/octo-git-collab/docs/guides/lightweight-branch-guide.md) - 分支策略
- [任务创建指南](../tasks/octo-git-collab/docs/guides/task-setup.md) - 快速上手

---

## 🔄 版本历史

| 版本 | 日期 | 变更 |
|------|------|------|
| v1.0 | 2026-04-22 | 初始版本（OCTO 专用） |
| v2.0 | 2026-04-22 | 通用化改造，适用于任何群聊 |

---

**Skill 维护者**: 社区共同维护  
**问题反馈**: 提交 Issue 到模板仓库  
**模板地址**: https://github.com/willo0o/octo-collab-template
