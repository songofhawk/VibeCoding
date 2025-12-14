# 喵宇宙（VibeCoding）UI 重设计：v0.app 设计语言对齐版 AI Coding Prompt

参考设计语言：[`https://v0.app/`](https://v0.app/)

> 目标：在**不破坏现有功能与 JS 选择器**的前提下，把 `index.html` 的视觉与交互质感升级到接近 v0 的“极简、强排版、轻边框、柔阴影、克制动效”。
>
> 当前项目形态：**单文件静态页**（`index.html` 内含大量 `<style>` + `<script>`），核心模块包括：
> - 顶部认证栏：`#authBar`（登录/注册/添加猫咪/登出）
> - 认证弹窗：`#authModal`
> - 主容器与列表：`.container`、`.title`、`#cardsContainer.cards-grid`
> - 猫咪卡片（渲染与交互依赖 class）：`.cat-card` 及其内部结构（上传、轮播、GIF、评论、编辑）

---

## 1) 你要扮演的角色
你是一名资深 **Design Engineer**。请对项目「喵宇宙」进行 UI 系统化重设计与落地实现，输出可直接运行的静态页面。

---

## 2) 绝对约束（非常重要）
### 2.1 不允许破坏的选择器（否则 JS 会失效）
除非你同时修改 JS 逻辑并确保功能不回归，否则**不要改名/删除**以下 id/class（允许新增 class 作为扩展）：

- **认证相关**
  - `#authBar`, `#authLoggedOut`, `#authLoggedIn`
  - `#loginButton`, `#signupButton`, `#logoutButton`, `#addCatButton`
  - `#authModal`, `#authForm`, `#authEmail`, `#authPassword`, `#authSubmitButton`
  - `#authSwitchText`, `#authSwitchLink`, `#authMessage`, `#modalTitle`, `#modalSubtitle`, `#userEmail`
- **列表与卡片**
  - `#cardsContainer`, `.cards-grid`, `.cat-card`
  - `.cat-image-container`, `.cat-image`, `.cat-badge`
  - `.upload-button`, `.file-input`, `.gif-button`
  - `.carousel-nav`, `.carousel-btn`, `.prev-btn`, `.next-btn`, `.carousel-indicator`
  - `.cat-info`, `.cat-name`, `.cat-breed`, `.cat-description`, `.cat-stats`, `.stat-item`, `.stat-label`, `.stat-value`
  - `.cat-tags`, `.tag`
  - `.edit-button`, `.edit-input`, `.edit-actions`, `.save-button`, `.cancel-button`
  - `.cat-interactions`, `.interaction-buttons`, `.interaction-btn`, `.like-btn`, `.comment-btn`
  - `.comments-section`, `.comments-toggle`, `.comments-list`, `.comment-form`, `.comment-input`, `.comment-submit`, `.no-comments`

### 2.2 工程约束
- 项目保持**零构建**：继续使用静态 `index.html`（允许拆分为 `styles.css` / `ui.css` 与少量 `ui.js`，但必须保持可直接打开运行）。
- 允许结构性优化 DOM（新增语义分区/包装容器），但要保持现有功能区（认证、卡片、交互）完整可用。
- 动效要克制：不要霓虹、不要大面积强渐变背景、不要重阴影。

---

## 3) 现状 → v0 风格：信息架构对齐（基于当前页面内容）
> 当前页面主要只有“标题 + 猫咪卡片网格”。请在不破坏卡片渲染逻辑的前提下，引入 v0 风格的首页结构：

### 3.1 顶部导航（复用 `#authBar`）
把现有 `.auth-bar` 视觉升级为 v0 风格顶栏：
- **高度**：64px
- **背景**：`rgba(255,255,255,0.85)` + `backdrop-filter: blur(12px)`
- **分割线**：底部 1px `rgba(0,0,0,0.08)`（不要厚重阴影）
- **布局**：
  - 左侧：`.auth-bar-logo`（「喵宇宙」文字标识，**不要渐变文字**，用纯色 + 字重体现高级感）
  - 中间：新增轻量导航链接（可选）：`产品` / `文档` / `验证清单`（指向仓库已有文档，如 `docs/`、`VERIFICATION_CHECKLIST.md`）
  - 右侧：复用现有按钮区域（登录/注册 或 用户信息/添加猫咪/登出）

按钮风格（替换当前“胶囊渐变按钮”）：
- **Primary 按钮**（如 注册、添加猫咪）：背景 `#111827`（近黑），文字白色
- **Secondary / Ghost**（如 登录、登出）：透明背景 + 1px 边框
- **圆角**：10px（按钮），高度 36px，左右 padding 12–14px
- **hover**：背景轻微加深/边框增强 + `transform: translateY(-1px)`（非常轻）
- **active**：`transform: translateY(0) scale(0.98)`

### 3.2 Hero 区（新增，但不替换卡片列表）
在 `.container` 内部、`.title` 之前新增一个 Hero 区块（建议 `section.hero`），表达项目特色并提升“产品感”：
- 主标题（替换/弱化当前 `.title` 的 emoji 风格）：保留「喵宇宙」但更产品化，例如：
  - H1：`喵宇宙`（40–44px，字重 700，字距 -0.02em）
  - 副标题：`用 Supabase 管理你的猫咪卡片：上传照片、轮播、评论、互动。`（13–15px，弱化色）
- 核心输入（可选增强）：一个“搜索/筛选”输入框（不要求实现复杂功能，可只做 UI 与未来扩展），但必须做出 v0 风格质感：
  - 高度 52px，圆角 12px，1px 边框 + 极浅阴影
  - focus ring：`0 0 0 4px rgba(79,70,229,0.18)`
  - 下方 chips（胶囊小标签）：`最受欢迎` / `新成员` / `待领养` / `我的猫咪`
- Hero 与网格之间留白 56–72px

### 3.3 卡片网格（复用 `#cardsContainer.cards-grid`）
保持渲染容器不变，但升级布局与密度：
- **页面背景**：从当前 `body` 强渐变改成 v0 的干净底色
  - `body` 背景：`#FAFAFA`；主内容面：`#FFFFFF`
- **网格**：桌面 3 列（`minmax(0, 1fr)`），间距 16–20px；平板 2 列；移动 1 列
- **容器宽度**：1120px（max），左右 padding 24px（移动 16px）

---

## 4) 视觉系统（Design Tokens，必须落地为 CSS 变量）
在 `:root` 定义 tokens（浅色为主，可选深色模式）：

### 4.1 圆角
- `--radius-lg: 14px;`（卡片）
- `--radius-md: 12px;`（输入/面板）
- `--radius-sm: 10px;`（按钮）

### 4.2 边框与阴影（关键：轻、柔、短）
- 边框：`--border: rgba(0,0,0,0.08);`
- 默认阴影：`--shadow-sm: 0 1px 2px rgba(0,0,0,0.06);`
- 悬浮阴影：`--shadow-md: 0 8px 24px rgba(0,0,0,0.10);`

### 4.3 字体与颜色
- 字体：系统栈即可（目前已是系统栈，保留）
- 文本色：
  - `--fg: #0A0A0A;`
  - `--fg-muted: rgba(10,10,10,0.65);`
  - `--fg-faint: rgba(10,10,10,0.45);`
- 强调色（用于 focus/少量高亮）：`--accent: #4F46E5;`

### 4.4 动效
- 统一曲线：`--ease: cubic-bezier(0.2, 0.8, 0.2, 1);`
- hover 160–220ms，面板 220–320ms

---

## 5) 组件级改造细则（严格对齐现有 class）

### 5.1 `.cat-card`（核心组件）
把当前“偏花哨”的卡片做成 v0 风格“轻边框 + 柔阴影 + 强信息层级”：
- **卡片结构不变**（`.cat-image-container` + `.cat-info`），只改样式
- **卡片外观**
  - 背景 `#FFF`，边框 1px `var(--border)`，圆角 `var(--radius-lg)`
  - 默认 `box-shadow: var(--shadow-sm)`
  - hover：`transform: translateY(-2px)` + `box-shadow: var(--shadow-md)` + 边框略增强（例如 `rgba(0,0,0,0.10)`）
  - hover 动画 200ms + `var(--ease)`

### 5.2 图片区 `.cat-image-container / .cat-image`
- 图片固定比例（建议 16:9 或 4:3），`object-fit: cover`
- 图片圆角与卡片一致（内圆角 12px）
- 图片 hover 轻微 `scale(1.02)`（不要超过 1.03）

### 5.3 徽标 `.cat-badge`
- 改成小号 pill 标签：
  - 高度 24px，圆角 999px
  - 背景 `rgba(17,24,39,0.92)`，文字白色 12px
  - 位置保持在图片左上角，但要有 12px 内边距

### 5.4 图片操作按钮 `.upload-button / .gif-button / .carousel-btn`
统一成 v0 风格的“图标按钮/轻按钮”：
- 不要 emoji 作为主视觉（允许保留 emoji，但要更小、更克制）
- **按钮尺寸**
  - 图标按钮：40x40，圆角 999px，边框 1px
  - 普通小按钮：高度 32px，圆角 10px
- **交互**
  - hover：背景 `rgba(0,0,0,0.04)`，边框增强
  - active：`scale(0.98)`

### 5.5 信息区 `.cat-info`
重排排版层级（不改 DOM 结构）：
- `.cat-name`：18–20px，字重 650–700
- `.cat-breed`：13px，`--fg-muted`
- `.cat-description`：14–15px，行高 1.6，最多显示 3 行（可用 line-clamp）
- `.cat-stats`：做成更“表格式”的两列小块，背景轻微区隔（例如 `#FCFCFC`）+ 1px 边框
- `.tag`：改成更轻的 pill（高度 24px，圆角 999px，边框 1px，背景近透明）

### 5.6 编辑态 `.editing`（保持现有逻辑）
编辑态要“像产品表单”：
- `.edit-input`：高度 40px/32px（small/tiny），圆角 12px/10px
- focus ring：同上
- `.save-button` 为 primary，`.cancel-button` 为 secondary

### 5.7 评论区 `.comments-section`
把“查看评论”按钮做成轻量 disclosure：
- `.comments-toggle`：文字按钮 + 小箭头旋转动效（用 `transform`）
- `.comments-list`：作为可折叠面板，背景 `#FCFCFC`，圆角 12px，1px 边框
- `.comment-input` 与 `.comment-submit` 对齐同一行，整体像 v0 的 input + button 组合

### 5.8 认证弹窗 `#authModal`
把当前“厚重大阴影 + 大圆角”改成 v0 风格：
- 遮罩：`rgba(0,0,0,0.45)`，blur 轻一点
- 弹窗面板：
  - 宽 420px（max），圆角 16px
  - 阴影：比卡片略强但不夸张（`0 20px 60px rgba(0,0,0,0.18)`）
  - 标题 20–22px，副标题 13–14px
  - 表单输入统一 token（边框、focus ring）
  - 动画：从 `opacity:0; translateY(8px); scale(0.98)` 到正常（240ms）

---

## 6) 布局与全局背景（解决“当前很丑”的核心点）
把 `body` 从当前渐变+居中对齐（`align-items:center`）调整为标准页面流：
- `body`：`min-height: 100vh; background: #FAFAFA; color: var(--fg);`
- 去掉强渐变背景，去掉强居中布局（否则导航会很怪）
- 主内容从顶部开始，`#authBar` 固定顶部；`.container` 作为页面主容器

---

## 7) 可访问性与细节一致性（必须实现）
- 为所有按钮/链接/输入加 `:focus-visible`（明显但不刺眼的 ring）
- icon button 点击热区至少 40x40
- 文本对比度：正文对比 ≥ 4.5:1
- hover 不引起布局抖动（不要改变 border 厚度导致跳动，可用 box-shadow/outline）

---

## 8) 交付物（你需要输出什么）
请直接在仓库中落地修改，至少包含：
- `index.html`：结构更清晰（可新增 `section.hero` 等），但保留关键 id/class
- 样式建议拆分到：`styles.css`（或 `ui.css`）并在 `index.html` 引用
- （可选）`ui.js`：仅当你需要补充少量交互（例如 chips 仅填充搜索框）才新增；不要重写现有业务逻辑

---

## 9) 验收清单（你改完自检）
- 第一眼像 v0：背景干净、留白充足、排版克制、卡片轻阴影+轻边框
- `#authBar` 与 `#authModal` 交互不坏：登录/注册切换、提示信息正常显示
- 猫咪卡片功能全可用：上传、多图轮播、GIF、评论、编辑（owner 逻辑不回归）
- 响应式：桌面 3 列 / 平板 2 列 / 移动 1 列；间距舒适


