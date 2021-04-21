import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/upgrade_util.dart';
import 'package:package_info/package_info.dart';

/// 我的设置版本
class MySettingVersion extends StatefulWidget {
  @override
  _MySettingVersionState createState() => _MySettingVersionState();
}

class _MySettingVersionState extends State<MySettingVersion> {
  String version = '0.0.0';

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Column(
        children: [
          ListTile(
            leading: Text("版本"),
            title: Text(version),
            trailing: RaisedButton(
              child: Text("检查版本"),
              onPressed: () {
                Utils.log().i('点击了');
                UpgradeUtil.upgrade(context: context, click: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
