import 'package:get/get.dart';
import 'package:ju/app/modules/model/MurderMysteryDetail.dart';
import 'package:ju/app/modules/utils/https_util.dart';

class MurderMysteryDetailController extends GetxController {

  Rx<MurderMysteryDetail> murderMysteryDetail = MurderMysteryDetail().obs;

  @override
  void onInit() async {
    await getMurderMysteryDetail();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getMurderMysteryDetail() async {
    var response = await HttpsUtil.get("/api/v1/murderMysteries/${Get.arguments}");
    if(response != null) {
      murderMysteryDetail.value = MurderMysteryDetail.fromJson(response.data['data']);
    }
  }
}
