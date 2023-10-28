import 'package:get/get.dart';

import '../controllers/escape_room_controller.dart';

class EscapeRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EscapeRoomController>(
      () => EscapeRoomController(),
    );
  }
}
