import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/config/config.dart';
import 'package:flutterbbase/models/upgrade.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/navigator_util.dart';
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
  bool loading = false;
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
      height: 230.h,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: data.buildFileSize != null
          ? Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: .8.sw,
                    height: 50,
                    child: Center(
                      child: Text(
                        loading
                            ? widget.upgrade.data.buildName + " (下载中...)"
                            : widget.upgrade.data.buildName,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                    top: 30,
                  ),
                  child: ListView(
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
                      Text(data.buildUpdateDescription),
                    ],
                  ),
                ),
                loading
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        width: .8.sw,
                        child: // 模糊进度条(会执行一个动画)
                            SizedBox(
                          height: 4.sp,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey[200],
                            value: this.progress,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                          ),
                        ),
                      )
                    : Positioned(
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
          : Container(),
    );
  }

  /// 开始下载应用
  void isDownload() async {
    int? id = await RUpgrade.upgrade(UpgradeSetting.downloadUrl);
    if (id != null) {
      install(id);
    }
  }

  /// 下载应用
  void install(int id) async {
    await RUpgrade.install(id);
    RUpgrade.stream.listen((event) {
      // Utils.log().i(event.percent! / 100);
      if (event.status == DownloadStatus.STATUS_SUCCESSFUL) {
        Utils.log().i("下载成功");
        Utils.showToast(status: "下载成功");
        NavigatorUtil.goBack();
      } else if (event.status == DownloadStatus.STATUS_FAILED) {
        Utils.log().i("下载失败");
        Utils.showToast(status: "下载失败");
      }
      // 下载中...
      if (event.status == DownloadStatus.STATUS_RUNNING) {
        if (!loading) {
          setState(() {
            loading = true;
          });
        }
      } else {
        if (loading) {
          setState(() {
            loading = false;
          });
        }
      }
      setState(() {
        progress = event.percent! / 100;
      });
    });
  }
}
