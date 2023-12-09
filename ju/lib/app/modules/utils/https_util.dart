import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpsUtil {

  static String baseUrl = "http://59.110.34.78:8075";

  static final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  );
  static Dio dio = Dio(options);

  static Future get(apiUrl) async {
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future post(String apiUrl,{Map? data}) async {
    try {
      var response = await dio.post(apiUrl,data:data);
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

