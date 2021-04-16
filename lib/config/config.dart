class Config {
  // 基础路径
  static String baseUrl = "http://localhost:9090";
  // app 升级url
  static String upgradeUrl = 'https://www.pgyer.com/apiv2/';
}

class UpgradeSetting {
  static String appKey = "3cc9d723ec45058136b922a244a93c3c";
  static String api_key = "a89c8668808ff28f324edbf6059f3121";
  static String downloadUrl = Config.upgradeUrl +
      'app/install?_api_key=${UpgradeSetting.api_key}&appKey=${UpgradeSetting.appKey}';
}
