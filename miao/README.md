# 🐱 喵宇宙 - Miao Universe

一个展示猫咪信息的可爱网站，支持照片上传、轮播图、信息编辑和 GIF 动图生成。

## 项目结构

```
miao/
├── index.html          # 前端主页面
├── style.css           # 样式文件
├── script.js           # 前端 JavaScript（调用后端 API）
├── api/                # 后端目录
│   ├── main.py         # FastAPI 后端服务
│   ├── requirements.txt # Python 依赖
│   ├── data/           # 数据存储目录（自动创建）
│   │   └── cats.json   # 猫咪数据文件
│   └── README.md       # 后端说明文档
├── prd.md              # 项目规则文档
└── README.md           # 项目说明文档（本文件）
```

## 技术栈

### 前端
- **HTML5** - 页面结构
- **CSS3** - 样式和动画
- **原生 JavaScript** - 交互逻辑（无框架）
- **GIFshot** - GIF 动图生成库（CDN 引入）

### 后端
- **Python 3.8+** - 编程语言
- **FastAPI** - 现代高性能 Web 框架
- **Uvicorn** - ASGI 服务器
- **JSON 文件存储** - 简单数据持久化

## 快速开始

### 1. 启动后端服务

```bash
# 进入后端目录
cd api

# 创建虚拟环境（推荐）
python -m venv venv

# 激活虚拟环境
# macOS/Linux:
source venv/bin/activate
# Windows:
venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt

# 启动后端服务
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

后端服务将在 `http://localhost:8000` 启动

查看 API 文档: `http://localhost:8000/docs`

### 2. 启动前端服务

前端需要通过 HTTP 服务器访问（不能直接打开 HTML 文件，因为需要跨域请求）。

**方法 1: 使用 Python 内置服务器**
```bash
# 在 miao 目录下运行
python -m http.server 3000
```

**方法 2: 使用 VS Code Live Server**
- 安装 Live Server 扩展
- 右键点击 `index.html`
- 选择 "Open with Live Server"

**方法 3: 使用 Node.js http-server**
```bash
# 安装 http-server
npm install -g http-server

# 在 miao 目录下运行
http-server -p 3000
```

前端页面将在 `http://localhost:3000` 打开

## 功能特性

### ✅ 已实现功能

1. **猫咪卡片展示**
   - 优雅的网格布局
   - 响应式设计
   - 悬停动画效果

2. **照片上传**
   - 支持多张图片上传
   - 自动替换默认图片
   - 图片保存到后端

3. **图片轮播**
   - 自动轮播（3秒间隔）
   - 手动切换（左右箭头）
   - 悬停时暂停
   - 轮播指示器

4. **信息编辑**
   - 编辑猫咪名字、品种、年龄
   - 编辑描述和标签
   - 保存到后端服务器
   - 取消编辑功能

5. **GIF 生成**
   - 将轮播图生成 GIF 动图
   - 自动下载
   - 支持多帧动画

6. **后端 API**
   - RESTful API 接口
   - CORS 跨域支持
   - JSON 数据存储
   - 自动 API 文档

## API 接口

### 获取所有猫咪
```http
GET /api/cats
```

### 获取单个猫咪
```http
GET /api/cats/{cat_id}
```

### 更新猫咪信息
```http
PUT /api/cats/{cat_id}
Content-Type: application/json

{
  "name": "小橘",
  "breed": "橘猫",
  "age": "3岁",
  "description": "...",
  "tags": ["温顺", "亲人"]
}
```

### 更新猫咪图片
```http
PUT /api/cats/{cat_id}/images
Content-Type: application/json

{
  "images": ["data:image/jpeg;base64,...", "..."]
}
```

## 数据存储

- 数据保存在 `api/data/cats.json` 文件中
- 首次启动时自动创建默认数据
- 支持图片 Base64 编码存储

## 开发说明

### 前端开发
- 所有代码遵循原生 JavaScript，无框架依赖
- CSS 使用独立文件，便于维护
- 异步 API 调用使用 `async/await`

### 后端开发
- FastAPI 提供自动 API 文档
- Pydantic 模型提供数据验证
- 简单的 JSON 文件存储，易于迁移到数据库

### 代码风格
- 函数和变量使用清晰的英文命名
- 每个函数前添加注释说明
- 关键代码行添加行内注释
- 代码简洁，避免过度封装

## 浏览器兼容性

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## 已知问题

1. 图片使用 Base64 编码存储，大量图片可能导致性能问题
2. 没有用户认证，任何人都可以修改数据
3. 跨域图片生成 GIF 可能失败（CORS 限制）

## 未来计划

- [ ] 迁移到真实数据库（PostgreSQL）
- [ ] 添加用户认证（Supabase Auth）
- [ ] 图片压缩和优化
- [ ] 添加更多动画效果
- [ ] 支持猫咪搜索和筛选
- [ ] 移动端优化

## 许可证

MIT License

## 作者

VibeCoding Team

---

Made with ❤️ and 🐱
