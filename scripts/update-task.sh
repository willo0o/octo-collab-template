#!/bin/bash
# update-task.sh - 快速提交任务进展到 Git
# 用法：./update-task.sh <TASK-XXX> "更新说明"

set -e

if [ $# -lt 2 ]; then
    echo "用法：$0 <TASK-XXX> \"更新说明\""
    echo ""
    echo "示例:"
    echo "  $0 TASK-001 \"完成用户登录功能\""
    echo "  $0 TASK-002 \"更新 API 文档\""
    exit 1
fi

TASK_ID=$1
UPDATE_MSG=$2
TASK_DIR="tasks/${TASK_ID}-"*

# 检查任务目录是否存在
if [ ! -d "$TASK_DIR" ]; then
    echo "❌ 错误：任务目录不存在：tasks/${TASK_ID}-*"
    echo "请先确认任务编号正确"
    exit 1
fi

# 查看变更
echo "📊 检测任务变更..."
git status --porcelain "$TASK_DIR"

# 检查是否有变更
if [ -z "$(git status --porcelain "$TASK_DIR")" ]; then
    echo "✅ 没有检测到变更"
    exit 0
fi

# 添加变更
echo "📦 添加变更..."
git add "$TASK_DIR"

# 提交
COMMIT_MSG="[${TASK_ID}] update: ${UPDATE_MSG}"
echo "💾 提交：${COMMIT_MSG}"
git commit -m "${COMMIT_MSG}"

# 推送
echo "🚀 推送到远程..."
git push

echo "✅ 任务 ${TASK_ID} 更新完成！"
echo "📝 提交信息：${COMMIT_MSG}"
