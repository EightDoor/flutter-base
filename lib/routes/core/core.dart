import 'package:flutterbbase/pages/home/home.dart';
import 'package:flutterbbase/pages/startup_screen.dart';
import 'package:flutterbbase/pages/tabs/tabs.dart';
import 'package:get/get.dart';

class RouteCore {
  static final String startUp = "/";
  static final String home = "/home";
  static final String tabs = "/tabs";
  static final List<GetPage> corePage = [
    GetPage(
      name: startUp,
      page: () => StartUpScreen(),
    ),
    GetPage(
      name: home,
      page: () => Home(),
    ),
    GetPage(
      name: tabs,
      page: () => Tabs(),
    ),
  ];
}
