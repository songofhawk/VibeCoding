"""
喵宇宙后端 API - Miao Universe Backend API
使用 FastAPI 框架提供 RESTful API 接口

API Endpoints:
- GET /api/cats - 获取所有猫咪数据
- GET /api/cats/{cat_id} - 获取单个猫咪数据
- PUT /api/cats/{cat_id} - 更新猫咪信息
- PUT /api/cats/{cat_id}/images - 更新猫咪图片
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
import json
import os
from pathlib import Path

# Initialize FastAPI app - 初始化 FastAPI 应用
app = FastAPI(title="喵宇宙 API", description="Miao Universe Backend API", version="1.0.0")

# Configure CORS - 配置跨域
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 允许所有源（开发环境）
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Data storage path - 数据存储路径
DATA_DIR = Path(__file__).parent / "data"
CATS_FILE = DATA_DIR / "cats.json"

# Pydantic models - 数据模型
class Cat(BaseModel):
    id: int
    name: str
    breed: str
    age: str
    gender: str
    description: str
    images: List[str]
    badge: str
    tags: List[str]

class CatUpdate(BaseModel):
    name: Optional[str] = None
    breed: Optional[str] = None
    age: Optional[str] = None
    description: Optional[str] = None
    badge: Optional[str] = None
    tags: Optional[List[str]] = None

class ImagesUpdate(BaseModel):
    images: List[str]


# Initialize data directory and file - 初始化数据目录和文件
def init_data():
    """Initialize data directory and cats.json file with default data"""
    DATA_DIR.mkdir(exist_ok=True)

    if not CATS_FILE.exists():
        default_cats = [
            {
                "id": 1,
                "name": "小橘",
                "breed": "橘猫",
                "age": "2岁",
                "gender": "公",
                "description": "性格温顺，喜欢晒太阳，对小鱼干没有抵抗力。是个不折不扣的吃货，看见食物就会喵喵叫。",
                "images": ["https://images.unsplash.com/photo-1574158622682-e40e69881006?w=500&h=400&fit=crop"],
                "badge": "最受欢迎",
                "tags": ["温顺", "亲人", "吃货"]
            },
            {
                "id": 2,
                "name": "雪球",
                "breed": "英国短毛猫",
                "age": "1岁",
                "gender": "母",
                "description": "优雅的小公主，毛色雪白纯净，眼睛是漂亮的蓝色。喜欢安静的环境，偶尔会高冷。",
                "images": ["https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?w=500&h=400&fit=crop"],
                "badge": "新成员",
                "tags": ["优雅", "安静", "高冷"]
            },
            {
                "id": 3,
                "name": "虎斑",
                "breed": "美国短毛猫",
                "age": "3岁",
                "gender": "公",
                "description": "活力十足的运动健将，喜欢爬高上低，对逗猫棒和激光笔非常感兴趣。",
                "images": ["https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=500&h=400&fit=crop"],
                "badge": "活力之星",
                "tags": ["活泼", "好动", "爱玩"]
            },
            {
                "id": 4,
                "name": "布丁",
                "breed": "布偶猫",
                "age": "1.5岁",
                "gender": "母",
                "description": "拥有深蓝色的眼睛和柔软的长毛，性格温柔体贴，是完美的陪伴型猫咪。",
                "images": ["https://images.unsplash.com/photo-1529778873920-4da4926a72c2?w=500&h=400&fit=crop"],
                "badge": "温柔天使",
                "tags": ["温柔", "粘人", "颜值高"]
            },
            {
                "id": 5,
                "name": "黑炭",
                "breed": "黑猫",
                "age": "4岁",
                "gender": "公",
                "description": "全身乌黑发亮，眼睛在黑暗中会发出神秘的绿光。性格独立，但对主人非常忠诚。",
                "images": ["https://images.unsplash.com/photo-1494256997604-768d1f608cac?w=500&h=400&fit=crop"],
                "badge": "神秘使者",
                "tags": ["独立", "忠诚", "神秘"]
            },
            {
                "id": 6,
                "name": "奶茶",
                "breed": "暹罗猫",
                "age": "2.5岁",
                "gender": "母",
                "description": "拥有独特的重点色花纹和蓝宝石般的眼睛。性格活泼，喜欢与人交流，叫声独特。",
                "images": ["https://images.unsplash.com/photo-1543852786-1cf6624b9987?w=500&h=400&fit=crop"],
                "badge": "话痨小姐",
                "tags": ["活泼", "健谈", "聪明"]
            }
        ]

        with open(CATS_FILE, 'w', encoding='utf-8') as f:
            json.dump(default_cats, f, ensure_ascii=False, indent=2)


# Read cats data from file - 从文件读取猫咪数据
def read_cats() -> List[dict]:
    """Read all cats data from cats.json file"""
    try:
        with open(CATS_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception as e:
        print(f"Error reading cats data: {e}")
        return []


# Write cats data to file - 将猫咪数据写入文件
def write_cats(cats: List[dict]) -> bool:
    """Write cats data to cats.json file"""
    try:
        with open(CATS_FILE, 'w', encoding='utf-8') as f:
            json.dump(cats, f, ensure_ascii=False, indent=2)
        return True
    except Exception as e:
        print(f"Error writing cats data: {e}")
        return False


# API Endpoints - API 接口

@app.get("/")
def root():
    """Root endpoint - 根路径"""
    return {
        "message": "🐱 喵宇宙 API",
        "version": "1.0.0",
        "endpoints": [
            "GET /api/cats - 获取所有猫咪数据",
            "GET /api/cats/{cat_id} - 获取单个猫咪数据",
            "PUT /api/cats/{cat_id} - 更新猫咪信息",
            "PUT /api/cats/{cat_id}/images - 更新猫咪图片"
        ]
    }


@app.get("/api/cats", response_model=List[Cat])
def get_cats():
    """Get all cats data - 获取所有猫咪数据"""
    cats = read_cats()
    return cats


@app.get("/api/cats/{cat_id}", response_model=Cat)
def get_cat(cat_id: int):
    """Get single cat data by ID - 根据ID获取单个猫咪数据"""
    cats = read_cats()
    cat = next((c for c in cats if c["id"] == cat_id), None)

    if not cat:
        raise HTTPException(status_code=404, detail="Cat not found")

    return cat


@app.put("/api/cats/{cat_id}", response_model=Cat)
def update_cat(cat_id: int, cat_update: CatUpdate):
    """Update cat information - 更新猫咪信息"""
    cats = read_cats()
    cat_index = next((i for i, c in enumerate(cats) if c["id"] == cat_id), None)

    if cat_index is None:
        raise HTTPException(status_code=404, detail="Cat not found")

    # Update only provided fields - 只更新提供的字段
    update_data = cat_update.dict(exclude_unset=True)
    cats[cat_index].update(update_data)

    if not write_cats(cats):
        raise HTTPException(status_code=500, detail="Failed to save data")

    return cats[cat_index]


@app.put("/api/cats/{cat_id}/images", response_model=Cat)
def update_cat_images(cat_id: int, images_update: ImagesUpdate):
    """Update cat images - 更新猫咪图片"""
    cats = read_cats()
    cat_index = next((i for i, c in enumerate(cats) if c["id"] == cat_id), None)

    if cat_index is None:
        raise HTTPException(status_code=404, detail="Cat not found")

    # Update images - 更新图片
    cats[cat_index]["images"] = images_update.images

    if not write_cats(cats):
        raise HTTPException(status_code=500, detail="Failed to save images")

    return cats[cat_index]


# Startup event - 启动事件
@app.on_event("startup")
def startup_event():
    """Initialize data on startup - 启动时初始化数据"""
    init_data()
    print("🐱 喵宇宙后端 API 已启动")
    print("📡 API 文档: http://localhost:8000/docs")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
