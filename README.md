# Linkworld

Linkworld 是一个使用 SwiftUI 开发的应用程序，旨在帮助用户管理和展示他们在不同平台上的身份卡。用户可以添加、编辑和删除这些身份卡，并查看详细信息。

## 技术栈

### **1. SwiftUI**

- **使用场景**：整个应用的 UI 构建，包括首页的身份卡展示、身份卡编辑页面、导航和表单组件等。
- **特性**：
  - 声明式语法，简化 UI 开发
  - 高度可定制化的组件和布局
  - 强大的状态管理（@State、@Binding、@ObservedObject）

### **2. Combine**

- **使用场景**：用于管理数据流，特别是在与 ViewModel 的交互中处理发布和订阅模型，实现数据的双向绑定。
- **特性**：
  - 响应式编程模型
  - 结合 SwiftUI 的数据驱动 UI 更新

### **3. URLSession**

- **使用场景**：实现网络请求，从远程 API 获取数据并展示到应用界面。
- **特性**：
  - 轻量级的网络请求处理
  - 适用于基本的网络操作

### **4. Codable**

- **使用场景**：数据模型的序列化和反序列化，将 JSON 数据转换为 Swift 对象，或将对象保存到本地。
- **特性**：
  - 提供自动化的编码与解码功能
  - 适用于网络数据传输及本地持久化

### **5. PropertyListEncoder & PropertyListDecoder**

- **使用场景**：本地数据持久化，使用 `.plist` 文件来保存用户的身份卡数据。
- **特性**：
  - 使用简单，适合轻量级本地数据存储
  - 与 Codable 结合处理数据对象

### **6. UIKit (WebKit)**

- **使用场景**：用于嵌入 Web 视图，以展示用户提供的主页链接。
- **特性**：
  - 与 SwiftUI 集成，通过 `UIViewRepresentable` 将 UIKit 组件嵌入 SwiftUI 界面

### **7. MVVM 架构**

- **使用场景**：整个项目使用 MVVM 架构，通过 ViewModel 管理视图状态和业务逻辑，确保视图与数据的分离。
- **特性**：
  - 便于维护和测试
  - 数据和 UI 分离，逻辑清晰

## 目录结构

```plaintext
├── LinkworldApp.swift         # 应用程序入口
├── Models
│   └── Model.swift            # 身份卡数据模型
├── ViewModels
│   └── ViewModel.swift        # 管理身份卡数据的 ViewModel
├── Views
│   ├── ContentView.swift      # 应用主界面
│   ├── CardView.swift         # 展示身份卡的卡片视图
│   ├── NewView.swift          # 添加新身份卡的视图
│   ├── EditView.swift         # 编辑身份卡的视图
│   ├── HomePageView.swift     # Web 页面展示视图
│   ├── TitleInputView.swift   # 标题输入视图
│   ├── PlatformPicker.swift   # 平台选择视图
│   └── IndexURLView.swift     # 链接输入视图
└── Resources
    └── Assets.xcassets        # 应用图标和图片资源
