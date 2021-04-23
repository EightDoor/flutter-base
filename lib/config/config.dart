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

/// EasyRefreshText数据加载header、footer提示
class EasyRefreshText {
  static String refreshText = "下拉刷新";
  static String refreshReadyText = "释放刷新";
  static String refreshingText = "刷新中";
  static String refreshedText = "刷新完成";
  static String refreshFailedText = "刷新失败";
  static String noMoreText = "没有数据了";
  static String infoText = "最后更新时间 %T";

  static String enableInfiniteLoad = "开始无限滚动";
  static String loadText = "开始加载数据";
  static String loadReadyText = "释放加载数据";
  static String loadingText = "加载数据中";
  static String loadedText = "数据加载完成";
  static String loadFailedText = "数据加载失败";
}
