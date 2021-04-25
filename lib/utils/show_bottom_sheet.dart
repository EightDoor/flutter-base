import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Tapped.dart';
import 'package:get/get.dart';

/// 显示底部的actionSheet
void showBottomSheetUtil(BuildContext context,
    {required List<Widget> child, double? width, String? title}) {
  showBottomSheet(
    backgroundColor: Theme.of(context).backgroundColor,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: width ?? 300.h,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [bottomHeader(title ?? "请选择"), ...child],
        ),
      );
    },
  );
}

Widget bottomHeader(String title) {
  return Container(
    height: 50.h,
    padding: EdgeInsets.all(10.sp),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Tapped(
          child: Icon(Icons.close),
          onTap: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}
