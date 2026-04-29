# Git 工作流指南

> 分支模型 · 提交规范 · 同步机制 · 冲突处理

---

## 🌿 分支模型

```
main              # 稳定版本（受保护，不直接提交）
├── dev           # 可选，小团队可省略
└── user/姓名     # 个人长期工作分支
```

**分支命名**：

| 类型 | 格式 | 示例 |
|------|------|------|
| 个人分支 | `user/姓名` | `user/weishao`、`user/arist` |
| 临时分支 | `temp/描述` | `temp/meeting-2026-04-22` |

---

## 🚀 标准工作流

### 首次：创建个人分支

```bash
git clone <repo-url>
cd octo-collab
git checkout -b user/姓名
git push -u origin user/姓名
```

### 日常：编辑 → 提交 → 推送

```bash
# 1. 切换到个人分支
git checkout user/姓名

# 2. 先同步远程（⚠️ push 前必做）
git pull --rebase origin main

# 3. 编辑文档
vim Tasks/task-001-xxx/brief.md

# 4. 立即提交推送（不积压）
git add Tasks/task-001-xxx/
git commit -m "[task-001] update: 更新任务状态为进行中"
git push origin user/姓名
```

### 合并：个人分支 → main

```bash
# 在 GitHub 创建 Pull Request：user/姓名 → main
# 标题：[YYYY-MM-DD] 本周工作更新
# 至少 1 人评审后合并
```

---

## ⚠️ 同步两原则

> 每次 push 前必须执行，每次本地有变更就立即 push。

1. **push 前先同步远程**：
   ```bash
   git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"
   ```
2. **本地变更即时推送**：文件修改后不积压，完成即 commit + push

---

## 📋 提交规范

**格式**：`[类别] 描述`

| 类别 | 用途 | 示例 |
|------|------|------|
| `[task-xxx]` | 任务相关 | `[task-001] update: 更新任务状态` |
| `[MEETING]` | 会议纪要 | `[MEETING] 2026-04-22 同步会` |
| `[DOC]` | 文档更新 | `[DOC] 更新协作指南` |
| `[DECISION]` | 重要决策 | `[DECISION] 采用轻量分支模式` |
| `[CHORE]` | 杂项 | `[CHORE] 更新人员列表` |

**提交类型细化**（用于 task 类）：
`init` / `feat` / `docs` / `fix` / `status` / `done`

---

## 🚨 冲突处理

**预防**：每天开始工作前 `git pull`，任务目录隔离，避免多人同时改同一文件。

**解决**：
```bash
git checkout main && git pull origin main
git checkout user/姓名
git merge main          # 或 git rebase main
# 编辑冲突文件，解决后
git add 冲突文件
git commit -m "[CHORE] 解决冲突"
git push origin user/姓名
```

---

## ✅ 提交前检查清单

- [ ] 已切换到个人分支（不在 main 上直接提交）
- [ ] 已 `git pull --rebase` 同步远程
- [ ] 提交信息符合 `[类别] 描述` 格式
- [ ] 无冲突，变更内容正确

---

## 🚨 常见错误

| 错误 | 后果 | 正确做法 |
|------|------|---------|
| 直接在 main 提交 | 破坏主分支 | 用个人分支 + PR |
| 积压一周再提交 | 大量冲突 | 每次变更立即 push |
| 提交信息写 "update" | 无法追溯 | 按规范写具体描述 |
| 忘记 push | 他人看不到 | 变更后立即 push |

---

**维护者**: OCTO 协作组 · **更新**: 协作策略变更时
