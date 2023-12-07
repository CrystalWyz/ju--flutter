import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          children: <Widget>[
            SizedBox(height: 380.h),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  '聚',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            TextFormField(
              controller: controller.userNameController,
              decoration: const InputDecoration(
                labelText: '账号',
              ),
              validator: (v) => v!.trim().isNotEmpty ? null : "请输入账号",
            ),
            SizedBox(height: 14.h),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: '密码',
              ),
              obscureText: true,
              validator: (v) => v!.trim().isNotEmpty ? null : "请输入密码",
            ),
            SizedBox(height: 14.h),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('注册'),
                  onPressed: () {
                    controller.userNameController.clear();
                    controller.passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: const Text('登录'),
                  onPressed: () {
                    Get.toNamed("/home");
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
