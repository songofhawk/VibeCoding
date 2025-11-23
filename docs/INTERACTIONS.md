# 互动功能说明文档

## 概述

本文档说明如何使用和配置猫咪展示应用的互动功能（点赞和评论）。

## 功能特性

### 1. 点赞功能 ❤️
- ✅ 所有人都可以查看点赞数
- ✅ 登录用户可以点赞/取消点赞
- ✅ 每个用户对每只猫只能点赞一次
- ✅ 实时更新点赞数量
- ✅ 点赞状态持久化保存

### 2. 评论功能 💬
- ✅ 所有人都可以查看评论
- ✅ 登录用户可以发表评论
- ✅ 评论按时间倒序显示（最新的在上面）
- ✅ 显示评论者用户名和发表时间
- ✅ 支持评论区展开/收起
- ✅ XSS 防护（自动转义 HTML）

## 数据库配置

### 第一步：创建数据库表

在 Supabase SQL Editor 中执行 [setup-interactions.sql](setup-interactions.sql) 脚本。

该脚本会自动创建：
1. `likes` 表 - 存储点赞记录
2. `comments` 表 - 存储评论
3. RLS 策略 - 确保数据安全
4. 辅助函数 - 优化查询性能

### 数据表结构

#### likes 表
```sql
CREATE TABLE likes (
    id BIGSERIAL PRIMARY KEY,
    cat_id BIGINT REFERENCES cats(id),
    user_id UUID REFERENCES auth.users(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(cat_id, user_id)
);
```

#### comments 表
```sql
CREATE TABLE comments (
    id BIGSERIAL PRIMARY KEY,
    cat_id BIGINT REFERENCES cats(id),
    user_id UUID REFERENCES auth.users(id),
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

## 权限控制（RLS 策略）

### Likes 表权限
- **查看**：所有人（包括未登录用户）
- **添加**：仅登录用户，且只能以自己的身份点赞
- **删除**：仅能删除自己的点赞

### Comments 表权限
- **查看**：所有人（包括未登录用户）
- **添加**：仅登录用户，且只能以自己的身份发表
- **修改**：仅能修改自己的评论
- **删除**：仅能删除自己的评论

## 前端实现

### UI 组件

每个猫咪卡片底部都有互动区域，包含：

1. **点赞按钮**
   - 显示点赞图标和数量
   - 点击切换点赞状态
   - 已点赞时按钮变红色

2. **评论按钮**
   - 显示评论图标和数量
   - 点击展开/收起评论区

3. **评论区**
   - 评论列表（可滚动）
   - 评论输入框（仅登录用户可见）
   - 发送按钮

### 关键功能函数

#### setupInteractions(card, catId)
设置卡片的互动功能，协调所有子功能。

#### loadLikesAndComments(card, catId)
从数据库加载点赞和评论数据。

#### setupLikeButton(card, catId)
设置点赞按钮的点击事件处理。

#### setupCommentForm(card, catId)
设置评论表单的提交处理。

#### renderComments(card, comments)
渲染评论列表到 DOM。

## 使用方法

### 用户操作流程

#### 点赞
1. 用户点击 ❤️ 按钮
2. 如果未登录，弹出登录窗口
3. 如果已登录：
   - 未点赞 → 添加点赞，数量 +1，按钮变红
   - 已点赞 → 取消点赞，数量 -1，按钮恢复

#### 评论
1. 用户点击评论输入框
2. 如果未登录，弹出登录窗口
3. 输入评论内容
4. 点击"发送"按钮
5. 评论立即显示在列表顶部
6. 输入框清空，等待下次输入

## 安全性

### 1. XSS 防护
所有用户输入的评论内容都会通过 `escapeHtml()` 函数转义，防止注入攻击。

```javascript
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}
```

### 2. RLS 策略保护
数据库层面强制执行权限检查：
- 用户只能以自己的身份添加点赞/评论
- 用户只能删除/修改自己的内容
- 防止伪造其他用户的身份

### 3. 前端验证
- 检查用户登录状态
- 验证表单输入不为空
- 防止重复提交（禁用按钮）

## 样式定制

互动区域的样式可以通过以下 CSS 类修改：

```css
.cat-interactions       /* 互动区域容器 */
.interaction-buttons    /* 按钮容器 */
.interaction-btn        /* 互动按钮 */
.interaction-btn.liked  /* 已点赞状态 */
.comments-section       /* 评论区 */
.comment-item           /* 单条评论 */
.comment-form           /* 评论表单 */
```

## 性能优化

### 1. 索引优化
数据库表已添加索引：
- `likes(cat_id)` - 快速查询某只猫的所有点赞
- `likes(user_id)` - 快速查询某用户的所有点赞
- `comments(cat_id)` - 快速查询某只猫的所有评论

### 2. 按需加载
- 评论区默认收起，减少初始渲染
- 点击"查看评论"才加载评论列表

### 3. 乐观更新
点赞操作采用乐观更新策略，先更新 UI，后台同步数据库，提升用户体验。

## 故障排除

### 问题：点赞/评论功能不工作

**可能原因 1**：数据库表未创建
- **解决方法**：在 Supabase SQL Editor 中执行 [setup-interactions.sql](setup-interactions.sql)

**可能原因 2**：RLS 策略配置错误
- **检查方法**：在 Supabase Dashboard > Authentication > Policies 查看策略
- **解决方法**：删除现有策略，重新执行 SQL 脚本

**可能原因 3**：用户未登录
- **解决方法**：确保用户已登录，检查 `currentUser` 是否存在

### 问题：评论显示不正确

**可能原因**：评论数据格式问题
- **检查方法**：打开浏览器控制台，查看是否有错误
- **解决方法**：检查 `comments` 表的数据结构是否正确

### 问题：性能问题

**可能原因**：大量评论导致渲染慢
- **解决方法**：
  1. 限制单次加载的评论数量（添加分页）
  2. 使用虚拟滚动优化长列表
  3. 增加数据库查询缓存

## 未来改进方向

### 短期优化
- [ ] 添加评论分页功能
- [ ] 支持评论排序（最新/最热）
- [ ] 添加评论删除功能
- [ ] 显示完整的用户昵称（而非邮箱前缀）

### 长期规划
- [ ] 支持评论回复（嵌套评论）
- [ ] 添加评论点赞功能
- [ ] 支持富文本评论（表情、图片）
- [ ] 实时通知（新评论提醒）
- [ ] 评论举报和审核机制

## 相关文件

- [setup-interactions.sql](setup-interactions.sql) - 数据库配置脚本
- [index.html](../index.html) - 主应用文件
- [CLAUDE.md](../CLAUDE.md) - 项目总体说明

## 技术栈

- **前端**：原生 JavaScript（ES6+）
- **后端**：Supabase（PostgreSQL + Auth + RLS）
- **样式**：原生 CSS3
- **安全**：RLS 策略 + XSS 防护

---

📝 最后更新：2025-01-17
