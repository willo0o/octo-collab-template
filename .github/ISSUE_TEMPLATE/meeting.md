name: 会议纪要

description: 记录会议决策和行动项
title: "[MEETING] YYYY-MM-DD 会议主题"
labels: ["meeting"]
body:
  - type: input
    id: date
    attributes:
      label: 会议日期
      description: 格式：YYYY-MM-DD
      placeholder: "2026-04-22"
    validations:
      required: true

  - type: input
    id: time
    attributes:
      label: 会议时间
      description: 格式：HH:MM-HH:MM
      placeholder: "17:00-18:00"
    validations:
      required: true

  - type: textarea
    id: attendees
    attributes:
      label: 参会人员
      description: 列出所有参会者（人类和龙虾）
      placeholder: |
        @某人 @某人 @Arist
      render: markdown
    validations:
      required: true

  - type: textarea
    id: decisions
    attributes:
      label: 关键决策
      description: 记录所有决策（每项包含决策内容和决策人）
      placeholder: |
        1. 采用 Git 作为协作载体 - @威少
        2. 每任务独立目录 - @威少
      render: markdown
    validations:
      required: true

  - type: textarea
    id: action-items
    attributes:
      label: 行动项
      description: 列出所有行动项（每项包含任务、负责人、截止日）
      placeholder: |
        - [ ] 初始化仓库结构 - @Arist - 2026-04-22
        - [ ] 制作 Skill - @Arist - 2026-04-22
      render: markdown
    validations:
      required: true

  - type: textarea
    id: notes
    attributes:
      label: 讨论纪要
      description: 按议题记录讨论内容
      placeholder: |
        ### 议题 1: 协作载体选择
        
        **背景**: 需要选择人虾协作工具
        
        **讨论**:
        - @某人：建议用 Git
        - @某人：飞书也可以
        
        **结论**: 采用 Git
      render: markdown
    validations:
      required: false
