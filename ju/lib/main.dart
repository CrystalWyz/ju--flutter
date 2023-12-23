import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/supplemental/cut_corners_border.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
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
              inputDecorationTheme: const InputDecorationTheme(
                focusedBorder: CutCornersBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
                border: CutCornersBorder(), // Replace code
              ),
              colorScheme: const ColorScheme.light().copyWith(primary: const Color.fromRGBO(100, 215, 200, 1))
          ),
        );
      },
    )
  );
}
