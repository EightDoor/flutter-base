import 'package:flutterbbase/pages/demo/demo_form.dart';
import 'package:get/get.dart';

class DemoRoute {
  static final String form = '/form';
  static final List<GetPage> list = [
    GetPage(
      name: form,
      page: () => DemoForm(),
    ),
  ];
}
