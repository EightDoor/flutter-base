import 'package:fluro/fluro.dart';
import 'package:flutterbbase/routes/business/my/my_handlers.dart';

class MyRoutes {
  static final String my = 'my';
  static void configRoutes(FluroRouter router) {
    router.define(
      my,
      handler: myHandler,
    );
  }
}
