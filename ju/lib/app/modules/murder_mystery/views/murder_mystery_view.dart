import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/murder_mystery_controller.dart';

class MurderMysteryView extends GetView<MurderMysteryController> {
  const MurderMysteryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MurderMysteryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MurderMysteryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
