import 'package:flutter/material.dart';

/// 表单统一使用form
class DemoForm extends StatefulWidget {
  @override
  _DemoFormState createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单demo"),
      ),
      body: Text("内容"),
    );
  }
}
