import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/components/CacheImage.dart';

/// 带圆角的图片
class CacheImageFillet extends StatelessWidget {
  final String url;
  CacheImageFillet({required this.url});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.sp),
      child: CacheImage(
        url: url,
      ),
    );
  }
}
