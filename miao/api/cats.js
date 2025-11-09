/**
 * API endpoint for cat data CRUD operations
 * 猫咪数据 CRUD 操作的 API 端点
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
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
}

/**
 * Main handler for the API endpoint
 * API 端点的主处理函数
 */
export default async function handler(req, res) {
  // Handle CORS preflight
  // 处理 CORS 预检
  setCorsHeaders(res);

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  try {
    // GET: Fetch all cats
    // GET: 获取所有猫咪数据
    if (req.method === 'GET') {
      const { data, error } = await supabase
        .from('cats')
        .select('*')
        .order('created_at', { ascending: false });

      if (error) throw error;

      return res.status(200).json({ success: true, data });
    }

    // POST: Create a new cat
    // POST: 创建新猫咪
    if (req.method === 'POST') {
      const catData = req.body;

      const { data, error } = await supabase
        .from('cats')
        .insert([{
          name: catData.name,
          breed: catData.breed,
          age: catData.age,
          sex: catData.sex,
          description: catData.description,
          tags: catData.tags
        }])
        .select()
        .single();

      if (error) throw error;

      return res.status(201).json({ success: true, data });
    }

    // PUT: Update an existing cat
    // PUT: 更新现有猫咪
    if (req.method === 'PUT') {
      const { id, ...updateData } = req.body;

      if (!id) {
        return res.status(400).json({ success: false, error: 'Cat ID is required' });
      }

      const { data, error } = await supabase
        .from('cats')
        .update({
          name: updateData.name,
          breed: updateData.breed,
          age: updateData.age,
          sex: updateData.sex,
          description: updateData.description,
          tags: updateData.tags,
          updated_at: new Date().toISOString()
        })
        .eq('id', id)
        .select()
        .single();

      if (error) throw error;

      return res.status(200).json({ success: true, data });
    }

    // DELETE: Delete a cat
    // DELETE: 删除猫咪
    if (req.method === 'DELETE') {
      const { id } = req.body;

      if (!id) {
        return res.status(400).json({ success: false, error: 'Cat ID is required' });
      }

      const { error } = await supabase
        .from('cats')
        .delete()
        .eq('id', id);

      if (error) throw error;

      return res.status(200).json({ success: true, message: 'Cat deleted successfully' });
    }

    // Method not allowed
    // 不允许的方法
    return res.status(405).json({ success: false, error: 'Method not allowed' });

  } catch (error) {
    console.error('API Error:', error);
    return res.status(500).json({
      success: false,
      error: error.message || 'Internal server error'
    });
  }
}