import 'package:flutter/material.dart';
import 'package:flutterbbase/routes/demo/demo.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/navigator_util.dart';
import 'package:flutterbbase/utils/upgrade_util.dart';
import 'package:get/get.dart';
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
          ListTile(
            leading: Text("改变主题"),
            trailing: RaisedButton(
              child: Text("点击改变主题"),
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
            ),
          ),
          ListTile(
            leading: Text("demo"),
            trailing: RaisedButton(
              child: Text("表单demo"),
              onPressed: () {
                NavigatorUtil.jump(name: DemoRoute.form);
              },
            ),
          )
        ],
      ),
    );
  }
}
