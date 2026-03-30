# 芥子空间 (Jiezi Space)

一款精美的卡片式收藏管理应用，基于 Flutter 开发。

## 📱 功能特性

- ✨ 精美的卡片式 UI 设计
- 🏷️ 支持多种状态标签（使用中/珍惜/传说）
- 🔍 分类筛选功能
- 📷 支持从相册、相机或链接添加卡片
- 💰 金币积分系统
- 🌙 支持亮色/暗色主题

## 🚀 快速开始

### 环境要求

- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0
- Android Studio / VS Code

### 安装依赖

```bash
flutter pub get
```

### 运行应用

```bash
flutter run
```

### 构建 APK

```bash
flutter build apk --release
```

## 📦 下载

最新的 APK 可以在 [Releases](https://github.com/tianfu0sky-hue/jiezi-space/releases) 页面下载。

## 🛠️ 技术栈

- **框架**: Flutter 3.x
- **状态管理**: GetX
- **图片缓存**: cached_network_image
- **字体**: Google Fonts (Noto Sans SC)
- **UI 组件**: Material Design 3

## 📁 项目结构

```
lib/
├── main.dart              # 应用入口
├── models/                # 数据模型
│   └── card_model.dart
├── screens/               # 页面
│   └── home_screen.dart
├── widgets/               # 可复用组件
│   ├── top_bar.dart
│   ├── filter_bar.dart
│   ├── card_item.dart
│   └── add_button.dart
└── theme/                 # 主题配置
    └── app_theme.dart
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

---

**开发**: Jarvis (AI Assistant)  
**日期**: 2026 年 3 月
