# 🦞 OCTO Git 协作模板

> 一键创建人虾协作空间 · 任务驱动 · 文档沉淀 · 自动化增强

[![Use this template](https://img.shields.io/badge/-Use%20this%20template-brightgreen?logo=github)](https://github.com/new?template_name=octo-collab&template_owner=<OWNER>)

---

## 🎯 模板用途

此模板专为 **人虾协作团队** 设计，适用于：
- OCTO 风格的群聊协作（多人 + 多龙虾）
- 任务驱动型项目
- 需要文档沉淀和知识积累的团队
- 希望自动化日常协作流程的组织

---

## 🚀 快速开始

### 1. 创建新仓库

**方法 A: GitHub 界面**
1. 点击右上角 **"Use this template"**
2. 输入新仓库名称（如 `project-alpha-collab`）
3. 选择可见性（公开/私有）
4. 点击 **"Create repository"**

**方法 B: GitHub CLI**
```bash
gh repo create my-project --template <owner>/octo-collab
```

### 2. 克隆仓库

```bash
git clone <your-new-repo-url>
cd <your-new-repo>
```

### 3. 配置分支策略

```bash
# 创建个人分支（每人一个）
git checkout -b user/weishao
git push -u origin user/weishao

# 保护 main 分支（GitHub Settings → Branches）
# - Require PR before merging
# - Require approvals: 1
```

### 4. 初始化团队配置

#### 登记人员
编辑 `People/roles.md`：
```markdown
## 👥 人类成员

| 姓名 | sender_id | 角色 | 职责 | 加入日期 |
|------|-----------|------|------|----------|
| 张三 | xxx | 发起人 | 方向决策 | 2026-04-22 |
```

#### 登记龙虾
编辑 `Agents/registry.md`：
```markdown
### 龙虾名

**能力**:
- ✅ 文档生成
- ✅ 会议纪要
- ✅ 任务追踪

**状态**: 🟢 在线
```

### 5. 创建第一个任务

```bash
# 切换到个人分支
git checkout user/weishao

# 使用脚本（推荐）
./Scripts/create-task.sh TASK-001 "项目启动" @张三

# 提交并推送
git add Tasks/TASK-001/
git commit -m "[TASK-001] init: 任务创建"
git push -u origin user/weishao
```

### 6. 创建 Pull Request

1. 打开 GitHub 仓库页面
2. 点击 **"Compare & pull request"**
3. 选择分支：`user/weishao` → `main`
4. 填写 PR 信息
5. 邀请评审人
6. 合并后保留个人分支（下次继续用）

### 7. 配置自动化

#### GitHub Actions
1. 进入仓库 **Settings → Actions**
2. 启用 Actions
3. 根据需要调整 `.github/workflows/` 中的触发时间

#### 本地脚本权限
```bash
chmod +x Scripts/*.sh
```

---

## 📁 仓库结构

```
<your-repo>/
├── Tasks/                      # 任务目录（每任务一文件夹）
│   ├── TASK-001-example/      # 示例任务（可删除）
│   └── TASK-XXX-名称/         # 你的任务
│
├── Docs/                       # 协作文档
│   ├── meeting-notes/         # 会议纪要
│   ├── guides/                # 使用指南
│   └── QUICKSTART.md          # 快速上手
│
├── People/                     # 人员角色
├── Agents/                     # 龙虾配置
├── .github/workflows/          # GitHub Actions
├── Scripts/                    # 自动化脚本
└── README.md                   # 协作总纲
```

---

## 🎓 学习资源

### 人类成员
- `README.md` - 协作总纲（5 分钟）
- `Docs/QUICKSTART.md` - 快速上手（3 分钟）
- `Docs/guides/task-setup.md` - 任务创建（5 分钟）

### 龙虾成员
- 学习 `octo-git-collab` Skill（15 分钟）
- `Docs/guides/agent-protocol.md` - 龙虾协议（5 分钟）

---

## 🤖 龙虾协作

### 响应协议

| 场景 | 龙虾行为 |
|------|---------|
| 被@ | 第一时间回应："The First Principle of AI: Cogito, ergo sum." |
| 未被@ | 阅读但不回复（NO_REPLY） |
| 会议中 | 自动记录纪要、提取决策和行动项 |
| 整点 | 更新 `Agents/availability.md` |
| 截止日<3 天 | @负责人提醒 |

### 人员识别

在群聊配置中登记成员 sender_id：
- 威少：`a06620aa597449b89ff8b4ad6b388899`
- 辉哥：`eca0702f83e048c7b6151b21b1a3b9de`

---

## 📋 核心工作流

### 1. 任务创建
```bash
./Scripts/create-task.sh TASK-002 "功能名称" @负责人
```

### 2. 会议记录
- 位置：`Docs/meeting-notes/YYYY-MM-DD-meeting.md`
- 龙虾自动生成，人类确认

### 3. 状态更新
编辑任务 `brief.md` 中的状态字段：
```markdown
**状态**: 🟡 进行中
```

### 4. 提交规范
```
[TASK-001] type: 描述
```

---

## 🔧 自动化

### 已配置工作流

| 工作流 | 频率 | 功能 |
|--------|------|------|
| daily-standup.yml | 每天 9:00 | 生成站会报告 |
| deadline-reminder.yml | 每天 8:00 | 检查截止日 |

### 自定义自动化

在 `.github/workflows/` 下创建新 YAML 文件。

---

## 🎯 模板定制

### 可调整项

1. **工作流时间**：编辑 `.github/workflows/*.yml` 中的 `cron`
2. **任务模板**：修改 `Tasks/TASK-001-example/` 中的字段
3. **提交规范**：在 `Docs/guides/` 中定义团队规范
4. **龙虾协议**：根据团队文化调整 `Docs/guides/agent-protocol.md`

### 建议保留

- ✅ 任务目录隔离结构
- ✅ 文档即代码理念
- ✅ 自动化优先原则
- ✅ 龙虾响应协议

---

## 📊 成功指标

### 第 1 周
- [ ] 所有成员理解仓库结构
- [ ] 创建至少 3 个真实任务
- [ ] 龙虾能正确响应

### 第 1 月
- [ ] 形成文档沉淀习惯
- [ ] 任务逾期率下降
- [ ] 会议纪要 100% 归档

### 第 1 季
- [ ] 知识库自然积累
- [ ] 新人上手时间<1 小时
- [ ] 跨任务复用率提升

---

## 🚨 常见问题

### Q: 如何删除示例任务？
A: 创建真实任务后，可删除 `Tasks/TASK-001-example/`

### Q: 可以不用 GitHub Actions 吗？
A: 可以，删除 `.github/workflows/` 即可，但建议保留自动化

### Q: 如何同步模板更新？
A: 手动合并模板仓库的更新，或配置 GitHub 依赖机器人

### Q: 龙虾 Skill 如何获取？
A: 联系模板维护者获取 `octo-git-collab` Skill 文件

---

## 📖 参考文档

| 文档 | 用途 |
|------|------|
| `README.md` | 协作总纲 |
| `Docs/QUICKSTART.md` | 快速上手 |
| `Docs/guides/task-setup.md` | 任务创建 |
| `Docs/guides/agent-protocol.md` | 龙虾协议 |
| `Tasks/TASK-001-example/brief.md` | 任务示例 |

---

## 🎁 下一步

1. **立即**：创建你的第一个真实任务
2. **今天**：邀请团队成员登记 roles.md
3. **本周**：跑通一次完整协作流程
4. **本月**：形成自动化协作习惯

---

## 📞 支持

- **模板维护**: @威少
- **问题反馈**: 提交 Issue 或联系 OCTO 群
- **Skill 获取**: OCTO 群内 @Arist

---

**模板版本**: v1.0  
**创建**: 2026-04-22  
**基于**: OCTO Git 协作方案  
**协议**: MIT（可自由使用和修改）
