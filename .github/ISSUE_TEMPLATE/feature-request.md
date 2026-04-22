name: ✨ 功能建议

description: 提出新的协作流程或自动化建议
title: "[FEATURE] 功能简述"
labels: ["enhancement"]
body:
  - type: textarea
    id: problem
    attributes:
      label: 相关痛点
      description: 此建议解决什么问题？
      placeholder: 当前有什么不便或效率低下的地方？
    validations:
      required: true

  - type: textarea
    id: proposal
    attributes:
      label: 建议方案
      description: 你建议如何实现？
      placeholder: 详细描述你的建议
    validations:
      required: true

  - type: textarea
    id: benefits
    attributes:
      label: 预期收益
      description: 实现后带来什么价值？
      placeholder: 能提升效率/减少错误/改善体验？
    validations:
      required: true

  - type: dropdown
    id: priority
    attributes:
      label: 优先级建议
      description: 你认为此建议的优先级
      options:
        - P0 - 必须实现
        - P1 - 应该实现
        - P2 - 可以实现
        - P3 - 有空再做
      default: 2
    validations:
      required: false

  - type: textarea
    id: alternatives
    attributes:
      label: 替代方案
      description: 是否考虑过其他方案？
      placeholder: 还有其他解决方式吗？
    validations:
      required: false
