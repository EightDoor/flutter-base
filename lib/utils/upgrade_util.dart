import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbbase/api/api_common.dart';
import 'package:flutterbbase/config/config.dart';
import 'package:flutterbbase/models/upgrade.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/upgrade_dialog.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:r_upgrade/r_upgrade.dart';

GlobalKey globalKeyUpgrade = GlobalKey();

class UpgradeUtil {
  /// 升级
  static upgrade({bool? click, required BuildContext context}) async {
    Utils.showLoading();
    return UpgradeUtil.getDeviceInfo(click: click, context: context);
  }

  /// 获取设备信息
  static getDeviceInfo({bool? click, required BuildContext context}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    bool isAndroid = Platform.isAndroid;
    bool isIos = Platform.isIOS;
    if (isAndroid) {
      // 请求app信息
      await upgradeApi().then((value) async {
        final String buildVersion = value.data.buildVersion;
        final bool result = versionComparison(buildVersion, version);
        if (result) {
          UpgradeUtil.show(context, value);
        } else {
          Utils.showToast(status: "已经是最新版本了");
        }
        // Utils.log().i(value.toJson());
      });
      Utils.hideLoading();
      Utils.log().i("android版本: $version");
    } else if (isIos) {
      Utils.log().i("ios版本: $version");
    }
  }

  /// 版本对比   线上版本 > 本地版本
  static bool versionComparison(String onLine, String local) {
    final v = int.parse(onLine.replaceAll(".", ""));
    final l = int.parse(local.replaceAll(".", ""));
    if (v > l) {
      return true;
    }
    return false;
  }

  /// 显示弹出框
  static void show(BuildContext context, Upgrade upgrade) async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          key: globalKeyUpgrade,
          title: Center(
            child: Text(upgrade.data.buildName),
          ),
          children: [
            Stack(
              children: [
                UpgradeDialog(upgrade: upgrade),
                // Positioned(
                //   top: 0,
                //   left: 0,
                //   child:
                //       WaveProgress(180.0, Colors.blue, Colors.blueAccent, 50),
                // ),
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
        );
      },
    );
    if (result != null) {
      Utils.log().i("点击了关闭: " + result);
    }
    // isDownload();
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
    });
  }
}
