# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.


### 代码组织：
- **阶段 1-4**：单文件 `index.html`（当前阶段）
- **阶段 5+**：分离为 `index.html`、`style.css`、`script.js`
- **阶段 6+**：添加 `/api` 文件夹存放后端代码
- 代码要简洁，避免过度封装和抽象

## 数据库配置

### Supabase 连接信息：
- **Project URL**: `https://vswrhnmhumfxgfrwpfwc.supabase.co`
- **Project ID**: `vswrhnmhumfxgfrwpfwc`
- **Anon Key**: 在代码中已配置（可在 Supabase Dashboard > Settings > API 获取）



**配置步骤**：
1. 在 Supabase Dashboard 创建 Storage Bucket
2. 配置 Storage 策略（允许公开上传/访问）
3. 更新数据库表结构（添加 images 字段）

详细配置指南参见 [docs/SETUP_STORAGE.md](docs/SETUP_STORAGE.md)。

## 常用开发任务

### 本地开发：
```bash
# 直接在浏览器中打开 index.html
open index.html

# 或使用 Python 简单 HTTP 服务器
python3 -m http.server 8000
# 然后访问 http://localhost:8000
```

### 测试 Supabase 连接：
```bash
# 在浏览器中打开测试页面
open tools/test_supabase.html
```

### 测试 Supabase Storage：
```bash
# 在浏览器中打开 Storage 测试页面
open tools/test_storage.html
```

### 插入演示数据：
```bash
# 在浏览器中打开数据插入工具
open tools/insert_demo_data.html
```

### 部署到 GitHub Pages：
项目已配置 GitHub Pages，主分支的根目录内容会自动部署。

## 项目结构

```
VibeCoding/
├── index.html              # 主应用（猫咪展示卡片）
├── prd.md                  # 项目需求文档和技术规则
├── docs/                   # 文档目录
│   ├── supabase-config-guide.md  # Supabase 配置指南
│   └── SETUP_SUPABASE.md         # Supabase 设置步骤
├── tools/                  # 工具页面
│   ├── test_supabase.html        # Supabase 连接测试
│   ├── test_storage.html         # Supabase Storage 测试
│   └── insert_demo_data.html     # 演示数据插入工具
├── images/                 # 图片资源
└── practice/               # 练习和历史代码
    ├── chapters/           # 早期章节练习
    └── countdown.html      # 倒计时练习页面
```

## 核心功能实现

### 数据流：
1. **加载**：从 Supabase 加载猫咪数据（包括图片 URLs）
2. **编辑**：修改数据 → 保存到 Supabase（数据库为唯一数据源）
3. **图片上传**：
   - 上传到 Supabase Storage → 获取公开 URL → 保存到数据库 images 字段
   - 文件路径：`{user_id}/{cat_id}/{timestamp}_{randomString}.{ext}`
4. **图片显示**：自动轮播显示，支持多张图片
5. **GIF 生成**：使用 gifshot 库从多张图片生成轮播 GIF
6. **用户认证**：
   - Supabase Auth 集成
   - 邮箱 + 密码注册/登录
   - 自动登录状态维护
7. **互动功能**：
   - 点赞：❤️ 每个用户对每只猫只能点赞一次
   - 评论：💬 登录用户可以发表评论，所有人可查看

### 数据库操作：
- 使用 Supabase JS SDK 的 API
- **cats 表**：
  - `sex` 字段：1=公, 2=母
  - `tags` 字段：逗号分隔字符串转数组
  - `age` 字段：数字转 "X岁" 格式字符串
  - `user_id` 字段：关联到 auth.users，标识猫咪所有者
- **likes 表**：存储点赞记录，联合唯一索引 (cat_id, user_id)
- **comments 表**：存储评论，包含 cat_id, user_id, content

### Storage 操作：
- 使用 Supabase Storage API：
  - `supabase.storage.from('cat-images').upload()`: 上传图片
  - `supabase.storage.from('cat-images').getPublicUrl()`: 获取公开 URL
  - 文件路径：`{user_id}/{cat_id}/{timestamp}_{randomString}.{ext}`

### 权限控制（RLS）：
- **cats 表**：
  - 所有人可以查看所有猫咪
  - 只有登录用户可以添加猫咪
  - 只有所有者可以编辑/删除自己的猫咪
- **likes 表**：
  - 所有人可以查看点赞
  - 只有登录用户可以点赞
  - 只能删除自己的点赞
- **comments 表**：
  - 所有人可以查看评论
  - 只有登录用户可以评论
  - 只能修改/删除自己的评论

## 功能实现原则

### 新功能开发：
- 每次只修改一个功能，不做大规模重构
- 优先使用浏览器原生 API
- 图片上传要处理压缩和格式转换（未来计划）
- 保持代码直观易懂，避免过度抽象

### 错误处理：
- 数据库操作失败时，降级使用 localStorage
- 图片加载失败时，显示占位 SVG
- 存储空间不足时，提示用户并提供解决方案

## 重要注意事项

1. **不要创建 package.json** - 项目不使用 npm，所有依赖通过 CDN
2. **不要引入构建步骤** - 代码应直接在浏览器中运行
3. **保持单文件结构** - 除非进入阶段 5+，否则保持单 HTML 文件
4. **RLS 策略** - 修改数据库表结构时，记得同步更新 RLS 策略
5. **localStorage 限制** - Base64 图片会占用大量空间，注意处理 QuotaExceededError
6. **CORS 问题** - 生成 GIF 时使用的外部图片需要支持 CORS

## 调试技巧

### 查看 Supabase 连接状态：
```javascript
// 在浏览器控制台执行
console.log('Supabase enabled:', supabaseEnabled);
console.log('Supabase client:', supabase);
```

### 查看 localStorage 数据：
```javascript
// 查看所有猫咪数据
for (let i = 0; i < localStorage.length; i++) {
  const key = localStorage.key(i);
  if (key.startsWith('cat-')) {
    console.log(key, JSON.parse(localStorage.getItem(key)));
  }
}
```

### 清除 localStorage：
```javascript
// 清除所有猫咪数据
Object.keys(localStorage)
  .filter(key => key.startsWith('cat-'))
  .forEach(key => localStorage.removeItem(key));
```

## 相关文档

### 核心文档
- [PRD 文档](prd.md) - 完整的项目需求和技术规则
- [迁移总结](STORAGE_MIGRATION.md) - Storage 迁移完成总结
- [互动功能说明](docs/INTERACTIONS.md) - 点赞和评论功能详细说明

### Supabase 配置
- [Supabase 配置指南](docs/supabase-config-guide.md) - 如何获取和配置 Supabase
- [数据库设置步骤](docs/SETUP_SUPABASE.md) - 详细的数据库配置步骤
- [Storage 设置指南](docs/SETUP_STORAGE.md) - Storage 完整配置指南
- [Storage 迁移方案](docs/migrate-to-supabase-storage.md) - Storage 技术实现细节

### SQL 配置脚本
- [setup-storage.sql](docs/setup-storage.sql) - Storage 数据库配置
- [setup-auth.sql](docs/setup-auth.sql) - 用户认证配置
- [setup-interactions.sql](docs/setup-interactions.sql) - 互动功能（点赞&评论）配置
