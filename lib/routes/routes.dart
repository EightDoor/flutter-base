import 'package:fluro/fluro.dart';
import 'package:flutterbbase/pages/other/not_fond.dart';
import 'package:flutterbbase/routes/business/my/my_routes.dart';
import 'package:flutterbbase/routes/home_handlers.dart';
import 'package:flutterbbase/utils/index.dart';

class Routes {
  static String startUpScreen = '/';
  static String home = '/home';
  static String login = '/login';
  static void configRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (_, Map<String, dynamic> params) {
        Utils.log().d("not fond url");
        return NotFond();
      },
    );
    router.define(
      startUpScreen,
      handler: startupScreenHandler,
    );

    router.define(
      home,
      handler: homeHandler,
    );
    router.define(
      login,
      handler: loginHandler,
    );

    MyRoutes.configRoutes(router);
  }
}
