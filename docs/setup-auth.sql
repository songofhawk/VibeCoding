-- =====================================================
-- 喵宇宙用户认证配置脚本
-- =====================================================
-- 在 Supabase Dashboard > SQL Editor 中执行此脚本
-- 配置用户认证和数据权限控制

-- =====================================================
-- 第一步：更新 cats 表结构，添加 user_id 字段
-- =====================================================

-- 添加 user_id 字段关联到 auth.users
ALTER TABLE public.cats
ADD COLUMN IF NOT EXISTS user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE;

-- 添加注释
COMMENT ON COLUMN public.cats.user_id IS '猫咪所属的用户ID，关联到 auth.users';

-- 为 user_id 创建索引（提高查询性能）
CREATE INDEX IF NOT EXISTS idx_cats_user_id ON public.cats USING btree (user_id);

-- =====================================================
-- 第二步：更新现有数据（可选）
-- =====================================================
-- 如果你想让现有的猫咪数据归属于某个用户，可以取消注释并修改下面的 SQL
-- 注意：需要先在应用中注册一个用户，然后在这里填入用户ID
--
-- UPDATE public.cats
-- SET user_id = 'YOUR_USER_ID_HERE'
-- WHERE user_id IS NULL;

-- =====================================================
-- 第三步：删除旧的 RLS 策略
-- =====================================================

DROP POLICY IF EXISTS "Allow public read access" ON public.cats;
DROP POLICY IF EXISTS "Allow public insert access" ON public.cats;
DROP POLICY IF EXISTS "Allow public update access" ON public.cats;
DROP POLICY IF EXISTS "Allow public delete access" ON public.cats;

-- =====================================================
-- 第四步：配置新的 RLS 策略（基于用户认证）
-- =====================================================

-- 确保 RLS 已启用
ALTER TABLE public.cats ENABLE ROW LEVEL SECURITY;

-- 策略1：所有人都可以查看所有猫咪（公开展示）
CREATE POLICY "Anyone can view cats"
ON public.cats
FOR SELECT
TO public
USING (true);

-- 策略2：只有已登录的用户才能创建猫咪（并自动设置 user_id）
CREATE POLICY "Authenticated users can create cats"
ON public.cats
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = user_id);

-- 策略3：用户只能更新自己的猫咪
CREATE POLICY "Users can update their own cats"
ON public.cats
FOR UPDATE
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- 策略4：用户只能删除自己的猫咪
CREATE POLICY "Users can delete their own cats"
ON public.cats
FOR DELETE
TO authenticated
USING (auth.uid() = user_id);

-- =====================================================
-- 第五步：更新 Storage 策略（基于用户认证）
-- =====================================================

-- 删除旧的 Storage 策略
DROP POLICY IF EXISTS "Allow public access to cat images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public uploads to cat images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public updates to cat images" ON storage.objects;
DROP POLICY IF EXISTS "Allow public deletes to cat images" ON storage.objects;

-- 策略1：所有人都可以查看图片
CREATE POLICY "Anyone can view cat images"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'cat-images');

-- 策略2：只有已登录的用户才能上传图片
CREATE POLICY "Authenticated users can upload cat images"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'cat-images');

-- 策略3：用户只能更新自己上传的图片
-- 注意：这里使用文件夹结构 {user_id}/{filename} 来区分所有权
CREATE POLICY "Users can update their own cat images"
ON storage.objects FOR UPDATE
TO authenticated
USING (
    bucket_id = 'cat-images' AND
    (storage.foldername(name))[1] = auth.uid()::text
);

-- 策略4：用户只能删除自己上传的图片
CREATE POLICY "Users can delete their own cat images"
ON storage.objects FOR DELETE
TO authenticated
USING (
    bucket_id = 'cat-images' AND
    (storage.foldername(name))[1] = auth.uid()::text
);

-- =====================================================
-- 第六步：创建用户资料表（可选）
-- =====================================================

-- 创建 profiles 表存储用户的额外信息
CREATE TABLE IF NOT EXISTS public.profiles (
    id uuid REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
    username text UNIQUE,
    email text,
    avatar_url text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);

-- 添加注释
COMMENT ON TABLE public.profiles IS '用户资料表';
COMMENT ON COLUMN public.profiles.id IS '用户ID，关联到 auth.users';
COMMENT ON COLUMN public.profiles.username IS '用户名（唯一）';
COMMENT ON COLUMN public.profiles.email IS '用户邮箱（从 auth.users 同步）';
COMMENT ON COLUMN public.profiles.avatar_url IS '用户头像URL';

-- 启用 RLS
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- 所有人都可以查看用户资料（公开）
CREATE POLICY "Anyone can view profiles"
ON public.profiles
FOR SELECT
TO public
USING (true);

-- 用户只能更新自己的资料
CREATE POLICY "Users can update their own profile"
ON public.profiles
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- 创建触发器：当新用户注册时自动创建 profile
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

-- 删除旧触发器（如果存在）
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

-- 创建触发器
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- =====================================================
-- 第七步：验证配置
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

-- 查看 RLS 策略
SELECT
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd
FROM pg_policies
WHERE schemaname = 'public'
  AND tablename IN ('cats', 'profiles')
ORDER BY tablename, policyname;

-- 查看 Storage 策略
SELECT
    policyname,
    permissive,
    roles,
    cmd
FROM pg_policies
WHERE schemaname = 'storage'
  AND tablename = 'objects'
  AND policyname LIKE '%cat%'
ORDER BY policyname;

-- =====================================================
-- 完成！
-- =====================================================
--
-- 下一步：
-- 1. 在 Supabase Dashboard > Authentication > Settings 中启用 Email 认证
-- 2. 更新前端代码，添加登录/注册功能
-- 3. 测试用户注册和登录
-- 4. 测试猫咪的创建、编辑、删除权限
--
-- 重要提示：
-- - 用户只能编辑自己创建的猫咪
-- - 所有人都可以查看所有猫咪
-- - 图片上传路径改为 {user_id}/{cat_id}/{filename} 格式
-- - 需要更新前端代码以适配新的权限规则
--
-- =====================================================