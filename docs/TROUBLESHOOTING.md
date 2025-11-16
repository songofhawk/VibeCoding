# 故障排除指南

本文档列出了常见问题及其解决方案。

## 1. 添加猫咪时出现 "duplicate key value violates unique constraint" 错误

### 问题描述
当你尝试添加新猫咪时，看到以下错误：
```
{
    "code": "23505",
    "details": null,
    "hint": null,
    "message": "duplicate key value violates unique constraint \"cat_pkey\""
}
```

### 原因
这个问题是因为数据库的 ID 序列（sequence）当前值比表中已有的最大 ID 还小，导致自动生成的 ID 与现有记录冲突。

这通常发生在以下情况：
- 手动插入过带有指定 ID 的数据
- 从备份恢复数据后没有重置序列
- 数据库迁移过程中序列没有正确同步

### 解决方案

**步骤 1：在 Supabase Dashboard > SQL Editor 中执行修复脚本**

```sql
-- 使用 pg_get_serial_sequence 自动找到正确的序列并重置
SELECT setval(
    pg_get_serial_sequence('public.cats', 'id'),
    COALESCE((SELECT MAX(id) FROM public.cats), 0) + 1,
    false
);
```

或者直接执行完整的修复脚本：[docs/fix-id-sequence.sql](fix-id-sequence.sql)

**步骤 2：验证修复**

```sql
-- 查看当前表中的最大 ID
SELECT MAX(id) AS max_id FROM public.cats;

-- 查看序列的当前值（应该比最大 ID 大）
SELECT
    (SELECT MAX(id) FROM public.cats) AS max_table_id,
    last_value AS current_sequence_value,
    last_value > (SELECT MAX(id) FROM public.cats) AS is_fixed
FROM pg_sequences
WHERE schemaname = 'public'
  AND sequencename = (
    SELECT split_part(pg_get_serial_sequence('public.cats', 'id'), '.', 2)
  );
```

**步骤 3：测试添加猫咪**

回到应用，再次尝试添加猫咪，应该可以正常工作了。

---

## 2. 图片上传失败

### 问题描述
上传图片时失败，控制台显示权限错误或上传错误。

### 可能的原因和解决方案

#### 原因 1：Storage Bucket 不存在
**解决方案**：
1. 进入 Supabase Dashboard > Storage
2. 创建一个名为 `cat-images` 的 bucket
3. 勾选 "Public bucket"

#### 原因 2：Storage RLS 策略未配置
**解决方案**：
执行 [docs/setup-storage.sql](setup-storage.sql) 脚本

#### 原因 3：未登录
**解决方案**：
- 用户认证功能启用后，只有登录用户才能上传图片
- 点击右上角"登录"按钮登录

---

## 3. 无法编辑或删除猫咪

### 问题描述
点击"编辑信息"按钮后无法保存，或者保存时提示权限错误。

### 原因
用户认证功能启用后，用户只能编辑自己创建的猫咪。

### 解决方案

#### 情况 1：猫咪没有 user_id
如果猫咪是在添加用户认证功能之前创建的，它们没有 `user_id`，所以无法编辑。

**解决方案**：在 SQL Editor 中将现有猫咪分配给某个用户
```sql
-- 查看所有用户
SELECT id, email FROM auth.users;

-- 将所有没有 user_id 的猫咪分配给某个用户
UPDATE public.cats
SET user_id = 'YOUR_USER_ID_HERE'
WHERE user_id IS NULL;
```

#### 情况 2：尝试编辑别人的猫咪
用户只能编辑自己创建的猫咪，无法编辑其他用户的猫咪。这是正常的权限保护行为。

---

## 4. 邮箱验证邮件收不到

### 问题描述
注册后没有收到验证邮件。

### 解决方案

#### 步骤 1：检查垃圾邮件文件夹
Supabase 的邮件可能被标记为垃圾邮件。

