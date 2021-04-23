# 运行
- flutter run 
## 基础

- flutter 版本

  - `flutter -version`

  ```shell
  Flutter 2.0.3 • channel stable • https://github.com/flutter/flutter.git
  Framework • revision 4d7946a68d (5 weeks ago) • 2021-03-18 17:24:33 -0700
  Engine • revision 3459eb2436
  Tools • Dart 2.12.2
  ```

- 文件结构

  > lib 
  >
  > > api 编写接口请求api
  > >
  > > components 公用组件
  > >
  > > > Progress 水波纹进度
  > > >
  > > > Tapped 按钮点击
  > > >
  > > > CacheImage 图片缓存
  > > >
  > > > CacheImageFillet 图片缓存带圆角
  > > >
  > > > Empty 暂无数据页面
  > > >
  > > > EmptyContainer 暂无数据放置容器里面
  > > >
  > > > ListRefresh 上拉加载，下拉刷新
  > > >
  > > > Loading 加载中
  > > >
  > > > PhotoViewGalleryScreen 多张图片展示
  > > >
  > > > Svg svg显示
  > > >
  > > > TabBarList 顶部tabBar
  > > >
  > > > UnderConstruction 正在建设中页面
  > > >
  > > > Video 视频播放
  > >
  > > config config配置
  > >
  > > models 序列化文件放置位置
  > >
  > > pages 页面
  > >
  > > > home 首页
  > > >
  > > > login 登录页面
  > > >
  > > > my 我的页面
  > > >
  > > > other 其他页面: 404
  > > >
  > > > tabs tab导航页面
  > > >
  > > > startup_screen 启动屏展示页面
  > >
  > > routes 路由文件
  > >
  > > > business 业务路由
  > > >
  > > > core 基础路由
  > >
  > > routes 路由基础文件入口
  >
  > utils 工具
  >
  > > constant 常量
  > >
  > > hex_color 颜色16进制转换
  > >
  > > index  工具类
  > >
  > > navigator_util 导航工具类
  > >
  > > request_util 请求统一封装
  > >
  > > upgrade_dialog 升级dialog
  > >
  > > upgrade_util 升级相关方法
  >
  > main 启动入口

## 编辑器

- android-studio
  - 插件  flutter
- vscode
  - 插件 flutter、dart

# json序列化

- 线上序列化地址 
  - 访问地址  https://eightdoor.github.io/json2dart/
  - 代码仓库地址  https://github.com/EightDoor/json2dart ps: forked之前的别人库 改为支持空安全

- 一次性生成 `flutter pub run build_runner build`
- 持续生成代码 `flutter pub run build_runner watch`

