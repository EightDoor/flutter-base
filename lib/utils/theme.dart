import 'package:flutter/material.dart';

import 'hex_color.dart';

/// 主题颜色配置
Map<String, ThemeData> themeColorMap = {
  "default": ThemeData(
    scaffoldBackgroundColor: HexColor("#F8F9FA"),
    platform: TargetPlatform.android,
    brightness: Brightness.light,
    primaryColor: HexColor("#ffffff"),
    // 需要强调和突出的文字、icon小图标
    toggleableActiveColor: HexColor("#F55636"),
    accentColor: HexColor("#4B0082"),
    // 分隔符
    dividerColor: HexColor("#E6E6E6"),

    // 字体颜色
    colorScheme: ColorScheme(
      // 一级标题
      primary: HexColor("#242835"),
      // 二级标题
      primaryVariant: HexColor("#535D66"),
      // 三级标题
      secondary: HexColor("#8C9198"),
      // 四级标题
      secondaryVariant: HexColor("#CACBCC"),
      // 输入框背景色
      background: HexColor("#F0F2F5"),

      surface: HexColor("#A4AAB3"),
      error: HexColor("#A4AAB3"),
      onPrimary: HexColor("#A4AAB3"),
      onSecondary: HexColor("#A4AAB3"),
      onSurface: HexColor("#A4AAB3"),
      onBackground: HexColor("#A4AAB3"),
      onError: HexColor("#A4AAB3"),
      brightness: Brightness.light,
    ),
  )
};

// primaryColor - Color类型，App主要部分的背景色（ToolBar,Tabbar等）
// primaryColorBrightness - Brightness类型，primaryColor的亮度，用于确定设置在primaryColor上部的文本和图标颜色(如:工具栏文本(toolbar text))。
// primaryColorLight - Color类型，primaryColor的较浅版本
// primaryColorDark - Color类型，primaryColor的较深版本
// accentColor - Color类型，前景色(按钮、文本、覆盖边缘效果等)
// accentColorBrightness - Brightness类型，accentColor的亮度。用于确定位于accentColor上部的文本和图标颜色(例如，浮动操作按钮(FloatingButton)上的图标)
// canvasColor - Color类型，MaterialType.canvas Material的默认颜色。
// scaffoldBackgroundColor - Color类型，作为Scaffold下的Material默认颜色，用于materia应用程序或app内页面的背景色。
// bottomAppBarColor - Color类型，bottomAppBarColor的默认颜色。这可以通过指定BottomAppBar.color来覆盖。
// cardColor - Color类型，用在卡片(Card)上的Material的颜色。
// dividerColor - Color类型，分隔符(Dividers)和弹窗分隔符(PopupMenuDividers)的颜色，也用于ListTiles和DataTables的行之间。要创建使用这种颜色的合适的边界，请考虑Divider.createBorderSide。
// highlightColor - Color类型，用于墨水喷溅动画或指示菜单被选中时的高亮颜色
// splashColor - Color类型，墨水溅出的颜色
// splashFactory - InteractiveInkFeatureFactory类型，定义InkWall和InkResponse产成的墨水喷溅时的外观。
// selectedRowColor - Color类型，用于高亮选定行的颜色。
// unselectedWidgetColor - Color类型，小部件处于非活动(但启用)状态时使用的颜色。例如，未选中的复选框。通常与accentColor形成对比。
// disabledColor - Color类型，无效的部件(widget)的颜色，不管它们的状态如何。例如，一个禁用的复选框(可以选中或不选中)。
// buttonColor - Color类型，Material中RaisedButtons使用的默认填充色。
// buttonTheme - ButtonThemeData类型，定义按钮小部件的默认配置，如RaisedButton和FlatButton。
// secondaryHeaderColor - Color类型，有选定行时PaginatedDataTable标题的颜色
// textSelectionColor - Color类型，文本字段(如TextField)中文本被选中的颜色。
// cursorColor - Color类型，在 Material-style 文本字段(如TextField)中光标的颜色。
// textSelectionHandleColor - Color类型，用于调整当前选定文本部分的句柄的颜色。
// backgroundColor - Color类型，与primaryColor对比的颜色(例如 用作进度条的剩余部分)。
// dialogBackgroundColor - Color类型，Color类型，Dialog元素的背景色
// indicatorColor - Color类型，TabBar中选项选中的指示器颜色。
// hintColor - Color类型，用于提示文本或占位符文本的颜色，例如在TextField中。
// errorColor - Color类型，用于输入验证错误的颜色，例如在TextField中。
// toggleableActiveColor - Color类型，用于突出显示切换Widget（如Switch，Radio和Checkbox）的活动状态的颜色。
// fontFamily - String类型，字体类型
// textTheme - TextTheme类型，与卡片和画布对比的文本颜色
// primaryTextTheme - TextTheme类型，与primary color形成对比的文本主题。
// accentTextTheme - TextTheme类型，与accent color形成对比的文本主题。
// inputDecorationTheme - InputDecorationTheme类型，InputDecorator、TextField和TextFormField的默认InputDecoration值基于此主题。
// iconTheme - IconThemeData类型，与卡片和画布颜色形成对比的图标主题。
// primaryIconTheme - IconThemeData类型，与原色(primary color)形成对比的图标主题。
// accentIconTheme - IconThemeData类型,与前景色(accent color)形成对比的图标主题。
// sliderTheme - SliderThemeData类型，SliderThemeData类型，用于渲染Slider的颜色和形状。
// tabBarTheme - TabBarTheme类型, 一个主题，用于自定义选项卡栏指示器的尺寸、形状和颜色。
// chipTheme - ChipThemeData类型,用于Chip的颜色和样式
// platform - TargetPlatform类型,widget应该适应目标的平台。
// materialTapTargetSize - MaterialTapTargetSize类型,配置特定材料部件的hit测试大小。
// pageTransitionsTheme - PageTransitionsTheme类型,每个目标平台的默认MaterialPageRoute转换。
// colorScheme
// ColorScheme类型,一组13种颜色，可用于配置大多数组件的颜色属性。
// typography - Typography类型,用于配置TextTheme、primaryTextTheme和accentTextTheme的颜色和几何文本主题值。
