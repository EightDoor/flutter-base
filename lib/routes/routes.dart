import 'package:flutterbbase/routes/core/core.dart';
import 'package:flutterbbase/routes/demo/demo.dart';
import 'package:get/get.dart';

class RouterConfig {
  static final List<GetPage> getPage = [
    // core
    ...RouteCore.corePage,

    // demo
    ...DemoRoute.list,
  ];
}
