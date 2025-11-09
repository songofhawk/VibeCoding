# Supabase 数据库配置步骤

## 问题原因
当前连接失败是因为：
1. 使用的 `SUPABASE_ANON_KEY` 不正确
2. 可能需要配置 Row Level Security (RLS) 策略

## 解决步骤

### 第一步：获取正确的 API Key

1. 访问 Supabase Dashboard: https://supabase.com/dashboard
2. 选择项目: `vswrhnmhumfxgfrwpfwc`
3. 点击左侧 **⚙️ Settings**
4. 点击 **API**
5. 找到 **Project API keys** 部分
6. 复制 **`anon` `public`** key（这是一个很长的字符串，以 `eyJ` 开头）

### 第二步：配置 RLS 策略

在 Supabase Dashboard 中：

1. 点击左侧 **🛢️ SQL Editor**
2. 点击 **New query**
3. 复制下面的 SQL 命令并执行：

```sql
-- 方案 1: 禁用 RLS（最简单，适合完全公开的数据）
ALTER TABLE public.cats DISABLE ROW LEVEL SECURITY;
```

**或者**

```sql
-- 方案 2: 启用 RLS 并配置公开访问策略（更安全，推荐）
ALTER TABLE public.cats ENABLE ROW LEVEL SECURITY;

-- 允许所有人读取
CREATE POLICY "cats_select_policy" ON public.cats
FOR SELECT TO public
USING (true);

-- 允许所有人插入
CREATE POLICY "cats_insert_policy" ON public.cats
FOR INSERT TO public
WITH CHECK (true);

-- 允许所有人更新
CREATE POLICY "cats_update_policy" ON public.cats
FOR UPDATE TO public
USING (true)
WITH CHECK (true);

-- 允许所有人删除
CREATE POLICY "cats_delete_policy" ON public.cats
FOR DELETE TO public
USING (true);
```

4. 点击 **Run** 按钮执行 SQL

### 第三步：更新代码配置

在 `index.html` 和 `test_supabase.html` 中，找到这一行：

```javascript
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY_HERE';
```

替换为你在第一步复制的实际 anon key：

```javascript
const SUPABASE_ANON_KEY = 'eyJhbGc...你的实际key...';
```

### 第四步：测试连接

1. 保存修改后的文件
2. 在浏览器中打开 `test_supabase.html`
3. 页面会自动测试连接
4. 如果看到 "✓ 连接成功!"，说明配置完成

### 第五步：验证主应用

1. 在浏览器中打开 `index.html`
2. 打开浏览器控制台（F12）
3. 应该看到 "✓ Supabase 客户端已初始化"
4. 尝试编辑一只猫咪的信息并保存
5. 控制台应该显示 "✓ 数据已保存到数据库"

## 常见问题

### Q: 如何验证 RLS 策略是否生效？

在 SQL Editor 中运行：
```sql
SELECT * FROM public.cats;
```
如果能看到数据，说明读取权限配置正确。

### Q: 如何查看当前的 RLS 策略？

在 Supabase Dashboard 中：
1. 点击左侧 **🗄️ Database**
2. 点击 **Tables**
3. 选择 `cats` 表
4. 点击 **Policies** 标签

### Q: 连接还是失败怎么办？

1. 确认 API key 复制完整，没有多余空格
2. 确认 URL 正确：`https://vswrhnmhumfxgfrwpfwc.supabase.co`
3. 检查浏览器控制台的详细错误信息
4. 尝试在 Supabase Dashboard 的 API Docs 中测试 API

## 安全提示

- `anon` key 是公开的，可以放在前端代码中
- 但要通过 RLS 策略控制数据访问权限
- 对于敏感操作，应该使用 `service_role` key 在后端处理
- 当前配置允许任何人读写数据，仅适合学习和测试

## 下一步

配置成功后，你可以：
1. 在应用中编辑猫咪信息并保存到数据库
2. 刷新页面，数据会从数据库加载
3. 图片仍然保存在浏览器 localStorage 中
