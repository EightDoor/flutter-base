import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/config/config.dart';
import 'package:flutterbbase/models/upgrade.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:get/get.dart';
import 'package:r_upgrade/r_upgrade.dart';

GlobalKey<_UpgradeDialogState> globalKeyUpgrade =
    GlobalKey<_UpgradeDialogState>();

class UpgradeDialog extends StatefulWidget {
  final Upgrade upgrade;
  UpgradeDialog({required this.upgrade});
  @override
  _UpgradeDialogState createState() => _UpgradeDialogState();
}

class _UpgradeDialogState extends State<UpgradeDialog> {
  late Data data;
  double progress = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      data = widget.upgrade.data;
    });
    Utils.log().i(
      widget.upgrade.data.toJson(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .8.sw,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: data.buildFileSize != null
          ? Stack(
              children: [
                ListView(
                  children: [
                    ListTile(
                      leading: Text("大小"),
                      title: Text(
                        (int.parse(data.buildFileSize) / 1024 / 1024)
                                .round()
                                .toString() +
                            " M",
                      ),
                    ),
                    ListTile(
                      leading: Text("版本号"),
                      title: Text(
                        data.buildVersion,
                      ),
                    ),
                    ListTile(
                      leading: Text("应用更新说明"),
                    ),
                    // 模糊进度条(会执行一个动画)
                    LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      value: this.progress,
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                    Text(data.buildUpdateDescription),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      width: .8.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SimpleDialogOption(
                            child: Text("更新"),
                            onPressed: () {
                              Utils.log().i("更新");
                              isDownload();
                            },
                          ),
                          SimpleDialogOption(
                            child: Text("取消"),
                            onPressed: () {
                              Get.back();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          : Container(),
    );
  }

  /// 开始下载应用
  static void isDownload() async {
    int? id = await RUpgrade.upgrade(UpgradeSetting.downloadUrl);
    if (id != null) {
      install(id);
    }
  }

  /// 下载应用
  static void install(int id) async {
    await RUpgrade.install(id);
    RUpgrade.stream.listen((event) {
      Utils.log().i(event.percent);
      globalKeyUpgrade.currentState!.progress = event.percent!;
    });
  }
}
