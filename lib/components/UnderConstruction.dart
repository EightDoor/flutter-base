import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/utils/font.dart';

/// 正在建设中
class UnderConstruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 123.w,
          height: 101.h,
          child: Image.asset("assets/other/underDevelopment.png"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.sp),
          child: Text(
            "正在建设中...",
            style: TextStyle(
                fontSize: Font.font_16,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
