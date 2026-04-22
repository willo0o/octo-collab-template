name: 🐛 问题反馈

description: 报告协作流程中的问题或 Bug
title: "[BUG] 问题简述"
labels: ["bug"]
body:
  - type: input
    id: task-id
    attributes:
      label: 相关任务
      description: 如有，填写任务编号
      placeholder: TASK-001

  - type: textarea
    id: description
    attributes:
      label: 问题描述
      description: 清晰描述遇到的问题
      placeholder: 在什么场景下遇到什么问题？
    validations:
      required: true

  - type: textarea
    id: expected
    attributes:
      label: 期望行为
      description: 你期望的正确行为是什么？
      placeholder: 应该发生什么？
    validations:
      required: true

  - type: textarea
    id: actual
    attributes:
      label: 实际行为
      description: 实际发生了什么？
      placeholder: 实际发生了什么？
    validations:
      required: true

  - type: textarea
    id: steps
    attributes:
      label: 复现步骤
      description: 如何复现此问题？
      placeholder: |
        1. 执行...
        2. 然后...
        3. 出现错误
      render: markdown
    validations:
      required: false

  - type: input
    id: severity
    attributes:
      label: 严重程度
      description: 此问题的影响程度
      placeholder: 阻塞/严重/一般/轻微
    validations:
      required: false
