import 'package:get/get.dart';

import '../controllers/ju_user_controller.dart';

class JuUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JuUserController>(
      () => JuUserController(),
    );
  }
}
