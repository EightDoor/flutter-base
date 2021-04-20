import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpgradeDialog extends StatefulWidget {
  @override
  _UpgradeDialogState createState() => _UpgradeDialogState();
}

class _UpgradeDialogState extends State<UpgradeDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Text("123"),
    );
  }
}
