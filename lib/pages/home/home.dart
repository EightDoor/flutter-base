import 'package:flutter/material.dart';
import 'package:flutterbbase/utils/upgrade_util.dart';

/// 首页
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    UpgradeUtil.upgrade(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Text("首页"),
    );
  }
}
