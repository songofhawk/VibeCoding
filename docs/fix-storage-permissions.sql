-- =====================================================
-- 修复 Supabase Storage 权限问题
-- =====================================================
-- 错误信息: "new row violates row-level security policy"
-- 原因: Storage 的 RLS 策略未配置
-- 解决: 执行此脚本配置 Storage 访问策略
-- =====================================================

-- 第一步：检查 storage.buckets 表的 RLS 是否启用
-- 查看当前 bucket 配置
SELECT
    id,
    name,
    public,
    avif_autodetection,
    file_size_limit,
    allowed_mime_types
FROM storage.buckets
WHERE name = 'cat-images';

-- =====================================================
-- 第二步：配置 storage.objects 的 RLS 策略
-- =====================================================

-- 删除旧策略（如果存在）
DROP POLICY IF EXISTS "Allow public access to cat images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public uploads to cat images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public updates to cat images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public deletes to cat images" ON storage.objects;

-- 策略 1: 允许所有人查看 cat-images 中的文件
CREATE POLICY "Allow public access to cat images"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'cat-images');

-- 策略 2: 允许所有人上传到 cat-images
CREATE POLICY "Allow public uploads to cat images"
ON storage.objects FOR INSERT
TO public
WITH CHECK (bucket_id = 'cat-images');

-- 策略 3: 允许所有人更新 cat-images 中的文件
CREATE POLICY "Allow public updates to cat images"
ON storage.objects FOR UPDATE
TO public
USING (bucket_id = 'cat-images')
WITH CHECK (bucket_id = 'cat-images');

-- 策略 4: 允许所有人删除 cat-images 中的文件
CREATE POLICY "Allow public deletes to cat images"
ON storage.objects FOR DELETE
TO public
USING (bucket_id = 'cat-images');

-- =====================================================
-- 第三步：验证策略是否创建成功
-- =====================================================

-- 查看所有 storage.objects 的策略
SELECT
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE schemaname = 'storage'
  AND tablename = 'objects'
ORDER BY policyname;

-- 查看专门针对 cat-images 的策略
SELECT
    policyname,
    cmd as operation,
    CASE
        WHEN cmd = 'SELECT' THEN '查看'
        WHEN cmd = 'INSERT' THEN '上传'
        WHEN cmd = 'UPDATE' THEN '更新'
        WHEN cmd = 'DELETE' THEN '删除'
        ELSE cmd
    END as operation_cn
FROM pg_policies
WHERE schemaname = 'storage'
  AND tablename = 'objects'
  AND policyname LIKE '%cat%';

-- =====================================================
-- 完成！
-- =====================================================
--
-- 执行此脚本后：
-- 1. 应该看到 4 个策略被创建
-- 2. 返回到测试页面 test_storage.html
-- 3. 选择一张图片并点击"上传图片"
-- 4. 应该上传成功并显示图片预览
--
-- 如果仍然失败，请检查：
-- - cat-images bucket 是否已创建
-- - bucket 的 public 属性是否为 true
-- - 控制台中的详细错误信息
--
-- =====================================================
