import 'package:flutterbbase/pages/demo/demo_form.dart';
import 'package:flutterbbase/pages/demo/demo_swiper.dart';
import 'package:get/get.dart';

class DemoRoute {
  static final String form = '/form';
  static final String swiper = '/swiper';
  static final List<GetPage> list = [
    GetPage(
      name: form,
      page: () => DemoForm(),
    ),
    GetPage(name: swiper, page: ()=> SwiperDemo(),),
  ];
}
