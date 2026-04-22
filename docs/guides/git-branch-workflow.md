# Git 分支协作指南

> 基于 Git Flow 的人虾协作分支策略

---

## 🎯 核心原则

1. **分支隔离**：每人每任务独立分支，避免冲突
2. **PR 评审**：所有变更通过 Pull Request 合并
3. **小步提交**：频繁提交，小 PR 易评审
4. **主分支保护**：`main` 和 `dev` 禁止直接 push

---

## 🌿 分支模型

```
main              # 稳定版本（受保护，需 2 人评审）
├── dev           # 开发分支（受保护，需 1 人评审）
├── feature/xxx   # 功能分支（个人工作）
├── hotfix/xxx    # 紧急修复
└── release/xxx   # 发布分支
```

---

## 📋 分支命名规范

| 类型 | 命名格式 | 示例 |
|------|---------|------|
| 功能分支 | `feature/<TASK-XXX>-简短描述` | `feature/TASK-001-user-login` |
| 修复分支 | `fix/<TASK-XXX>-问题描述` | `fix/TASK-002-login-bug` |
| 紧急修复 | `hotfix/描述` | `hotfix/deadline-reminder` |
| 发布分支 | `release/v版本号` | `release/v1.0.0` |
| 个人实验 | `experiment/姓名/描述` | `experiment/arist/agent-auto` |

---

## 🚀 标准工作流

### 工作流 1: 创建任务分支

```bash
# 1. 切换到 dev 分支
git checkout dev

# 2. 拉取最新代码
git pull origin dev

# 3. 创建并切换到功能分支
git checkout -b feature/TASK-001-user-login

# 4. 开始工作...
```

### 工作流 2: 提交和推送

```bash
# 1. 查看变更
git status
git diff

# 2. 添加文件
git add tasks/TASK-001-xxx/
git add docs/

# 3. 提交（遵循提交规范）
git commit -m "[TASK-001] feat: 添加用户登录功能"

# 4. 推送到远程
git push -u origin feature/TASK-001-user-login
```

### 工作流 3: 创建 Pull Request

1. 打开 GitHub 仓库页面
2. 点击 **"Compare & pull request"**
3. 填写 PR 信息：
   - **标题**: `[TASK-001] 用户登录功能`
   - **描述**: 说明变更内容、测试情况、关联 Issue
   - **评审人**: @任务 Owner + @相关成员
   - **标签**: `feature`, `TASK-001`
4. 点击 **"Create pull request"**

### 工作流 4: 评审和合并

**评审人职责**:
- [ ] 代码/文档质量检查
- [ ] 符合团队规范
- [ ] 测试通过
- [ ] 无冲突

**合并方式**:
- **Squash and merge**: 多个提交压缩为一个（推荐）
- **Rebase and merge**: 保持线性历史
- **Create a merge commit**: 保留完整历史

---

## 🔒 分支保护规则

### main 分支（受保护）

**规则**:
- ✅ 禁止直接 push
- ✅ 必须通过 PR 合并
- ✅ 至少 2 人评审
- ✅ CI/CD 必须通过
- ✅ 无冲突

### dev 分支（受保护）

**规则**:
- ✅ 禁止直接 push
- ✅ 必须通过 PR 合并
- ✅ 至少 1 人评审
- ✅ 无冲突

### 配置方法

GitHub Settings → Branches → Add branch protection rule:

```
Branch name pattern: main
✓ Require a pull request before merging
  ✓ Require approvals: 2
✓ Require status checks to pass before merging
✓ Include administrators
```

---

## 📝 提交信息规范

### 格式

```
[TASK-XXX] type: 描述
```

### type 可选值

| type | 用途 | 示例 |
|------|------|------|
| `init` | 任务初始化 | `[TASK-001] init: 任务创建` |
| `feat` | 新功能 | `[TASK-001] feat: 添加登录功能` |
| `fix` | 修复 bug | `[TASK-002] fix: 修复验证码发送` |
| `docs` | 文档更新 | `[TASK-001] docs: 更新 API 文档` |
| `style` | 格式调整 | `[TASK-001] style: 格式化代码` |
| `refactor` | 重构 | `[TASK-001] refactor: 重构登录逻辑` |
| `test` | 测试 | `[TASK-001] test: 添加单元测试` |
| `chore` | 杂项 | `[CHORE] 心跳更新` |
| `meeting` | 会议纪要 | `[MEETING] 2026-04-22 同步会` |

