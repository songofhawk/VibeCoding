-- =====================================================
-- 修复 profiles 表的 RLS 策略
-- =====================================================
-- 在 Supabase Dashboard > SQL Editor 中执行此脚本
-- 用途：确保所有人都能查看 profiles 表的数据

-- =====================================================
-- 第一步：检查当前 RLS 状态
-- =====================================================

-- 查看 profiles 表的 RLS 策略
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
WHERE schemaname = 'public'
  AND tablename = 'profiles';

-- =====================================================
-- 第二步：删除可能冲突的旧策略
-- =====================================================

-- 删除所有现有的 SELECT 策略
DROP POLICY IF EXISTS "Anyone can view profiles" ON public.profiles;
DROP POLICY IF EXISTS "Public profiles are viewable by everyone" ON public.profiles;
DROP POLICY IF EXISTS "Profiles are viewable by everyone" ON public.profiles;

-- =====================================================
-- 第三步：创建新的公开查看策略
-- =====================================================

-- 创建允许所有人查看 profiles 的策略
CREATE POLICY "Enable read access for all users"
ON public.profiles
FOR SELECT
TO public
USING (true);

-- =====================================================
-- 第四步：确保 RLS 已启用
-- =====================================================

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- 第五步：验证配置
-- =====================================================

-- 再次查看 profiles 表的 RLS 策略
SELECT
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename = 'profiles'
ORDER BY policyname;

-- 测试查询（应该能看到所有 profiles）
SELECT
    id,
    username,
    email,
    created_at
FROM public.profiles
ORDER BY created_at DESC
LIMIT 5;

-- =====================================================
-- 完成！
-- =====================================================
--
-- 更新内容：
-- 1. ✅ 删除了可能冲突的旧 RLS 策略
-- 2. ✅ 创建了新的公开查看策略
-- 3. ✅ 确保 RLS 已启用
-- 4. ✅ 验证了配置
--
-- 现在前端应该可以查询到 profiles 数据了！
--
-- =====================================================
