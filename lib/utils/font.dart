import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 公用的字体大小
class Font {
  // 特大标题
  static double first24 = 24.ssp;
  // 一级标题 栏目标题/文章内容页标题/及其重要的标题
  static double font_20 = 20.ssp;
  // 二级标题 顶部导航标题/栏目未选中标题/重要标题
  static double font_18 = 18.ssp;
  // 三级标题 卡片标题/用户名名称
  static double font_16 = 16.ssp;
  // 小标题 文章列表标题
  static double font_15 = 15.ssp;
  // 普通文本 可阅读性文字
  static double font_14 = 14.ssp;
  // 次要文本 输入框提示信息，不可阅读文字
  static double font_t_14 = 14.ssp;
  // 说明文本 提示信息，备注信息
  static double font_12 = 12.ssp;
  // 特殊字体 特殊数字字体
  static double font_21 = 21.ssp;

  static TextStyle font_20F() {
    return TextStyle(
      fontSize: Font.font_20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font_18F() {
    return TextStyle(fontSize: Font.font_18, fontWeight: FontWeight.w500);
  }

  static TextStyle font_16F() {
    return TextStyle(fontSize: Font.font_16, fontWeight: FontWeight.w500);
  }

  static TextStyle font_15F() {
    return TextStyle(fontSize: Font.font_15);
  }

  static TextStyle font_14F() {
    return TextStyle(fontSize: Font.font_14, fontWeight: FontWeight.w500);
  }

  static TextStyle font_t_14F() {
    return TextStyle(fontSize: Font.font_t_14);
  }

  static TextStyle font_12F() {
    return TextStyle(fontSize: Font.font_12);
  }

  static TextStyle font_21F() {
    return TextStyle(fontSize: Font.font_21, fontWeight: FontWeight.w500);
  }
}
