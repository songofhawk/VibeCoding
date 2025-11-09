-- Supabase Storage 配置脚本
-- 在 Supabase Dashboard > SQL Editor 中执行

-- =====================================================
-- 第一步：更新 cats 表结构，添加 images 字段
-- =====================================================

-- 添加 images 字段存储图片 URLs（如果不存在）
ALTER TABLE public.cats
ADD COLUMN IF NOT EXISTS images text[];

-- 添加注释
COMMENT ON COLUMN public.cats.images IS 'Array of image URLs from Supabase Storage';

-- =====================================================
-- 第二步：创建 Storage Bucket（在 UI 中操作）
-- =====================================================
-- 注意：这一步需要在 Supabase Dashboard 中手动操作
-- 1. 点击左侧 Storage
-- 2. 点击 New bucket
-- 3. Bucket name: cat-images
-- 4. 勾选 Public bucket
-- 5. 点击 Create bucket

-- =====================================================
-- 第三步：配置 Storage 策略（允许公开访问）
-- =====================================================

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

-- =====================================================
-- 第四步：验证配置
-- =====================================================

-- 查看 cats 表结构
SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'cats'
ORDER BY ordinal_position;

-- 查看现有的 Storage 策略
SELECT
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE schemaname = 'storage'
  AND tablename = 'objects'
  AND policyname LIKE '%cat%';

-- =====================================================
-- 完成！
-- =====================================================
-- 现在可以测试上传功能了：
-- 1. 打开 index.html
-- 2. 点击任意猫咪卡片的上传按钮
-- 3. 选择图片文件
-- 4. 查看控制台确认上传成功
-- 5. 在 Supabase Dashboard > Storage > cat-images 中查看上传的文件
