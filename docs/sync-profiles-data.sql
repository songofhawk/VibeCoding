-- =====================================================
-- 同步并修复 profiles 表数据
-- =====================================================
-- 在 Supabase Dashboard > SQL Editor 中执行此脚本
-- 用途：确保所有 auth.users 中的用户都有对应的 profile 记录

-- =====================================================
-- 第一步：检查数据情况
-- =====================================================

-- 查看 auth.users 中的用户
SELECT
    id,
    email,
    created_at,
    'auth.users' as source
FROM auth.users
ORDER BY created_at DESC;

-- 查看 profiles 中的用户
SELECT
    id,
    username,
    email,
    created_at,
    'profiles' as source
FROM public.profiles
ORDER BY created_at DESC;

-- 找出在 auth.users 中但不在 profiles 中的用户
SELECT
    au.id,
    au.email,
    au.created_at
FROM auth.users au
LEFT JOIN public.profiles p ON au.id = p.id
WHERE p.id IS NULL;

-- =====================================================
-- 第二步：为缺失的用户创建 profile 记录
-- =====================================================

-- 为所有在 auth.users 中但没有 profile 的用户创建记录
-- 使用 ROW_NUMBER 确保 username 唯一（如果有重复，添加数字后缀）
WITH ranked_users AS (
    SELECT
        au.id,
        au.email,
        au.created_at,
        split_part(au.email, '@', 1) as base_username,
        ROW_NUMBER() OVER (
            PARTITION BY split_part(au.email, '@', 1)
            ORDER BY au.created_at
        ) as rn
    FROM auth.users au
    LEFT JOIN public.profiles p ON au.id = p.id
    WHERE p.id IS NULL
)
INSERT INTO public.profiles (id, username, email, created_at, updated_at)
SELECT
    id,
    CASE
        WHEN rn = 1 THEN base_username
        ELSE base_username || '_' || rn
    END as username,
    email,
    created_at,
    NOW()
FROM ranked_users
ON CONFLICT (id) DO NOTHING;

-- =====================================================
-- 第三步：更新所有现有 profile 的 email（如果为空）
-- =====================================================

-- 从 auth.users 同步邮箱到 profiles（如果邮箱为空）
UPDATE public.profiles
SET email = auth.users.email
FROM auth.users
WHERE public.profiles.id = auth.users.id
AND (public.profiles.email IS NULL OR public.profiles.email = '');

-- =====================================================
-- 第四步：验证同步结果
-- =====================================================

-- 查看所有 profiles 记录
SELECT
    id,
    username,
    email,
    created_at
FROM public.profiles
ORDER BY created_at DESC;

-- 统计数量
SELECT
    'auth.users' as table_name,
    COUNT(*) as count
FROM auth.users
UNION ALL
SELECT
    'profiles' as table_name,
    COUNT(*) as count
FROM public.profiles;

-- 再次检查是否还有缺失的
SELECT
    COUNT(*) as missing_profiles_count
FROM auth.users au
LEFT JOIN public.profiles p ON au.id = p.id
WHERE p.id IS NULL;

-- =====================================================
-- 完成！
-- =====================================================
--
-- 执行结果说明：
-- - 如果 missing_profiles_count = 0，说明所有用户都有 profile 了
-- - 如果 auth.users.count = profiles.count，说明数据已完全同步
--
-- 现在刷新浏览器页面，评论应该可以显示用户邮箱了！
--
-- =====================================================
