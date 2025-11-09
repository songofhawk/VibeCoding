# 迁移照片存储到 Supabase Storage

## 方案设计

### 当前问题
- 使用 localStorage 存储 Base64 图片
- 存储空间限制（通常 5-10MB）
- 容易触发 QuotaExceededError
- 数据仅存在本地，无法跨设备同步

### 新方案
- 使用 Supabase Storage 存储图片文件
- 数据库表增加字段存储图片 URL 数组
- 支持更大的存储空间和更多图片
- 数据云端同步，可跨设备访问

## 实施步骤

### 1. 在 Supabase 创建 Storage Bucket

在 Supabase Dashboard 中：

1. 点击左侧 **Storage**
2. 点击 **New bucket**
3. 填写信息：
   - Name: `cat-images`
   - Public: ✅ 勾选（允许公开访问）
4. 点击 **Create bucket**

### 2. 配置 Bucket 策略

在 SQL Editor 中执行：

```sql
-- 允许所有人上传图片
CREATE POLICY "Allow public uploads"
ON storage.objects FOR INSERT
TO public
WITH CHECK (bucket_id = 'cat-images');

-- 允许所有人查看图片
CREATE POLICY "Allow public access"
ON storage.objects FOR SELECT
TO public
USING (bucket_id = 'cat-images');

-- 允许所有人删除图片
CREATE POLICY "Allow public deletes"
ON storage.objects FOR DELETE
TO public
USING (bucket_id = 'cat-images');
```

### 3. 更新数据库表结构

```sql
-- 添加 images 字段存储图片 URLs
ALTER TABLE public.cats
ADD COLUMN IF NOT EXISTS images text[];

-- 添加注释
COMMENT ON COLUMN public.cats.images IS 'Array of image URLs from Supabase Storage';
```

### 4. 实现方案

#### 文件命名规范
```
cat-images/{catId}/{timestamp}_{originalFileName}
```

例如：`cat-images/1/1699500000000_photo.jpg`

#### 核心函数

##### 上传图片到 Supabase Storage
```javascript
async function uploadImageToStorage(file, catId) {
    if (!supabaseEnabled || !supabase) {
        throw new Error('Supabase 未启用');
    }

    // 生成唯一文件名
    const timestamp = Date.now();
    const fileExt = file.name.split('.').pop();
    const fileName = `${timestamp}_${Math.random().toString(36).substring(7)}.${fileExt}`;
    const filePath = `${catId}/${fileName}`;

    // 上传文件
    const { data, error } = await supabase.storage
        .from('cat-images')
        .upload(filePath, file, {
            cacheControl: '3600',
            upsert: false
        });

    if (error) {
        throw error;
    }

    // 获取公开 URL
    const { data: urlData } = supabase.storage
        .from('cat-images')
        .getPublicUrl(filePath);

    return urlData.publicUrl;
}
```

##### 从数据库加载图片 URLs
```javascript
async function loadCatImages(catId) {
    if (!supabaseEnabled || !supabase) {
        return [];
    }

    const { data, error } = await supabase
        .from('cats')
        .select('images')
        .eq('id', catId)
        .single();

    if (error) {
        console.error('加载图片失败:', error);
        return [];
    }

    return data.images || [];
}
```

##### 更新数据库中的图片 URLs
```javascript
async function updateCatImages(catId, imageUrls) {
    if (!supabaseEnabled || !supabase) {
        throw new Error('Supabase 未启用');
    }

    const { error } = await supabase
        .from('cats')
        .update({ images: imageUrls })
        .eq('id', catId);

    if (error) {
        throw error;
    }

    return true;
}
```

##### 删除图片
```javascript
async function deleteImageFromStorage(imageUrl, catId) {
    if (!supabaseEnabled || !supabase) {
        return false;
    }

    // 从 URL 中提取文件路径
    const urlParts = imageUrl.split('/cat-images/');
    if (urlParts.length < 2) {
        return false;
    }
    const filePath = urlParts[1];

    const { error } = await supabase.storage
        .from('cat-images')
        .remove([filePath]);

    if (error) {
        console.error('删除图片失败:', error);
        return false;
    }

    return true;
}
```

### 5. 迁移策略

#### 向后兼容
- 保留 localStorage 作为降级方案
- 优先使用 Supabase Storage
- 如果 Supabase 不可用，自动降级到 localStorage

#### 数据迁移
- 不自动迁移旧的 localStorage 数据
- 新上传的图片自动使用 Supabase Storage
- 用户可以手动重新上传图片

## 使用示例

### 完整的图片上传流程

```javascript
async function processMultipleImages(files, catId, card) {
    try {
        // 显示上传进度
        showUploadProgress(card, '正在上传...');

        // 上传所有图片到 Supabase Storage
        const uploadPromises = files.map(file => uploadImageToStorage(file, catId));
        const newImageUrls = await Promise.all(uploadPromises);

        // 获取当前猫咪数据
        const cat = catsData.find(c => c.id === catId);
        if (!cat) return;

        // 检查是否有默认图片
        const hasDefaultImages = cat.images.length === 1 &&
                                cat.images[0].includes('unsplash.com');

        // 更新图片列表
        if (hasDefaultImages) {
            cat.images = newImageUrls;
        } else {
            cat.images = [...cat.images, ...newImageUrls];
        }

        // 保存到数据库
        await updateCatImages(catId, cat.images);

        // 更新显示
        updateImageDisplay(card, cat, newImageUrls);

        // 隐藏上传进度
        hideUploadProgress(card);

        console.log(`✓ 成功上传 ${newImageUrls.length} 张图片到 Supabase Storage`);

    } catch (error) {
        console.error('图片上传失败:', error);
        alert('图片上传失败: ' + error.message);
        hideUploadProgress(card);
    }
}
```

## 测试清单

- [ ] 创建 Storage Bucket
- [ ] 配置 Bucket 策略
- [ ] 更新数据库表结构
- [ ] 测试单张图片上传
- [ ] 测试多张图片上传
- [ ] 测试图片加载和显示
- [ ] 测试图片删除功能
- [ ] 测试 localStorage 降级方案
- [ ] 测试大图片上传（>5MB）
- [ ] 测试 GIF 生成（使用 Storage URLs）

## 优势

1. **无存储限制** - Supabase Free tier 提供 1GB 存储空间
2. **云端同步** - 数据存储在云端，可跨设备访问
3. **更好的性能** - 不需要存储 Base64，加载更快
4. **可扩展性** - 支持更多图片和更大文件
5. **CDN 加速** - Supabase Storage 使用 CDN，全球访问更快

## 注意事项

1. **文件大小限制** - Supabase Free tier 单文件最大 50MB
2. **带宽限制** - Free tier 每月 2GB 带宽
3. **公开访问** - 所有上传的图片都是公开的，任何人都可以访问
4. **文件命名** - 使用时间戳和随机字符串避免命名冲突
5. **错误处理** - 需要处理网络错误、存储空间不足等情况
