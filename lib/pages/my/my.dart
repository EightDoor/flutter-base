import 'package:flutter/material.dart';
import 'package:flutterbbase/pages/my/my_setting_version.dart';

/// 我的
class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Column(
        children: [
          MySettingVersion(),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;
}
