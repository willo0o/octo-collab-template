# GitHub 模板仓库配置指南

> 如何将此仓库配置为 GitHub Template Repository

---

## 🎯 什么是 Template Repository

GitHub Template Repository 允许用户一键基于你的仓库创建新项目，保留所有文件结构和配置，但不包含 Git 历史记录。

**适用场景**:
- 项目脚手架
- 协作模板
- 标准化配置
- 最佳实践传播

---

## 📋 配置步骤

### 步骤 1: 推送到 GitHub

```bash
cd /root/.openclaw/weishao-workspace/Tasks/octo-git-collab/

# 初始化 Git（如未初始化）
git init
git add .
git commit -m "init: OCTO Git 协作模板"

# 创建 GitHub 仓库（网页或 CLI）
gh repo create octo-collab-template --public --source=. --remote=origin

# 推送
git push -u origin main
```

### 步骤 2: 启用模板选项

1. 打开 GitHub 仓库页面
2. 点击 **Settings**（设置）
3. 在 **"General"** 页面顶部找到 **"Template repository"** 区域
4. 勾选 **"Make template"** 复选框

![Make template checkbox](https://docs.github.com/assets/cb-79337/mw-1440/images/help/repository/template-repository-use-main-branch.png)

### 步骤 3: 验证模板

1. 刷新仓库页面
2. 确认顶部出现 **"Use this template"** 绿色按钮
3. 点击按钮测试创建流程

---

## 🎨 模板优化建议

### 已包含
- ✅ `TEMPLATE-README.md` - 模板使用说明
- ✅ `.github/ISSUE_TEMPLATE/` - Issue 模板（4 个）
- ✅ 示例任务目录（可删除）
- ✅ GitHub Actions 工作流

### 可选增强

#### 1. 添加模板徽章
在 `README.md` 顶部添加：
```markdown
[![Use this template](https://img.shields.io/badge/-Use%20this%20template-brightgreen?logo=github)](https://github.com/new?template_name=octo-collab&template_owner=<OWNER>)
```

#### 2. 创建演示视频
录制 1-2 分钟演示视频，展示：
- 如何创建新仓库
- 如何创建第一个任务
- 龙虾协作流程

#### 3. 添加许可证
选择合适的开源许可证：
```bash
# MIT 许可证（推荐）
curl -O https://raw.githubusercontent.com/licenses/license-templates/master/templates/mit.txt
mv mit.txt LICENSE
```

---

## 🔄 模板更新策略

### 方案 A: 手动同步（推荐）

派生仓库手动合并模板更新：

```bash
# 在派生仓库中
git remote add template https://github.com/<owner>/octo-collab-template.git
git fetch template
git merge template/main --allow-unrelated-histories
```

### 方案 B: GitHub 依赖机器人

使用 [Dependabot](https://docs.github.com/en/code-security/dependabot/working-with-dependabot) 自动检测模板更新。

### 方案 C: 自定义 Actions

创建 `.github/workflows/sync-template.yml`：

```yaml
name: 同步模板更新
on:
  schedule:
    - cron: '0 0 * * 0'  # 每周日
jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: 合并模板更新
        run: |
          git remote add template https://github.com/<owner>/octo-collab-template.git
          git fetch template
          git merge template/main --allow-unrelated-histories || echo "需要手动解决冲突"
```

---

## 📊 使用统计

### GitHub 内置统计

在仓库 **Insights** 页面查看：
- 克隆次数
- 派生仓库数量
- 流量趋势

### 手动追踪

在 `TEMPLATE-README.md` 中添加使用案例列表：

```markdown
## 🎁 使用此模板的项目

- [Project A](链接) - 描述
- [Project B](链接) - 描述
```

---

## 🚨 常见问题

### Q: 模板仓库和普通仓库有什么区别？
A: 模板仓库多一个 "Use this template" 按钮，创建时不包含 Git 历史。

### Q: 可以基于模板仓库再创建模板吗？
A: 可以，派生仓库也可以设置为模板。

### Q: 如何通知用户模板更新了？
A: 在 Release 中发布更新说明，或在 Issue 中@使用项目的维护者。

### Q: 模板收费吗？
A: 免费，GitHub 不限制模板使用次数。

---

## 🎓 参考资源

- [GitHub 官方文档：创建模板仓库](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)
- [GitHub 官方文档：从模板创建仓库](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
- [Awesome GitHub Templates](https://github.com/topics/github-template)

---

## ✅ 配置检查清单

- [ ] 仓库已推送到 GitHub
- [ ] 已启用 "Make template" 选项
- [ ] "Use this template" 按钮可见
- [ ] `TEMPLATE-README.md` 已更新
- [ ] Issue 模板已配置
- [ ] 许可证已添加（可选）
- [ ] 演示文档已准备（可选）

---

**维护者**: @威少  
**更新**: 2026-04-22  
**版本**: v1.0
