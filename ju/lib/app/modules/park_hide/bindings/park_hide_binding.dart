import 'package:get/get.dart';

import '../controllers/park_hide_controller.dart';

class ParkHideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParkHideController>(
      () => ParkHideController(),
    );
  }
}
