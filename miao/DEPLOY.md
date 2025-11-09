# 部署指南

## 步骤 1: 配置 Supabase

### 1.1 执行数据库初始化脚本

1. 登录 [Supabase Dashboard](https://app.supabase.com)
2. 选择你的项目
3. 点击左侧菜单的 **SQL Editor**
4. 复制 `init.sql` 文件的内容
5. 粘贴到 SQL Editor 中
6. 点击 **Run** 执行

### 1.2 创建 Storage Bucket

1. 在 Supabase Dashboard 中，点击左侧菜单的 **Storage**
2. 点击 **New bucket** 按钮
3. 填写信息:
   - Name: `cat-photos`
   - Public bucket: ✅ 勾选
4. 点击 **Create bucket**

### 1.3 配置 Storage 权限

1. 在 Storage 页面，点击 `cat-photos` bucket
2. 点击 **Policies** 标签
3. 点击 **New policy**
4. 选择 **For full customization**
5. 创建以下策略:

**策略 1: 公开读取**
- Policy name: `Public Access`
- Allowed operations: `SELECT`
- Target roles: `public`
- USING expression: `true`

**策略 2: 公开上传**
- Policy name: `Public Upload`
- Allowed operations: `INSERT`
- Target roles: `public`
- WITH CHECK expression: `bucket_id = 'cat-photos'`

### 1.4 获取 API 密钥

1. 在 Supabase Dashboard 中，点击左侧菜单的 **Settings** > **API**
2. 复制以下信息:
   - Project URL (例如: `https://vswrhnmhumfxgfrwpfwc.supabase.co`)
   - `anon` `public` key (用于客户端)

## 步骤 2: 配置 Vercel

### 2.1 安装依赖

```bash
cd miao
npm install
```

### 2.2 配置环境变量

创建 `.env` 文件:

```bash
cp .env.example .env
```

编辑 `.env` 文件，填入你的 Supabase 信息:

```env
SUPABASE_URL=https://vswrhnmhumfxgfrwpfwc.supabase.co
SUPABASE_ANON_KEY=你的_anon_key
```

### 2.3 本地测试

```bash
npm run dev
```

访问 http://localhost:3000 测试功能。

### 2.4 部署到 Vercel

#### 方式 1: 使用 Vercel CLI

```bash
# 安装 Vercel CLI
npm install -g vercel

# 登录
vercel login

# 部署
vercel

# 部署到生产环境
vercel --prod
```

在部署过程中，Vercel 会提示你设置环境变量。

#### 方式 2: 通过 Vercel Dashboard

1. 访问 [Vercel Dashboard](https://vercel.com)
2. 点击 **New Project**
3. 导入你的 GitHub 仓库
4. 配置项目:
   - Framework Preset: `Other`
   - Root Directory: `miao` (如果项目在子目录)
   - Build Command: (留空)
   - Output Directory: (留空)
5. 添加环境变量:
   - `SUPABASE_URL`: 你的 Supabase URL
   - `SUPABASE_ANON_KEY`: 你的 Supabase anon key
6. 点击 **Deploy**

## 步骤 3: 测试部署

部署完成后，访问你的 Vercel 域名，测试以下功能:

- [ ] 页面加载正常
- [ ] 能看到猫咪卡片
- [ ] 可以编辑猫咪信息
- [ ] 可以上传图片
- [ ] 可以切换轮播图
- [ ] 可以生成 GIF

## 常见问题

### Q1: API 请求失败，返回 CORS 错误
**A**: 检查 Vercel 环境变量是否正确设置，特别是 `SUPABASE_ANON_KEY`。

### Q2: 图片上传失败
**A**:
1. 检查 Supabase Storage bucket 是否创建
2. 检查 Storage 权限策略是否正确配置
3. 检查图片大小是否超过限制 (默认 50MB)

### Q3: 数据库操作失败
**A**:
1. 检查 `init.sql` 是否执行成功
2. 检查 RLS 策略是否正确配置
3. 在 Supabase Dashboard > Table Editor 中查看数据

### Q4: 本地开发无法连接 API
**A**:
1. 确保 `.env` 文件存在且配置正确
2. 重启本地开发服务器: `npm run dev`

## 生产环境优化建议

### 安全性

1. **限制 RLS 策略**: 在生产环境中，建议添加用户认证，限制数据的增删改权限
2. **API 速率限制**: 在 API 端点添加速率限制
3. **图片大小限制**: 限制上传图片的大小和格式

### 性能

1. **图片压缩**: 在上传前压缩图片
2. **CDN**: 使用 Vercel 的 Edge Network 加速静态资源
3. **缓存**: 添加适当的缓存策略

### 监控

1. 在 Vercel Dashboard 中查看部署日志
2. 在 Supabase Dashboard 中查看数据库性能
3. 设置错误告警

## 下一步

- 添加用户认证 (Supabase Auth)
- 添加更多猫咪管理功能
- 优化移动端体验
- 添加搜索和筛选功能
