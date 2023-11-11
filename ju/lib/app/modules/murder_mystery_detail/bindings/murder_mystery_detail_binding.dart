import 'package:get/get.dart';

import '../controllers/murder_mystery_detail_controller.dart';

class MurderMysteryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MurderMysteryDetailController>(
      () => MurderMysteryDetailController(),
    );
  }
}
