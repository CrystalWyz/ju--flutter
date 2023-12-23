import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpsUtil {

  static String baseUrl = "http://192.168.3.123:8075";
  static final cookieJar = CookieJar();
  static final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),

  );
  static Dio? _dio;

  static Future get(apiUrl) async {
    try {
      var response = await getInstance().get(apiUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  static Dio getInstance() {
    if(_dio == null) {
      _dio = Dio(options);
      _dio!.interceptors.add(CookieManager(cookieJar));
    }

    return _dio!;
  }

  static Future post(String apiUrl,{Map? data, Options? options}) async {
    try {
      var response = await getInstance().post(apiUrl,data:data, options: options);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        showCenterShortToast(e.response?.data['message']);
      } else{
        showCenterShortToast("出现错误啦～");
      }
      return null;
    }
  }

  static void showCenterShortToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3);
  }
}

