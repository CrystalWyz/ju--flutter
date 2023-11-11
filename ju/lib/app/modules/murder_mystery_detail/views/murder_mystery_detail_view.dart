import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/murder_mystery_detail_controller.dart';

class MurderMysteryDetailView extends GetView<MurderMysteryDetailController> {
  const MurderMysteryDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MurderMysteryDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MurderMysteryDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
