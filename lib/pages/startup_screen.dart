import 'package:flutter/material.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/navigator_util.dart';

/// 启动屏
class StartUpScreen extends StatefulWidget {
  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
  @override
  void initState() {
    super.initState();
    init();
    Future.delayed(Duration(seconds: 2), () {
      NavigatorUtil.goHome();
    });
  }

  void init() {
    Utils.immersiveNavigation();
    Utils.customEasyLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("启动屏"),
    );
  }
}