#### 步骤 2：禁用邮箱验证（仅用于开发测试）
1. 进入 Supabase Dashboard > Authentication > Settings
2. 找到 "Email" 部分
3. 关闭 "Confirm email" 选项

**注意**：生产环境建议保持邮箱验证开启！

#### 步骤 3：配置自定义邮件服务（可选）
在 Authentication > Settings > Email Template 中配置自定义 SMTP 服务。

---

## 5. 登录后页面没有反应

### 问题描述
输入邮箱密码点击登录后，没有任何反应或一直转圈。

### 解决方案

#### 步骤 1：检查浏览器控制台
打开浏览器开发者工具（F12），查看 Console 标签页是否有错误信息。

#### 步骤 2：检查 Supabase 配置
确认 [index.html](../index.html) 中的 Supabase 配置正确：
```javascript
const SUPABASE_URL = 'https://vswrhnmhumfxgfrwpfwc.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR_ACTUAL_KEY_HERE';
```

#### 步骤 3：清除浏览器缓存
有时旧的 JavaScript 代码被缓存，导致问题。清除缓存并刷新页面。

---

## 6. RLS 策略错误

### 问题描述
操作时出现 "violates row-level security policy" 错误。

### 解决方案

#### 步骤 1：执行认证配置脚本
执行 [docs/setup-auth.sql](setup-auth.sql) 脚本，确保所有 RLS 策略正确配置。

#### 步骤 2：检查用户状态
```sql
-- 查看当前认证用户
SELECT auth.uid();

-- 查看用户的猫咪
SELECT * FROM public.cats WHERE user_id = auth.uid();
```

#### 步骤 3：临时禁用 RLS（仅用于调试）
```sql
-- 禁用 RLS（不推荐在生产环境使用）
ALTER TABLE public.cats DISABLE ROW LEVEL SECURITY;

-- 重新启用 RLS
ALTER TABLE public.cats ENABLE ROW LEVEL SECURITY;
```

---

## 7. 图片显示为占位符

### 问题描述
猫咪卡片上的图片不显示，只显示占位的 SVG。

### 可能的原因和解决方案

#### 原因 1：图片 URL 无效
检查数据库中的 `images` 字段是否包含有效的 URL。

#### 原因 2：CORS 问题
如果图片来自外部网站（如 Unsplash），可能被 CORS 策略阻止。

**解决方案**：上传自己的图片到 Supabase Storage。

#### 原因 3：Storage 权限问题
检查 Storage 的 RLS 策略是否允许公开读取：
```sql
-- 允许所有人查看图片
CREATE POLICY "Anyone can view cat images"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'cat-images');
```

---

## 8. 性能问题

### 问题描述
加载猫咪列表很慢，或者页面卡顿。

### 解决方案

#### 优化 1：添加数据库索引
```sql
-- 在常用查询字段上创建索引
CREATE INDEX IF NOT EXISTS idx_cats_user_id ON public.cats (user_id);
CREATE INDEX IF NOT EXISTS idx_cats_created_at ON public.cats (created_at DESC);
```

#### 优化 2：限制查询数量
修改 `loadCatsFromDatabase` 函数，添加限制：
```javascript
const { data, error } = await supabase
    .from('cats')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(20); // 只加载最新的 20 只猫咪
```

#### 优化 3：图片优化
- 压缩图片大小（建议小于 1MB）
- 使用合适的图片格式（JPEG 适合照片，PNG 适合图标）
- 考虑使用 CDN

---

## 需要更多帮助？

如果以上解决方案都无法解决你的问题，请：

1. 检查浏览器控制台的完整错误信息
2. 检查 Supabase Dashboard > Logs 中的错误日志
3. 查看 [Supabase 官方文档](https://supabase.com/docs)
4. 在项目 Issues 中提问

---

## 相关文档

- [Supabase 配置指南](supabase-config-guide.md)
- [数据库设置步骤](SETUP_SUPABASE.md)
- [用户认证配置](setup-auth.sql)
- [Storage 设置指南](SETUP_STORAGE.md)