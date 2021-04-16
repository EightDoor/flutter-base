import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbbase/api/api_common.dart';
import 'package:flutterbbase/config/config.dart';
import 'package:flutterbbase/utils/index.dart';
import 'package:flutterbbase/utils/upgrade_dialog.dart';
import 'package:package_info/package_info.dart';
import 'package:r_upgrade/r_upgrade.dart';

class UpgradeUtil {
  /// 升级
  static upgrade({bool? click, required BuildContext context}) async {
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
          show(context);
        }
        // Utils.log().i(value.toJson());
      });
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

  /// 下载应用
  static void install(int id) async {
    await RUpgrade.install(id);
    RUpgrade.stream.listen((event) {
      Utils.log().i(event.percent);
    });
  }

  /// 显示弹出框
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return UpgradeDialog();
      },
    );
    // isDownload();
  }

  /// 开始下载应用
  static void isDownload() async {
    int? id = await RUpgrade.upgrade(UpgradeSetting.downloadUrl);
    if (id != null) {
      install(id);
    }
  }
}
