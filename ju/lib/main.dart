import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/supplemental/cut_corners_border.dart';
import 'package:get/get.dart';

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
                  seedColor: Colors.purple,
                  brightness: Brightness.light,
                  surfaceTint: Colors.transparent),
              inputDecorationTheme: const InputDecorationTheme(
                focusedBorder: CutCornersBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
                border: CutCornersBorder(), // Replace code
              ),
          ),
        );
      },
    )
  );
}
