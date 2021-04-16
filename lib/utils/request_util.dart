import 'package:dio/dio.dart';
import 'package:flutterbbase/config/config.dart';
import 'package:flutterbbase/utils/index.dart';

enum RequestMethods { get, post, put, patch, delete }

/// 网络请求
class RequestUtil {
  var options = BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  static final dio = new Dio();
  static Future<dynamic> request(
      {required String path,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      RequestMethods? method}) async {
    var data;
    var queryParameters;
    String dioMethod = 'GET';
    switch (method) {
      case RequestMethods.post:
        dioMethod = "POST";
        break;
      case RequestMethods.patch:
        dioMethod = "PATCH";

        break;
      case RequestMethods.delete:
        dioMethod = "DELETE";
        break;
      default:
    }
    try {
      var response = await dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(method: dioMethod));
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        Utils.log().d(e.response!.data);
        Utils.log().d(e.response!.headers);
      } else {
        Utils.log().d(e.requestOptions);
        Utils.log().d(e.message);
      }
    }
  }
}
