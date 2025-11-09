# Supabase Storage 设置指南

## 概述

本指南将帮助你配置 Supabase Storage，实现图片云端存储功能，替代原有的 localStorage 方案。

## 为什么要迁移到 Supabase Storage？

### 当前方案（localStorage）的问题：
- ✗ 存储空间限制（5-10MB）
- ✗ 容易触发 QuotaExceededError
- ✗ 数据仅存在本地，无法跨设备同步
- ✗ Base64 编码增加 33% 的存储开销

### 新方案（Supabase Storage）的优势：
- ✓ 更大的存储空间（Free tier: 1GB）
- ✓ 云端同步，可跨设备访问
- ✓ CDN 加速，全球访问更快
- ✓ 直接存储原始文件，无编码开销
- ✓ 支持更大的文件（最大 50MB）

## 设置步骤

### 第一步：在 Supabase Dashboard 创建 Storage Bucket

1. 访问 [Supabase Dashboard](https://supabase.com/dashboard)
2. 选择你的项目: `vswrhnmhumfxgfrwpfwc`
3. 点击左侧菜单 **Storage**
4. 点击右上角 **New bucket** 按钮
5. 填写 Bucket 信息：
   - **Name**: `cat-images`
   - **Public bucket**: ✅ **勾选**（允许公开访问）
6. 点击 **Create bucket**

### 第二步：配置 Storage 访问策略

1. 在 Supabase Dashboard 中，点击左侧 **SQL Editor**
2. 点击 **New query**
3. 复制并粘贴以下 SQL 代码：

```sql
-- 允许所有人查看图片
CREATE POLICY IF NOT EXISTS "Allow public access to cat images"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'cat-images');

-- 允许所有人上传图片
CREATE POLICY IF NOT EXISTS "Allow public uploads to cat images"
ON storage.objects FOR INSERT
TO public
WITH CHECK (bucket_id = 'cat-images');

-- 允许所有人更新图片
CREATE POLICY IF NOT EXISTS "Allow public updates to cat images"
ON storage.objects FOR UPDATE
TO public
USING (bucket_id = 'cat-images');

-- 允许所有人删除图片
CREATE POLICY IF NOT EXISTS "Allow public deletes to cat images"
ON storage.objects FOR DELETE
TO public
USING (bucket_id = 'cat-images');
```

4. 点击 **Run** 执行 SQL

### 第三步：更新数据库表结构

在同一个 SQL Editor 中，继续执行：

```sql
-- 添加 images 字段存储图片 URLs
ALTER TABLE public.cats
ADD COLUMN IF NOT EXISTS images text[];

-- 添加注释
COMMENT ON COLUMN public.cats.images IS 'Array of image URLs from Supabase Storage';
```

### 第四步：验证配置

#### 1. 测试 Storage 连接

打开测试页面：

```bash
open tools/test_storage.html
```

或在浏览器中访问：`file:///Users/helix/Desktop/VibeCoding/tools/test_storage.html`

#### 2. 执行测试步骤

1. **连接测试**：页面加载后自动测试，应显示 "✓ Supabase 连接成功"
2. **Bucket 测试**：点击 "测试 Bucket 访问" 按钮，应显示 "✓ cat-images Bucket 已创建并可访问"
3. **上传测试**：
   - 点击 "选择文件" 选择一张图片
   - 点击 "上传图片" 按钮
   - 应显示 "✓ 上传成功！" 并显示图片预览
4. **表结构测试**：点击 "检查 images 字段" 按钮，应显示 "✓ images 字段存在且可访问"

### 第五步：在主应用中测试

1. 打开主应用：

```bash
open index.html
```

2. 测试图片上传：
   - 悬停在任意猫咪卡片的图片上
   - 点击 "📷 选择照片" 按钮
   - 选择一张或多张图片
   - 观察上传按钮变为 "📤 上传中..."
   - 上传完成后，图片应显示在卡片上

3. 检查控制台（F12）：
   - 应看到 "开始上传 X 张图片到 Supabase Storage..."
   - 应看到 "✓ 成功上传 X 张图片到 Supabase Storage"
   - 应看到 "✓ 图片 URLs 已保存到数据库"

4. 验证数据持久化：
   - 刷新页面（F5）
   - 上传的图片应该仍然显示
   - 说明图片已成功保存到 Supabase Storage 和数据库

### 第六步：在 Supabase Dashboard 验证

1. 点击左侧 **Storage**
2. 选择 **cat-images** bucket
3. 应该看到上传的图片文件，按猫咪 ID 分文件夹存储
4. 文件命名格式：`{catId}/{timestamp}_{randomString}.{ext}`

例如：`1/1699500000000_abc123.jpg`

## 文件结构说明

上传的图片按以下规则组织：

```
cat-images/
├── 1/                      # 猫咪 ID 为 1 的图片
│   ├── 1699500000000_abc123.jpg
│   ├── 1699500001000_def456.jpg
│   └── ...
├── 2/                      # 猫咪 ID 为 2 的图片
│   ├── 1699500002000_ghi789.jpg
│   └── ...
└── test/                   # 测试图片（可手动删除）
    └── 1699500003000_jkl012.jpg
```

## 数据库字段说明

### cats.images 字段

- **类型**：`text[]`（文本数组）
- **用途**：存储图片的公开 URL
- **示例值**：
  ```json
  [
    "https://vswrhnmhumfxgfrwpfwc.supabase.co/storage/v1/object/public/cat-images/1/1699500000000_abc123.jpg",
    "https://vswrhnmhumfxgfrwpfwc.supabase.co/storage/v1/object/public/cat-images/1/1699500001000_def456.jpg"
  ]
  ```

## 代码实现说明

### 关键函数

#### 1. `uploadImageToStorage(file, catId)`
上传单个图片文件到 Supabase Storage

#### 2. `updateCatImages(catId, imageUrls)`
更新数据库中的图片 URL 数组

#### 3. `processMultipleImages(files, catId, card)`
处理多张图片上传，支持自动降级到 localStorage

### 降级策略

代码实现了自动降级机制：

1. **优先使用 Supabase Storage**：如果 Supabase 可用，上传到云端
2. **自动降级到 localStorage**：如果 Supabase 不可用，自动切换到 localStorage
3. **双重备份**：即使使用 Supabase，也会同时保存到 localStorage 作为备份

## 故障排查

### 问题 1：上传失败，提示 "bucket not found"

**原因**：cat-images bucket 不存在

**解决方案**：
1. 检查是否在第一步中正确创建了 bucket
2. 确认 bucket 名称为 `cat-images`（全小写，带连字符）

### 问题 2：上传失败，提示 "permission denied"

**原因**：Storage 策略未正确配置

**解决方案**：
1. 重新执行第二步中的 SQL 命令
2. 在 Dashboard > Storage > cat-images > Policies 中检查策略是否存在

### 问题 3：上传成功但无法显示图片

**原因**：Bucket 未设置为 Public

**解决方案**：
1. 在 Dashboard > Storage 中找到 cat-images bucket
2. 点击设置图标，确认 "Public bucket" 已勾选

### 问题 4：表结构测试失败，提示 "column does not exist"

**原因**：未添加 images 字段

**解决方案**：
1. 重新执行第三步中的 SQL 命令
2. 刷新页面重新测试

### 问题 5：图片上传后刷新页面消失

**原因**：数据库更新失败，仅保存到了 localStorage

**解决方案**：
1. 检查控制台错误信息
2. 确认第三步的表结构更新已执行
3. 确认 RLS 策略允许更新 cats 表

## 性能和限制

### Supabase Free Tier 限制：
- **存储空间**：1 GB
- **单文件大小**：最大 50 MB
- **带宽**：每月 2 GB
- **API 请求**：无限制

### 最佳实践：
1. **图片压缩**：上传前压缩大图片（推荐 < 2MB）
2. **格式选择**：优先使用 JPEG（体积小）或 WebP（现代格式）
3. **数量限制**：每只猫咪建议不超过 10 张图片
4. **定期清理**：删除不需要的图片

## 后续优化建议

1. **图片压缩**：上传前自动压缩图片
2. **缩略图**：生成缩略图以加快加载速度
3. **懒加载**：使用 Intersection Observer 实现图片懒加载
4. **进度条**：显示上传进度
5. **批量操作**：支持批量删除图片
6. **图片编辑**：添加裁剪、旋转等功能

## 相关文档

- [迁移方案设计](migrate-to-supabase-storage.md)
- [Supabase Storage 文档](https://supabase.com/docs/guides/storage)
- [Supabase 配置指南](supabase-config-guide.md)

## 完成清单

配置完成后，确认以下项目都已完成：

- [ ] 在 Supabase Dashboard 创建了 cat-images bucket
- [ ] Bucket 设置为 Public
- [ ] 执行了 Storage 策略 SQL
- [ ] 执行了表结构更新 SQL
- [ ] test_storage.html 所有测试通过
- [ ] 主应用可以成功上传图片
- [ ] 上传的图片刷新后仍然显示
- [ ] 在 Supabase Dashboard 可以看到上传的文件

全部完成后，你的应用已成功迁移到 Supabase Storage！ 🎉
