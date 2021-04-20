import 'package:flutter/material.dart';

/// 我的
class My extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Text("我的");
  }

  bool get wantKeepAlive => true;
}
