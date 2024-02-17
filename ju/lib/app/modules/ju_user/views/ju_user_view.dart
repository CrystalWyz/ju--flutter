import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ju_user_controller.dart';

class JuUserView extends GetView<JuUserController> {
  const JuUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JuUserView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JuUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
