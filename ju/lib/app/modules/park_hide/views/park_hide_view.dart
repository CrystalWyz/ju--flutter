import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/park_hide_controller.dart';

class ParkHideView extends GetView<ParkHideController> {
  const ParkHideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ParkHideView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ParkHideView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
