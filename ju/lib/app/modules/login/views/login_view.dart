import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 300.h,
          ),
          const FlutterLogo(size: 100),
          SizedBox(
            height: 100.h,
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: TextFormField(
                autofocus: true,
                controller: controller.userNameController,
                decoration: const InputDecoration(
                    labelText: "账号",
                    hintText: "账号",
                    icon: Icon(Icons.account_box_outlined)
                ),
                validator: (v) => v!.trim().isNotEmpty ? null : "请输入账号",
              ),

          ),
          Padding(
              padding: EdgeInsets.all(20.w),
              child: TextFormField(
                autofocus: false,
                controller: controller.passwordController,
                decoration: const InputDecoration(
                    labelText: "密码",
                    hintText: "密码",
                    icon: Icon(Icons.password_outlined)
                ),
                validator: (v) => v!.trim().isNotEmpty ? null : "请输入密码",
                obscureText: true,
              )
          ),
          SizedBox(
            height: 50.h,
          ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  onPressed: () {},
                  child: const Text("注册")
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                child: const Text("登录"),
              )
            ],
          )
        )
        ],
      )
    );
  }
}
