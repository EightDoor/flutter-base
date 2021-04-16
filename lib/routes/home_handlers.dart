import 'package:fluro/fluro.dart';
import 'package:flutterbbase/pages/home/home.dart';
import 'package:flutterbbase/pages/login/login.dart';
import 'package:flutterbbase/pages/startup_screen.dart';

var startupScreenHandler =
    Handler(handlerFunc: (_, Map<String, dynamic> params) => StartUpScreen());

var homeHandler = Handler(
  handlerFunc: (_, Map<String, dynamic> params) => Home(),
);

var loginHandler = Handler(
  handlerFunc: (_, Map<String, dynamic> params) => Login(),
);
