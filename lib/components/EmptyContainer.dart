import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/Empty.dart';

/// 暂无数据放置容器显示
class EmptyContainer extends StatelessWidget {
  final double height;
  EmptyContainer({required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height != null ? height : 200.h,
      child: Empty(),
    );
  }
}
