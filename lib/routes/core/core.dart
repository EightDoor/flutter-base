import 'package:flutterbbase/pages/home/home.dart';
import 'package:flutterbbase/pages/startup_screen.dart';
import 'package:get/get.dart';

class RouteCore {
  static final String startUp = "/";
  static final String home = "/home";
  static final List<GetPage> corePage = [
    GetPage(
      name: startUp,
      page: () => StartUpScreen(),
    ),
    GetPage(
      name: home,
      page: () => Home(),
    ),
  ];
}
