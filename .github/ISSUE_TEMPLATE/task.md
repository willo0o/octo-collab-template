name: 任务创建

description: 创建新任务并初始化模板
title: "[TASK-XXX] 任务名称"
labels: ["task"]
body:
  - type: input
    id: task-id
    attributes:
      label: 任务编号
      description: 格式：TASK-XXX（按顺序递增）
      placeholder: TASK-002
    validations:
      required: true

  - type: input
    id: task-name
    attributes:
      label: 任务名称
      description: 简短描述任务内容
      placeholder: 用户登录功能
    validations:
      required: true

  - type: input
    id: owner
    attributes:
      label: 负责人
      description: GitHub 用户名或群内昵称
      placeholder: "@某人"
    validations:
      required: true

  - type: dropdown
    id: priority
    attributes:
      label: 优先级
      description: 根据紧急程度选择
      options:
        - P0 - 紧急重要（24 小时内）
        - P1 - 重要（本周内）
        - P2 - 常规（本月内）
      default: 1
    validations:
      required: true

  - type: input
    id: deadline
    attributes:
      label: 截止日
      description: 格式：YYYY-MM-DD
      placeholder: "2026-04-30"
    validations:
      required: true

  - type: textarea
    id: goal
    attributes:
      label: 目标
      description: 一句话描述核心价值
      placeholder: 实现用户通过手机号验证码登录
    validations:
      required: true

  - type: textarea
    id: acceptance
    attributes:
      label: 验收标准
      description: 列出所有必须达成的标准（每行一项）
      placeholder: |
        - 用户可以请求发送验证码
        - 验证码 5 分钟内有效
        - 错误次数限制为 5 次
      render: markdown
    validations:
      required: true

  - type: input
    id: agent
    attributes:
      label: 协作龙虾
      description: 分配到此任务的龙虾（如有）
      placeholder: "@Arist"
    validations:
      required: false
