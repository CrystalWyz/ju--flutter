import 'package:get/get.dart';

import '../controllers/murder_mystery_controller.dart';

class MurderMysteryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MurderMysteryController>(
      () => MurderMysteryController(),
    );
  }
}
