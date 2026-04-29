# 快速配置指南

> 从模板仓库到可用协作空间的完整配置步骤

---

## 🚀 初始化（首次使用）

### 步骤 1：基于模板创建仓库

1. 点击顶部 **Use this template** → 填写仓库名 → 创建
2. Clone 到本地：
   ```bash
   git clone <your-repo-url>
   cd <repo-name>
   ```

### 步骤 2：配置分支策略（可选）

```bash
git checkout -b dev
git push -u origin dev
# 在 GitHub Settings → Branches 设置 main 分支保护规则
```

### 步骤 3：登记成员信息

- **人类**：编辑 `People/roles.md`，填写姓名和角色
- **龙虾**：编辑 `Agents/registry.md`，注册能力；学习 `octo-git-collab` Skill

### 步骤 4：创建第一个任务

```bash
./Scripts/create-task.sh TASK-001 "任务名称" 负责人
```

### 步骤 5：配置 GitHub Actions（可选）

在 GitHub 仓库启用 Actions，按需调整 `.github/workflows/` 中的 cron 时间：

| 工作流 | 默认频率 | 功能 |
|--------|---------|------|
| `daily-standup.yml` | 每天 09:00 | 生成站会报告 |
| `deadline-reminder.yml` | 每天 08:00 | 检查截止日 |

---

## 📋 日常使用流程

### 人类成员

1. 群内宣布新任务 → `./Scripts/create-task.sh` → 填写 `brief.md`
2. 编辑任务文件 → 立即 commit + push
3. 开会 → 龙虾自动记录 → 确认纪要
4. 验收交付物 → 更新状态为 ✅ → 归档到 `Tasks/done/`

### 龙虾成员

1. 被 @ → 第一时间响应 → 执行任务
2. 会议中 → 静默记录 → 提取决策和行动项 → 归档 Git
3. 整点 → 更新 `Agents/availability.md`
4. 发现风险 → @负责人 预警

---

## 📖 指南速查

| 需求 | 文档 |
|------|------|
| 创建和管理任务 | [guides/task-setup.md](guides/task-setup.md) |
| 龙虾行为规范 | [guides/agent-protocol.md](guides/agent-protocol.md) |
| 分支与提交规范 | [guides/git-workflow.md](guides/git-workflow.md) |
| 模板仓库配置 | [guides/github-template-setup.md](guides/github-template-setup.md) |

---

## 🚨 常见问题

**Q: 直接在 main 上提交了怎么办？**
A: 创建个人分支 → 将提交移过去 → PR → 评审 → 合并，之后保持在个人分支工作。

**Q: 任务目录命名冲突？**
A: 统一格式 `task-xxx-名称-Owner`，创建前 `ls Tasks/` 查现有编号。

**Q: 龙虾过度发言？**
A: 严格遵守响应协议，未被 @ 时 NO_REPLY。

**Q: 如何同步模板更新？**
A: 在 GitHub 页面点击 Sync fork，或手动 `git pull` 模板仓库的变更。

---

## 🎯 成功指标

| 阶段 | 指标 |
|------|------|
| 第 1 周 | 所有成员理解结构；至少创建 3 个真实任务；龙虾能正确响应和静默 |
| 第 1 月 | 形成文档沉淀习惯；任务逾期率下降；会议纪要 100% 自动归档 |
| 第 1 季 | 知识库自然积累；新人上手 < 1 小时；跨任务复用率提升 |

---

**维护者**: OCTO 协作组 · **更新**: 配置流程变更时
