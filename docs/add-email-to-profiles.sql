-- =====================================================
-- 为 profiles 表添加 email 字段
-- =====================================================
-- 在 Supabase Dashboard > SQL Editor 中执行此脚本
-- 用途：给 profiles 表添加 email 字段并同步现有用户的邮箱

-- =====================================================
-- 第一步：添加 email 字段
-- =====================================================

-- 添加 email 字段（如果不存在）
ALTER TABLE public.profiles
ADD COLUMN IF NOT EXISTS email text;

-- 添加注释
COMMENT ON COLUMN public.profiles.email IS '用户邮箱（从 auth.users 同步）';

-- =====================================================
-- 第二步：同步现有用户的邮箱
-- =====================================================

-- 从 auth.users 同步邮箱到 profiles
UPDATE public.profiles
SET email = auth.users.email
FROM auth.users
WHERE public.profiles.id = auth.users.id
AND public.profiles.email IS NULL;

-- =====================================================
-- 第三步：更新触发器函数（确保新用户注册时包含邮箱）
-- =====================================================

-- 更新触发器函数
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
    INSERT INTO public.profiles (id, username, email)
    VALUES (
        new.id,
        COALESCE(new.raw_user_meta_data->>'username', split_part(new.email, '@', 1)),
        new.email
    );
    RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
-- 第四步：验证更新
-- =====================================================

-- 查看 profiles 表结构
SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'profiles'
ORDER BY ordinal_position;

-- 查看 profiles 数据（检查 email 是否已填充）
SELECT
    id,
    username,
    email,
    created_at
FROM public.profiles
ORDER BY created_at DESC
LIMIT 10;

-- =====================================================
-- 完成！
-- =====================================================
--
-- 更新内容：
-- 1. ✅ 为 profiles 表添加了 email 字段
-- 2. ✅ 同步了现有用户的邮箱数据
-- 3. ✅ 更新了触发器函数，确保新用户注册时自动填充邮箱
--
-- 现在评论功能可以显示用户邮箱了！
--
-- =====================================================
