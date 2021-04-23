import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 加载动画
class Loading extends StatelessWidget {
  final String title;
  Loading({this.title = "加载中"});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: .8.sh,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Theme.of(context).toggleableActiveColor,
              size: 50.0,
            ),
            Offstage(
              offstage: title == null,
              child: Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: Text(title != null ? title : ""),
              ),
            )
          ],
        ),
      ),
    );
  }
}
