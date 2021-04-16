import 'package:dio/dio.dart';
import 'package:flutterbbase/config/config.dart';
import 'package:flutterbbase/models/upgrade.dart';

/// 获取app版本信息
Future<Upgrade> upgradeApi() {
  var formData = FormData.fromMap(
    {"_api_key": UpgradeSetting.api_key, "appKey": UpgradeSetting.appKey},
  );
  var dio = new Dio();
  return dio
      .request(
        Config.upgradeUrl + "app/view",
        data: formData,
        options: Options(
          method: "POST",
        ),
      )
      .then(
        (value) => Upgrade.fromJson(value.data),
      );
}
