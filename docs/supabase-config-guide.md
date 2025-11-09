# Supabase 配置获取指南

## 如何获取正确的 Supabase 配置

### 1. 登录 Supabase Dashboard
访问：https://supabase.com/dashboard

### 2. 选择你的项目
项目 ID: `vswrhnmhumfxgfrwpfwc`

### 3. 获取 API 配置
1. 在左侧菜单中点击 **Settings** (齿轮图标)
2. 点击 **API**
3. 找到以下信息：

   - **Project URL**: `https://vswrhnmhumfxgfrwpfwc.supabase.co`
   - **anon public key**: 在 "Project API keys" 部分，复制 `anon` `public` key

### 4. 配置 RLS (Row Level Security) 策略

为了允许公开访问，需要设置表的 RLS 策略：

#### 方式 1: 禁用 RLS（仅用于测试/公开数据）
```sql
ALTER TABLE public.cats DISABLE ROW LEVEL SECURITY;
```

#### 方式 2: 创建允许所有人读写的策略（推荐用于公开应用）
```sql
-- 启用 RLS
ALTER TABLE public.cats ENABLE ROW LEVEL SECURITY;

-- 允许所有人读取
CREATE POLICY "Allow public read access"
ON public.cats
FOR SELECT
TO public
USING (true);

-- 允许所有人插入
CREATE POLICY "Allow public insert access"
ON public.cats
FOR INSERT
TO public
WITH CHECK (true);

-- 允许所有人更新
CREATE POLICY "Allow public update access"
ON public.cats
FOR UPDATE
TO public
USING (true)
WITH CHECK (true);

-- 允许所有人删除
CREATE POLICY "Allow public delete access"
ON public.cats
FOR DELETE
TO public
USING (true);
```

### 5. 在 SQL Editor 中执行策略

1. 在 Supabase Dashboard 左侧菜单点击 **SQL Editor**
2. 点击 **New query**
3. 粘贴上面的 SQL 命令
4. 点击 **Run** 执行

### 6. 更新代码中的配置

将获取到的正确 `anon public key` 替换到 index.html 中：

```javascript
const SUPABASE_ANON_KEY = 'YOUR_ACTUAL_ANON_KEY_HERE';
```

## 验证配置

使用 test_supabase.html 页面测试连接是否成功。
