import 'package:get/get.dart';

import '../controllers/create_ju_controller.dart';

class CreateJuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateJuController>(
      () => CreateJuController(),
    );
  }
}
