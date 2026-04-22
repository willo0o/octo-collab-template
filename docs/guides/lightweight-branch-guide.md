# 轻量分支协作指南

> 通用人虾协作 · 简单高效 · 文档优先

---

## 🎯 核心原则

1. **简单优先**: 无需复杂 Git Flow，够用就好
2. **文档即协作**: 所有讨论沉淀为文档
3. **龙虾自动**: 能自动化的绝不手动
4. **适度评审**: 重要决策需评审，日常更新自由提交

---

## 🌿 分支模型

```
main              # 稳定版本（唯一主分支）
├── dev           # 开发分支（可选，小团队可省略）
└── user/姓名     # 个人工作分支（长期存在）
```

---

## 👥 分支命名

| 类型 | 命名格式 | 示例 |
|------|---------|------|
| 个人分支 | `user/姓名` 或 `user/昵称` | `user/weishao`、`user/arist` |
| 临时分支 | `temp/描述` | `temp/meeting-2026-04-22` |

---

## 🚀 标准工作流

### 工作流 1: 创建个人分支（首次）

```bash
# 1. 克隆仓库
git clone <repo-url>
cd octo-collab

# 2. 创建个人分支
git checkout -b user/weishao

# 3. 推送到远程
git push -u origin user/weishao
```

### 工作流 2: 日常协作

```bash
# 1. 切换到个人分支
git checkout user/weishao

# 2. 拉取最新代码（避免冲突）
git pull origin main

# 3. 编辑文档/创建任务
vim tasks/TASK-001/brief.md
vim docs/meeting-notes/2026-04-22.md

# 4. 提交
git add tasks/TASK-001/
git commit -m "[TASK-001] 更新任务状态为进行中"

# 5. 推送
git push origin user/weishao
```

### 工作流 3: 合并到 main

```bash
# 1. 在 GitHub 创建 Pull Request
# user/weishao → main

# 2. 填写 PR 信息
# 标题：[2026-04-22] 本周工作更新
# 描述：本周完成的任务和文档

# 3. 等待评审（至少 1 人）

# 4. 合并后删除临时分支（可选）
```

---

## 📋 提交规范

### 格式

```
[类别] 描述
```

### 类别可选值

| 类别 | 用途 | 示例 |
|------|------|------|
| `TASK-XXX` | 任务相关 | `[TASK-001] 更新任务状态` |
| `MEETING` | 会议纪要 | `[MEETING] 2026-04-22 同步会` |
| `DOC` | 文档更新 | `[DOC] 更新协作指南` |
| `DECISION` | 重要决策 | `[DECISION] 采用轻量分支模式` |
| `CHORE` | 杂项 | `[CHORE] 更新人员列表` |

### 示例

```bash
[TASK-001] 创建任务目录并初始化
[TASK-001] 更新任务状态：待开始 → 进行中
[MEETING] 2026-04-22 OCTO 同步会纪要
[DECISION] 采用轻量分支协作模式
[DOC] 更新人员角色登记
[CHORE] 更新龙虾心跳状态
```

---

## 🎯 人虾分工

### 人类成员

| 场景 | 行动 |
|------|------|
| 开始工作 | 切换到个人分支 → 拉取最新 → 编辑文档 |
| 完成任务 | 提交 → 创建 PR → 通知评审 |
| 评审 PR | 检查内容 → 批准或提出建议 |

### 龙虾成员

| 场景 | 行动 |
|------|------|
| 会议中 | 自动记录 → 生成纪要 → 提交到 `user/arist` |
| 任务更新 | 检测变更 → 更新状态 → 推送 |
| 整点 | 更新 `agents/availability.md` |
| PR 创建 | 自动检查格式 → 生成摘要 → 通知评审人 |

---

## 🚨 冲突处理

### 预防冲突

1. **任务隔离**: 每任务独立目录
2. **频繁同步**: 每天至少 `git pull` 一次
3. **个人分支**: 每人独立分支，互不干扰

### 解决冲突

```bash
# 1. 拉取最新 main
git checkout main
git pull origin main

# 2. 合并到个人分支
git checkout user/weishao
git merge main

# 3. 解决冲突（编辑冲突文件）

# 4. 标记解决
git add 冲突文件
git commit -m "[CHORE] 解决冲突"

# 5. 推送
git push origin user/weishao
```

---

## 📊 常用命令

```bash
# 查看所有分支
git branch -a

# 创建个人分支
git checkout -b user/weishao

# 切换分支
git checkout user/weishao

# 拉取最新代码
git pull origin main

# 推送个人分支
git push origin user/weishao

# 查看提交历史
git log --oneline -10
```

---

## 🎓 最佳实践

### ✅ 推荐

- 每天开始工作前先 `git pull`
- 提交前检查变更内容
- 重要决策走 PR 评审
- 会议纪要当天完成
- 任务状态及时更新

### ❌ 避免

- 直接在 main 分支提交（紧急修复除外）
- 一周才提交一次（容易冲突）
- 提交信息过于简单（如 "update"）
- 修改他人任务目录（应走 PR）
- 忘记推送（本地提交别人看不到）

---

## 📖 参考资源

- [GitHub 基础教程](https://docs.github.com/en/get-started)
- [Git 分支入门](https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%AE%80%E4%BB%8B)

---

## ✅ 检查清单

### 开始工作前
- [ ] 已切换到个人分支
- [ ] 已拉取最新 main 分支代码

### 提交前
- [ ] 提交信息符合规范
- [ ] 变更内容正确

### 创建 PR 前
- [ ] 已与 main 分支同步
- [ ] 无冲突
- [ ] PR 描述清晰

---

**维护者**: OCTO 协作组  
**更新**: 有协作策略变更时
