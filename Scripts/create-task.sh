#!/bin/bash
# create-task.sh - 快速创建任务并初始化模板
# 用法：./create-task.sh TASK-002 "任务名称" @负责人
# 注意：任务目录命名格式：TASK-XXX-任务名称-@Owner（必须包含 Owner 名字）

set -e

if [ $# -lt 3 ]; then
    echo "用法：$0 <TASK-XXX> <任务名称> @负责人"
    echo "示例：$0 TASK-002 \"用户登录功能\" @威少"
    echo "注意：任务目录命名格式：TASK-XXX-任务名称-@Owner"
    exit 1
fi

TASK_ID=$1
TASK_NAME=$2
OWNER=$3
# 移除 @ 符号中的 @ 前缀，只保留名字
OWNER_NAME=${OWNER#@}
TASK_DIR="tasks/${TASK_ID}-${TASK_NAME}-@${OWNER_NAME}"

echo "📦 创建任务：${TASK_ID} - ${TASK_NAME}"
echo "👤 负责人：${OWNER}"

# 创建目录结构
mkdir -p "${TASK_DIR}/deliverables"

# 复制模板
cp tasks/TASK-001-example/brief.md "${TASK_DIR}/brief.md"
cp tasks/TASK-001-example/checklist.md "${TASK_DIR}/checklist.md"

# 更新 brief.md
sed -i "s/TASK-001: 示例任务/${TASK_ID}: ${TASK_NAME}/" "${TASK_DIR}/brief.md"
sed -i "s/@威少/${OWNER}/" "${TASK_DIR}/brief.md"
sed -i "s/2026-04-25/YYYY-MM-DD/" "${TASK_DIR}/brief.md"

# 更新 checklist.md
sed -i "s/TASK-001/${TASK_ID}/g" "${TASK_DIR}/checklist.md"

# 创建 decisions.md
cat > "${TASK_DIR}/decisions.md" <<EOF
# 关键决策记录

## YYYY-MM-DD

### 决策 1
- **议题**: [待填写]
- **决策**: [待填写]
- **决策人**: [待填写]
EOF

# Git 提交
git add "${TASK_DIR}/"
git commit -m "[${TASK_ID}] init: 任务初始化"
git push

echo "✅ 任务创建完成！"
echo "📂 目录：${TASK_DIR}"
echo "📝 下一步：编辑 ${TASK_DIR}/brief.md 填写详细信息"
