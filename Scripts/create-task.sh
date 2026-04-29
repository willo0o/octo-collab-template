#!/bin/bash
# create-task.sh - 快速创建任务并初始化模板
# 用法：./create-task.sh TASK-002 "任务名称" 负责人
# 命名格式：task-xxx-任务名称-Owner（不含 @ 和空格，必含 Owner 名字）

set -e

if [ $# -lt 3 ]; then
    echo "用法：$0 <TASK-XXX> <任务名称> 负责人"
    echo "示例：$0 TASK-002 \"用户登录功能\" 威少"
    echo "命名格式：task-xxx-任务名称-Owner（Owner 不加@）"
    exit 1
fi

TASK_ID=$1
TASK_NAME=$2
OWNER=$3

# —————————————————————————
# ✅ 命名规则校验
# —————————————————————————

# 规则 1：Owner 不能含 @
if echo "$OWNER" | grep -q '@'; then
    echo "❌ 命名错误：Owner 不能含 @ 符号"
    echo "   错误：@威少  正确：威少"
    exit 1
fi

# 规则 2：任务名和 Owner 不能含空格
if echo "${TASK_NAME} ${OWNER}" | grep -q ' '; then
    echo "❌ 命名错误：任务名称和 Owner 不能含空格，请用 - 替代"
    echo "   错误：用户 登录功能  正确：用户登录功能"
    exit 1
fi

# 规则 3：检查编号是否已存在
if ls Tasks/ 2>/dev/null | grep -qi "^${TASK_ID}-"; then
    echo "❌ 编号冲突：${TASK_ID} 已存在，请检查现有编号再改一个"
    echo "   当前任务列表："
    ls Tasks/ 2>/dev/null | grep -v '^done$' | sed 's/^/   - /'
    exit 1
fi

# —————————————————————————

TASK_DIR="Tasks/${TASK_ID}-${TASK_NAME}-${OWNER}"

echo "📦 创建任务：${TASK_ID} - ${TASK_NAME}"
echo "👤 Owner：${OWNER}"
echo "📂 目录：${TASK_DIR}"

# 创建目录结构
mkdir -p "${TASK_DIR}/deliverables"

# 初始化 brief.md
cat > "${TASK_DIR}/brief.md" <<EOF
# ${TASK_ID}: ${TASK_NAME}

**负责人**: @${OWNER}
**优先级**: P1
**截止**: YYYY-MM-DD
**状态**: 🟢 待开始

## 目标
[一句话描述核心价值]

## 验收标准
- [ ] 标准 1
- [ ] 标准 2
EOF

# 初始化 checklist.md
cat > "${TASK_DIR}/checklist.md" <<EOF
# ${TASK_ID} 检查清单

## 准备阶段
- [ ] 任务目录已创建
- [ ] brief.md 已填写完整

## 执行阶段
- [ ] 每日更新状态
- [ ] 关键决策已记录

## 收尾阶段
- [ ] 验收标准达成
- [ ] 交付物已归档（deliverables/xxx.md）
- [ ] 任务目录移至 Tasks/done/
- [ ] Git 提交推送完成
EOF

# 初始化 decisions.md
cat > "${TASK_DIR}/decisions.md" <<EOF
# 关键决策记录

## YYYY-MM-DD

### 决策 1
- **议题**: [待填写]
- **决策**: [待填写]
- **决策人**: [待填写]
EOF

# Git 提交：先同步远程最新状态，再推送
git pull --rebase origin "$(git rev-parse --abbrev-ref HEAD)"
git add "${TASK_DIR}/"
git commit -m "[${TASK_ID}] init: 任务初始化"
git push

echo "✅ 任务创建完成！"
echo "📂 目录：${TASK_DIR}"
echo "📝 下一步：编辑 ${TASK_DIR}/brief.md 填写详细信息"
