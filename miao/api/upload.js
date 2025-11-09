/**
 * API endpoint for image upload to Supabase Storage
 * 图片上传到 Supabase Storage 的 API 端点
 */

import { createClient } from '@supabase/supabase-js';

// Initialize Supabase client
// 初始化 Supabase 客户端
const supabaseUrl = process.env.SUPABASE_URL || 'https://vswrhnmhumfxgfrwpfwc.supabase.co';
const supabaseKey = process.env.SUPABASE_ANON_KEY;

if (!supabaseKey) {
  throw new Error('Missing SUPABASE_ANON_KEY environment variable');
}

const supabase = createClient(supabaseUrl, supabaseKey);

/**
 * Allow CORS for client requests
 * 允许客户端请求的 CORS
 */
function setCorsHeaders(res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
}

/**
 * Convert base64 to buffer
 * 将 base64 转换为 buffer
 */
function base64ToBuffer(base64String) {
  const base64Data = base64String.replace(/^data:image\/\w+;base64,/, '');
  return Buffer.from(base64Data, 'base64');
}

/**
 * Get file extension from base64 string
 * 从 base64 字符串获取文件扩展名
 */
function getFileExtension(base64String) {
  const match = base64String.match(/^data:image\/(\w+);base64,/);
  return match ? match[1] : 'jpg';
}

/**
 * Main handler for the image upload endpoint
 * 图片上传端点的主处理函数
 */
export default async function handler(req, res) {
  // Handle CORS preflight
  // 处理 CORS 预检
  setCorsHeaders(res);

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ success: false, error: 'Method not allowed' });
  }

  try {
    const { catId, image } = req.body;

    if (!catId || !image) {
      return res.status(400).json({
        success: false,
        error: 'catId and image are required'
      });
    }

    // Convert base64 to buffer
    // 将 base64 转换为 buffer
    const fileBuffer = base64ToBuffer(image);
    const fileExt = getFileExtension(image);
    const fileName = `${catId}-${Date.now()}.${fileExt}`;
    const filePath = `cat-images/${fileName}`;

    // Upload to Supabase Storage
    // 上传到 Supabase Storage
    const { data, error } = await supabase.storage
      .from('cat-photos')
      .upload(filePath, fileBuffer, {
        contentType: `image/${fileExt}`,
        upsert: false
      });

    if (error) throw error;

    // Get public URL
    // 获取公开 URL
    const { data: urlData } = supabase.storage
      .from('cat-photos')
      .getPublicUrl(filePath);

    return res.status(200).json({
      success: true,
      url: urlData.publicUrl,
      path: filePath
    });

  } catch (error) {
    console.error('Upload Error:', error);
    return res.status(500).json({
      success: false,
      error: error.message || 'Upload failed'
    });
  }
}
