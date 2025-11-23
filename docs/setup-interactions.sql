-- ============================================
-- Setup Interactions (Likes & Comments)
-- 设置互动功能（点赞和评论）
-- ============================================
--
-- 说明：本脚本用于创建点赞和评论相关的数据表和 RLS 策略
-- 使用方法：在 Supabase SQL Editor 中执行此脚本
--

-- ============================================
-- 1. Create likes table - 创建点赞表
-- ============================================

CREATE TABLE IF NOT EXISTS public.likes (
    id BIGSERIAL PRIMARY KEY,
    cat_id BIGINT NOT NULL REFERENCES public.cats(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    created_at TIMESTAMPTZ DEFAULT NOW(),

    -- Ensure one user can only like a cat once - 确保一个用户只能点赞一只猫一次
    UNIQUE(cat_id, user_id)
);

-- Add index for better query performance - 添加索引以提高查询性能
CREATE INDEX IF NOT EXISTS likes_cat_id_idx ON public.likes(cat_id);
CREATE INDEX IF NOT EXISTS likes_user_id_idx ON public.likes(user_id);

-- ============================================
-- 2. Create comments table - 创建评论表
-- ============================================

CREATE TABLE IF NOT EXISTS public.comments (
    id BIGSERIAL PRIMARY KEY,
    cat_id BIGINT NOT NULL REFERENCES public.cats(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add index for better query performance - 添加索引以提高查询性能
CREATE INDEX IF NOT EXISTS comments_cat_id_idx ON public.comments(cat_id);
CREATE INDEX IF NOT EXISTS comments_user_id_idx ON public.comments(user_id);

-- ============================================
-- 3. Enable Row Level Security - 启用行级安全
-- ============================================

ALTER TABLE public.likes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comments ENABLE ROW LEVEL SECURITY;

-- ============================================
-- 4. Likes RLS Policies - 点赞表的 RLS 策略
-- ============================================

-- Everyone can view all likes - 所有人都可以查看所有点赞
DROP POLICY IF EXISTS "likes_select_policy" ON public.likes;
CREATE POLICY "likes_select_policy" ON public.likes
    FOR SELECT
    USING (true);

-- Only authenticated users can add likes - 只有登录用户可以添加点赞
DROP POLICY IF EXISTS "likes_insert_policy" ON public.likes;
CREATE POLICY "likes_insert_policy" ON public.likes
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Users can only delete their own likes - 用户只能删除自己的点赞
DROP POLICY IF EXISTS "likes_delete_policy" ON public.likes;
CREATE POLICY "likes_delete_policy" ON public.likes
    FOR DELETE
    USING (auth.uid() = user_id);

-- ============================================
-- 5. Comments RLS Policies - 评论表的 RLS 策略
-- ============================================

-- Everyone can view all comments - 所有人都可以查看所有评论
DROP POLICY IF EXISTS "comments_select_policy" ON public.comments;
CREATE POLICY "comments_select_policy" ON public.comments
    FOR SELECT
    USING (true);

-- Only authenticated users can add comments - 只有登录用户可以添加评论
DROP POLICY IF EXISTS "comments_insert_policy" ON public.comments;
CREATE POLICY "comments_insert_policy" ON public.comments
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Users can only update their own comments - 用户只能更新自己的评论
DROP POLICY IF EXISTS "comments_update_policy" ON public.comments;
CREATE POLICY "comments_update_policy" ON public.comments
    FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Users can only delete their own comments - 用户只能删除自己的评论
DROP POLICY IF EXISTS "comments_delete_policy" ON public.comments;
CREATE POLICY "comments_delete_policy" ON public.comments
    FOR DELETE
    USING (auth.uid() = user_id);

-- ============================================
-- 6. Create helper function to get like count - 创建获取点赞数的辅助函数
-- ============================================

CREATE OR REPLACE FUNCTION get_like_count(p_cat_id BIGINT)
RETURNS BIGINT
LANGUAGE SQL
STABLE
AS $$
    SELECT COUNT(*) FROM public.likes WHERE cat_id = p_cat_id;
$$;

-- ============================================
-- 7. Create helper function to check if user liked - 创建检查用户是否点赞的辅助函数
-- ============================================

CREATE OR REPLACE FUNCTION user_has_liked(p_cat_id BIGINT, p_user_id UUID)
RETURNS BOOLEAN
LANGUAGE SQL
STABLE
AS $$
    SELECT EXISTS(
        SELECT 1 FROM public.likes
        WHERE cat_id = p_cat_id AND user_id = p_user_id
    );
$$;

-- ============================================
-- Success message - 成功消息
-- ============================================

DO $$
BEGIN
    RAISE NOTICE '✓ Interactions tables and policies created successfully!';
    RAISE NOTICE '✓ Tables: likes, comments';
    RAISE NOTICE '✓ RLS policies enabled for both tables';
    RAISE NOTICE '✓ Helper functions created';
END $$;