### 完整示例

```bash
# 任务初始化
git commit -m "[TASK-001] init: 用户登录功能任务创建"

# 功能开发
git commit -m "[TASK-001] feat: 添加手机号验证码发送"
git commit -m "[TASK-001] feat: 实现验证码校验逻辑"

# 文档更新
git commit -m "[TASK-001] docs: 更新 API 接口文档"

# 测试
git commit -m "[TASK-001] test: 添加登录流程单元测试"

# 会议纪要
git commit -m "[MEETING] 2026-04-22 OCTO 同步会纪要"
```

---

## 🎯 人虾分工

### 人类成员

| 场景 | 行动 |
|------|------|
| 开始任务 | 创建功能分支 → 开发 → 提交 → PR |
| 评审 PR | 检查质量 → 提出意见 → 批准 |
| 合并 PR | 解决冲突 → Squash 合并 → 删除分支 |

### 龙虾成员

| 场景 | 行动 |
|------|------|
| 任务创建 | 自动创建功能分支 → 初始化模板 → 推送 |
| PR 评审 | 自动检查提交规范 → 提示风险 → 生成报告 |
| 合并后 | 更新任务状态 → 归档文档 → 通知相关人员 |

---

## 🚨 冲突解决

### 预防冲突

1. **小步提交**: 每次变更控制在单一任务目录
2. **频繁同步**: 每天至少 `git pull` 一次
3. **任务隔离**: 不同任务在不同目录
4. **及时合并**: PR 批准后尽快合并

### 解决冲突

```bash
# 1. 拉取最新代码
git checkout dev
git pull origin dev

# 2. 切换回功能分支
git checkout feature/TASK-001

# 3. 合并 dev 分支
git merge dev

# 4. 解决冲突（编辑冲突文件）
# 冲突标记：
# <<<<<<< HEAD
# 你的修改
# =======
# 他人的修改
# >>>>>>> dev

# 5. 标记解决
git add 冲突文件

# 6. 完成合并
git commit -m "[TASK-001] merge: 解决与 dev 的冲突"

# 7. 推送
git push
```

---

## 📊 分支管理命令

```bash
# 查看所有分支
git branch -a

# 查看远程分支
git branch -r

# 创建新分支
git checkout -b feature/TASK-001

# 切换分支
git checkout feature/TASK-001

# 删除本地分支
git branch -d feature/TASK-001

# 删除远程分支
git push origin --delete feature/TASK-001

# 查看分支历史
git log --oneline --graph --all

# 查看谁修改了文件
git blame 文件名
```

---

## 🎓 最佳实践

### ✅ 推荐

- 每天至少提交一次
- PR 大小控制在 200 行以内
- 一个 PR 只做一件事
- 提交前本地测试
- PR 描述写清楚"为什么"而非"是什么"

### ❌ 禁止

- 直接 push 到 main/dev
- 超大 PR（>500 行）
- 多个任务混在一个 PR
- 提交敏感信息（密码、密钥）
- 无意义的提交信息（如 "update"、"fix"）

---

## 📖 参考资源

- [GitHub Flow 官方文档](https://docs.github.com/en/get-started/quickstart/github-flow)
- [Git Flow 工作流](https://nvie.com/posts/a-successful-git-branching-model/)
- [Conventional Commits](https://www.conventionalcommits.org/)

---

## ✅ 检查清单

### 开始任务前
- [ ] 已切换到 dev 分支并拉取最新代码
- [ ] 已创建功能分支
- [ ] 分支命名符合规范

### 提交前
- [ ] 已测试变更
- [ ] 提交信息符合规范
- [ ] 无敏感信息

### PR 创建前
- [ ] 已与 dev 分支同步
- [ ] 无冲突
- [ ] PR 描述完整

### 合并前
- [ ] 已获得足够评审
- [ ] CI/CD 通过
- [ ] 无冲突

---

**维护者**: OCTO 协作组  
**更新**: 有分支策略变更时
