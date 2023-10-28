import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/escape_room_controller.dart';

class EscapeRoomView extends GetView<EscapeRoomController> {
  const EscapeRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EscapeRoomView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EscapeRoomView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
