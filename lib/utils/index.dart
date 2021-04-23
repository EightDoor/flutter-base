import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';

/// 工具类
class Utils {
  /// 设置EasyLoading全局custom
  static customEasyLoading() {
    // 配置地址 https://github.com/kokohuang/flutter_easyloading/blob/master/README-zh_CN.md
    EasyLoading.instance
      ..dismissOnTap = false
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.circle;
  }

  /// 格式化日期
  static String formatTime({required String time, String? format}) {
    return DateUtil.formatDateStr(time, format: format ?? DateFormats.full);
  }

  /// 沉浸式导航栏
  static void immersiveNavigation() {
    // 白色沉浸式状态栏颜色  白色文字
    SystemUiOverlayStyle light = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,

      /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    );

    // 黑色沉浸式状态栏颜色 黑色文字
    SystemUiOverlayStyle dark = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,

      /// 注意安卓要想实现沉浸式的状态栏 需要底部设置透明色
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(light);
  }

  /// 日志记录
  static Logger log() {
    var logger = Logger();
    return logger;
  }

  /// 弹出toast框
  static void showToast({
    required String status,
    EasyLoadingToastPosition? position,
  }) {
    EasyLoading.showToast(
      status,
      toastPosition: position ?? EasyLoadingToastPosition.center,
    );
  }

  /// 弹出loading
  static void showLoading({String title = "加载中..."}) {
    EasyLoading.show(status: title, dismissOnTap: false);
  }

  /// 隐藏loading
  static void hideLoading() {
    EasyLoading.dismiss();
  }
}
