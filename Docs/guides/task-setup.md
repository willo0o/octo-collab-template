# 任务管理指南

> 任务创建、状态管理、归档的完整参考

---

## ⚠️ 命名规则（必读）

**格式**：`task-xxx-任务名称-Owner`

| 示例 | 状态 | 原因 |
|------|------|------|
| `task-003-用户登录功能-威少` | ✅ | 格式正确 |
| `task-003-@威少-用户登录` | ❌ | 含 `@` 符号 |
| `task-003-用户 登录-威少` | ❌ | 含空格 |
| `task-003-用户登录功能` | ❌ | 缺 Owner 名字 |

**创建前必须确认**：
1. 编号未被占用（`ls Tasks/` 查现有编号）
2. 任务名和 Owner 不含空格、`@`
3. 末尾包含 Owner 名字（不加 `@`）

---

## 创建任务

### 方法 1：脚本（推荐）

```bash
./Scripts/create-task.sh TASK-002 "任务名称" 负责人
```

脚本会自动：校验命名规则 → 创建目录 → 初始化 brief/checklist/decisions → pull rebase → commit → push

### 方法 2：手动

```bash
# 1. 创建目录
mkdir -p Tasks/task-002-任务名称-负责人/deliverables

# 2. 初始化文件（参考 Tasks/task-001-示例任务-Owner/ 模板）
cp Tasks/task-001-示例任务-Owner/brief.md Tasks/task-002-任务名称-负责人/brief.md
cp Tasks/task-001-示例任务-Owner/checklist.md Tasks/task-002-任务名称-负责人/checklist.md

# 3. 填写 brief.md 必填字段：编号、名称、负责人、优先级、截止日、目标、验收标准

# 4. 提交（push 前先同步远程）
git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"
git add Tasks/task-002-任务名称-负责人/
git commit -m "[task-002] init: 任务初始化"
git push
```

---

## 任务状态

```
🟢 待开始 → 🟡 进行中 → 🔵 待评审 → ✅ 已完成
```

**更新方法**：编辑 `brief.md` 中的状态字段，立即 commit + push。

**优先级定义**：
- P0：紧急（24 小时内）
- P1：重要（本周内）
- P2：常规（本月内）

---

## 更新进展

```bash
# 使用脚本（内置 pull --rebase）
./Scripts/update-task.sh TASK-002 "完成用户登录功能"

# 或手动
git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"
git add Tasks/task-002-任务名称-负责人/
git commit -m "[task-002] update: 完成用户登录功能"
git push
```

**即时同步场景**（发生后立即 push）：
- 状态变更
- deliverables 新增或修改
- decisions.md 更新
- checklist 完成项勾选

---

## 完成归档

```bash
mv Tasks/task-002-任务名称-负责人 Tasks/done/
git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"
git add Tasks/
git commit -m "[task-002] done: 任务完成归档"
git push
```

---

## 常见问题

**Q: 多人协作同一任务？**
A: brief.md 中负责人写主要 Owner，其他人在 checklist 的行动项中指定。

**Q: 任务编号如何分配？**
A: `ls Tasks/` 查现有最大编号，顺序 +1。

**Q: 交付物放哪里？**
A: 统一放 `deliverables/` 目录，命名规范：`类型-名称.md`（如 `方案-AI改造草稿.md`）。

---

**维护者**: OCTO 协作组 · **更新**: 规则变更时
