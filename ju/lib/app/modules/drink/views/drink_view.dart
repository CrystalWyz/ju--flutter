import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/drink_controller.dart';

class DrinkView extends GetView<DrinkController> {
  const DrinkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DrinkView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DrinkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
