import 'package:flutter/material.dart';
import 'package:flutterbbase/pages/login/login.dart';
import 'package:flutterbbase/routes/core/core.dart';
import 'package:flutterbbase/utils/constant.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

/// 页面跳转
class NavigatorUtil {
  // 返回
  static void goBack() {
    Get.back();
  }

  // 跳转到首页面
  static void goHome() {
    // 将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Get.offNamed(RouteCore.home);
  }

  // 跳转直接移除不返回
  static void goPushRemoveHistory(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  // 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  // 路由返回指定页面
  static void goBackUrl(BuildContext context, String title) {
    Navigator.popAndPushNamed(context, title);
  }

  // 跳转到指定的转场动画 inFromRight
  static jump({required String name, dynamic? arguments}) {
    Get.toNamed(name, arguments: arguments);
  }

  // 跳转到登录页并删除当前路由
  static void goToLoginRemovePage(BuildContext context) async {
    await SpUtil.putString(Constant.TOKEN, "");
    // 跳转首页
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
        (route) => route == null);
  }

  // 鉴权是否登录了
  static Future<bool> authenticationm(BuildContext context) async {
    String? token = SpUtil.getString(Constant.TOKEN);
    Utils.log().d("登录的token: $token");
    if (token != null) {
      return true;
    }
    NavigatorUtil.goToLoginRemovePage(context);
    return false;
  }
}
