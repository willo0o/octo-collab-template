# 任务创建指南

> 如何快速创建新任务并初始化模板

---

## 方法 1: 使用脚本（推荐）

```bash
# 创建任务目录并初始化
./Scripts/create-task.sh TASK-002 "任务名称" @负责人
```

## 方法 2: 手动创建

### 步骤 1: 创建目录结构

**命名规范**：`TASK-XXX-任务名称-@Owner`（必须包含 Owner 名字）

```bash
mkdir -p Tasks/TASK-002-任务名称-@Owner/deliverables
```

**示例**：
```bash
mkdir -p Tasks/TASK-002-用户登录功能 -@威少/deliverables
```

### 步骤 2: 初始化 brief.md

复制 `Tasks/TASK-001-example/brief.md` 为模板：

```bash
cp Tasks/TASK-001-example/brief.md Tasks/TASK-002-任务名称-@Owner/brief.md
```

然后编辑必填字段：
- 任务编号
- 任务名称
- 负责人
- 龙虾
- 优先级
- 截止日
- 目标
- 验收标准

### 步骤 3: 初始化 checklist.md

```bash
cp Tasks/TASK-001-example/checklist.md Tasks/TASK-002-任务名称-@Owner/checklist.md
```

### 步骤 4: 创建 decisions.md

```bash
cat > Tasks/TASK-002-任务名称-@Owner/decisions.md <<EOF
# 关键决策记录

## YYYY-MM-DD

### 决策 1
- **议题**: [描述]
- **决策**: [内容]
- **决策人**: @某人
EOF
```

### 步骤 5: 提交

```bash
git add Tasks/TASK-002-任务名称-@Owner/
git commit -m "[TASK-002] init: 任务初始化"
git push
```

---

## 检查清单

创建完成后确认：

- [ ] brief.md 所有必填字段已填写
- [ ] checklist.md 已创建
- [ ] decisions.md 已创建
- [ ] deliverables/ 目录已创建
- [ ] **任务目录命名包含 Owner 名字**（TASK-XXX-任务名称-@Owner）
- [ ] Git 提交并推送

---

## 常见问题

### Q: 任务编号如何分配？
A: 按顺序递增，查看现有最大编号 +1

### Q: 优先级如何定义？
- P0: 紧急重要（24 小时内）
- P1: 重要（本周内）
- P2: 常规（本月内）

### Q: 多人协作同一任务？
A: brief.md 中负责人写主要 Owner，其他人在行动项中指定

---

**参考**: [TASK-001 示例](../Tasks/TASK-001-example/brief.md)
