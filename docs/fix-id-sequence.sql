-- =====================================================
-- 修复 cats 表 ID 序列问题
-- =====================================================
-- 当出现 "duplicate key value violates unique constraint" 错误时使用此脚本
-- 这个问题通常是因为序列的当前值比表中最大的 ID 还小

-- =====================================================
-- 步骤 1：查找序列名称
-- =====================================================
-- 对于 IDENTITY 列，需要先找到正确的序列名称
SELECT pg_get_serial_sequence('public.cats', 'id');

-- 或者查看表结构中的序列信息
SELECT
    column_name,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'cats'
  AND column_name = 'id';

-- =====================================================
-- 步骤 2：查看当前状态
-- =====================================================
-- 查看当前表中的最大 ID
SELECT MAX(id) AS max_id FROM public.cats;

-- 查看序列的当前值（使用 pg_get_serial_sequence 自动获取序列名）
SELECT
    pg_get_serial_sequence('public.cats', 'id') AS sequence_name,
    last_value,
    is_called
FROM pg_sequences
WHERE schemaname = 'public'
  AND sequencename = (
    SELECT split_part(pg_get_serial_sequence('public.cats', 'id'), '.', 2)
  );

-- =====================================================
-- 步骤 3：重置序列（方法 A - 推荐）
-- =====================================================
-- 使用 setval 重置序列到最大 ID + 1
-- 这个方法会自动找到正确的序列名称
SELECT setval(
    pg_get_serial_sequence('public.cats', 'id'),
    COALESCE((SELECT MAX(id) FROM public.cats), 0) + 1,
    false
);

-- =====================================================
-- 步骤 4：验证修复
-- =====================================================
-- 再次查看序列当前值，确保它大于表中的最大 ID
SELECT
    (SELECT MAX(id) FROM public.cats) AS max_table_id,
    last_value AS current_sequence_value,
    last_value > (SELECT MAX(id) FROM public.cats) AS is_fixed
FROM pg_sequences
WHERE schemaname = 'public'
  AND sequencename = (
    SELECT split_part(pg_get_serial_sequence('public.cats', 'id'), '.', 2)
  );

-- =====================================================
-- 方法 2：清空表并重置序列（如果需要重新开始）
-- =====================================================

-- 注意：这会删除所有数据！仅在测试环境使用
-- TRUNCATE TABLE public.cats RESTART IDENTITY CASCADE;

-- =====================================================
-- 测试插入
-- =====================================================

-- 测试插入一条新记录，ID 应该自动生成
-- INSERT INTO public.cats (name, breed, age, sex, description, tags, user_id, images)
-- VALUES ('测试猫咪', '中华田园猫', 1, 1, '这是一只测试猫咪', '测试', '7ee71a86-d513-4d15-b1c0-8f433824c212', ARRAY[]::text[])
-- RETURNING id, name;

-- =====================================================
-- 完成！
-- =====================================================
--
-- 如果问题仍然存在，请检查：
-- 1. 确保没有手动指定 ID 值（让数据库自动生成）
-- 2. 确保 RLS 策略正确配置
-- 3. 检查是否有其他约束冲突
--
-- =====================================================