# OCTO Git 协作方案 - 使用总结

> 快速上手指南 · 2026-04-22

---

## 🎯 一句话概述

用 **Git 仓库** 作为人虾协作的单一事实来源，通过 **任务目录隔离** + **文档模板** + **自动化** 实现高效协作。

---

## 📦 交付物清单

### 1. 仓库模板
位置：`/root/.openclaw/weishao-workspace/tasks/octo-git-collab/`

```
✅ README.md                      - 协作总纲
✅ tasks/TASK-001-example/        - 示例任务（含 4 个文件）
✅ docs/meeting-notes/            - 会议纪要模板
✅ docs/guides/                   - 使用指南（4 篇）
✅ people/roles.md                - 人员角色登记
✅ agents/registry.md             - 龙虾注册表
✅ agents/availability.md         - 龙虾心跳
✅ .github/workflows/             - GitHub Actions（2 个）
✅ scripts/create-task.sh         - 任务创建脚本
```

### 2. 龙虾 Skill
位置：`/root/.openclaw/workspace/skills/octo-git-collab/SKILL.md`

**内容**:
- 仓库结构认知
- 龙虾职责与响应协议
- 标准工作流（4 个）
- 文档规范
- 学习检查题

**学会后能力**:
- ✅ 独立创建任务
- ✅ 自动生成会议纪要
- ✅ 正确响应群消息
- ✅ 风险预警
- ✅ 状态同步

---

## 🚀 快速启动（3 步）

### 步骤 1: 初始化 Git 仓库

```bash
cd /root/.openclaw/weishao-workspace/tasks/octo-git-collab/
git init
git add .
git commit -m "init: OCTO 协作空间初始化"
# 推送到 GitHub/Gitee
git remote add origin <repo-url>
git push -u origin main
```

### 步骤 2: 邀请成员

**人类**:
- 在 `people/roles.md` 登记信息
- 授予仓库读写权限

**龙虾**:
- 学习 `octo-git-collab` Skill
- 在 `agents/registry.md` 注册

### 步骤 3: 创建第一个真实任务

```bash
# 使用脚本
./scripts/create-task.sh TASK-002 "真实任务名" @负责人

# 或手动复制 TASK-001-example 模板
```

---

## 📋 日常使用流程

### 人类成员

1. **创建任务**: 群内宣布 → 运行脚本 → 填写 brief.md
2. **更新进度**: 编辑任务文件 → Git 提交
3. **开会**: 群内讨论 → 龙虾自动记录 → 确认纪要
4. **验收**: 检查 deliverables/ → 更新状态为 ✅

### 龙虾成员

1. **被@**: 第一时间回应 → 执行任务
2. **会议**: 静默记录 → 提取决策和行动项
3. **整点**: 更新 agents/availability.md
4. **预警**: 发现风险 → @负责人

---

## 🎓 学习路径

### 人类成员
1. 阅读 `README.md`（5 分钟）
2. 查看 `TASK-001-example/brief.md` 示例（3 分钟）
3. 实践创建 1 个任务（10 分钟）

### 龙虾成员
1. 学习 `octo-git-collab` Skill（15 分钟）
2. 阅读 `docs/guides/agent-protocol.md`（5 分钟）
3. 实践：创建任务 + 记录会议（20 分钟）

---

## 🔧 自动化配置

### GitHub Actions

| 工作流 | 频率 | 功能 |
|--------|------|------|
| daily-standup.yml | 每天 9:00 | 生成站会报告 |
| deadline-reminder.yml | 每天 8:00 | 检查截止日 |

### 配置方法

1. 在 GitHub 仓库启用 Actions
2. 根据需要调整 cron 时间
3. 可选：集成 DMWork/Feishu 发送通知

---

## 📊 成功指标

### 短期（1 周）
- [ ] 所有成员理解仓库结构
- [ ] 至少创建 3 个真实任务
- [ ] 龙虾能正确响应@和静默

### 中期（1 月）
- [ ] 形成文档沉淀习惯
- [ ] 任务逾期率下降
- [ ] 会议纪要 100% 自动归档

### 长期（1 季）
- [ ] 知识库自然积累
- [ ] 新人上手时间<1 小时
- [ ] 跨任务复用率提升

---

## 🚨 常见坑

### 坑 1: 直接修改 main 分支
**解**: 创建 feature 分支 → PR → 评审 → 合并

### 坑 2: 任务目录命名冲突
**解**: 统一格式 `TASK-XXX-简短描述`，先查现有编号

### 坑 3: 龙虾过度发言
**解**: 严格遵守响应协议，未被@时 NO_REPLY

### 坑 4: 文档更新滞后
**解**: 行动项必须含截止日，龙虾自动提醒

---

## 📖 参考文档速查

| 需求 | 文档 |
|------|------|
| 整体介绍 | `README.md` |
| 创建任务 | `docs/guides/task-setup.md` |
| 龙虾行为 | `docs/guides/agent-protocol.md` |
| 会议模板 | `docs/meeting-notes/YYYY-MM-DD-meeting.md` |
| Skill 学习 | `~/.openclaw/workspace/skills/octo-git-collab/SKILL.md` |

---

## 🎁 下一步建议

1. **立即可做**:
   - 在 OCTO 群演示此方案
   - 邀请辉哥等成员登记 roles.md
   - 创建第一个真实任务

2. **本周完成**:
   - 配置 GitHub Actions
   - 所有活跃龙虾学习 Skill
   - 跑通一次完整会议记录

3. **优化方向**:
   - 飞书文档双向同步
   - 自定义 Dashboard 可视化
   - 集成 CI/CD 自动测试

---

**创建者**: Arist @ 威少  
**日期**: 2026-04-22  
**版本**: v1.0
