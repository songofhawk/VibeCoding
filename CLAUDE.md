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
1. **加载**：从 Supabase 加载猫咪数据（包括图片 URLs）→ 从 localStorage 加载本地更改（向后兼容）
2. **编辑**：修改数据 → 保存到 Supabase → 同步保存到 localStorage（备份）
3. **图片上传**：
   - 优先上传到 Supabase Storage → 获取公开 URL → 保存到数据库 images 字段
   - 自动降级到 localStorage（如果 Supabase 不可用）
   - 双重备份（Storage + localStorage）
4. **图片显示**：自动轮播显示，支持多张图片
5. **GIF 生成**：使用 gifshot 库从多张图片生成轮播 GIF

### 数据库操作：
- 使用 Supabase JS SDK 的 `.from('cats')` API
- 映射规则：
  - `sex` 字段：1=公, 2=母
  - `tags` 字段：逗号分隔字符串转数组
  - `age` 字段：数字转 "X岁" 格式字符串

### Storage 操作：
- 使用 Supabase Storage API：
  - `supabase.storage.from('cat-images').upload()`: 上传图片
  - `supabase.storage.from('cat-images').getPublicUrl()`: 获取公开 URL
  - 文件命名：`{catId}/{timestamp}_{randomString}.{ext}`

### 本地存储（向后兼容）：
- 使用 `localStorage` 作为备份和降级方案：
  - `cat-images-{catId}`: 猫咪的图片数组（Supabase URLs 或 Base64）
  - `cat-data-{catId}`: 猫咪的基本信息（作为 Supabase 的备份）

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

### Supabase 配置
- [Supabase 配置指南](docs/supabase-config-guide.md) - 如何获取和配置 Supabase
- [数据库设置步骤](docs/SETUP_SUPABASE.md) - 详细的数据库配置步骤
- [Storage 设置指南](docs/SETUP_STORAGE.md) - Storage 完整配置指南
- [Storage 迁移方案](docs/migrate-to-supabase-storage.md) - Storage 技术实现细节
- [SQL 配置脚本](docs/setup-storage.sql) - Storage 数据库配置 SQL
