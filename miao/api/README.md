# 喵宇宙后端 API

使用 FastAPI 构建的后端服务，用于存储和管理猫咪数据。

## 安装依赖

```bash
# 创建虚拟环境（推荐）
python -m venv venv

# 激活虚拟环境
# macOS/Linux:
source venv/bin/activate
# Windows:
venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt
```

## 启动服务

```bash
# 方法1: 使用 uvicorn 直接启动
uvicorn main:app --reload --host 0.0.0.0 --port 8000

# 方法2: 运行 Python 文件
python main.py
```

服务器将在 `http://localhost:8000` 启动。

## API 文档

启动服务后，访问以下地址查看自动生成的 API 文档：

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## API 接口

### 获取所有猫咪数据
```
GET /api/cats
```

响应示例：
```json
[
  {
    "id": 1,
    "name": "小橘",
    "breed": "橘猫",
    "age": "2岁",
    "gender": "公",
    "description": "性格温顺...",
    "images": ["https://..."],
    "badge": "最受欢迎",
    "tags": ["温顺", "亲人", "吃货"]
  }
]
```

### 获取单个猫咪数据
```
GET /api/cats/{cat_id}
```

### 更新猫咪信息
```
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
```
PUT /api/cats/{cat_id}/images
Content-Type: application/json

{
  "images": ["data:image/jpeg;base64,...", "..."]
}
```

## 数据存储

数据保存在 `api/data/cats.json` 文件中。服务器会在首次启动时自动创建默认数据。

## 技术栈

- **FastAPI**: 现代、高性能的 Python Web 框架
- **Pydantic**: 数据验证和设置管理
- **Uvicorn**: ASGI 服务器
