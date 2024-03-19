import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';


import 'app/modules/hotel_bookin/hotel_app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
      ScreenUtilInit(
        designSize: const Size(1290, 2796),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                colorScheme: ColorScheme.fromSeed(
                    seedColor: HotelAppTheme.buildLightTheme().primaryColor,
                    brightness: Brightness.light,
                    surfaceTint: Colors.transparent)
            ),
          );
        },
      )
  );

  // 地图
  /// 动态申请定位权限
  requestPermission();

  LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();

  /// 设置用户是否同意SDK隐私协议
  /// since 3.1.0 开发者必须设置
  BMFMapSDK.setAgreePrivacy(true);
  myLocPlugin.setAgreePrivacy(true);

  // 百度地图sdk初始化鉴权
  myLocPlugin.authAK('PqZnLONqz5USrbLwHyP5msYMUfHaE29X');
  BMFMapSDK.setApiKeyAndCoordType('PqZnLONqz5USrbLwHyP5msYMUfHaE29X', BMF_COORD_TYPE.BD09LL);
}

void requestPermission() async {
  // 申请权限
  bool hasLocationPermission = await requestLocationPermission();
  if (hasLocationPermission) {
    // 权限申请通过
  } else {}
}

/// 申请定位权限
/// 授予定位权限返回true， 否则返回false
Future<bool> requestLocationPermission() async {
  //获取当前的权限
  var status = await Permission.location.status;
  if (status == PermissionStatus.granted) {
    //已经授权
    return true;
  } else {
    //未授权则发起一次申请
    status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
