import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ju/app/modules/home/views/murder_mystery_view.dart';
import '../../model/MurderMysteryPageInfo.dart';
import '../../utils/https_util.dart';
import '../../utils/storage_util.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  Widget tabBody = const MurderMysteryView();
  bool inflight = false;

  RxList<MurderMysteryPageInfo> pageInfo = <MurderMysteryPageInfo>[].obs;
  static int size = 10;
  static int page = 1;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController();

    getMurderMysteryPageData();

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    var userInfo = await StorageUtil.get("userInfo");
    if(userInfo == null) {
      Get.offNamed("/login");
    }

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 20) {
        if (inflight) {
          return;
        }
        inflight = true;
        getMurderMysteryPageData();
        inflight = false;
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  getMurderMysteryPageData() async {
    var response = await HttpsUtil.get("/api/v1/murderMysteries/page?page=$page&size=$size");
    if(response != null) {
      if (response.data['data'] != null) {
        pageInfo.addAll(response.data['data'].map<MurderMysteryPageInfo>((info) => MurderMysteryPageInfo.fromJson(info)).toList());
        page++;
      }
    }
  }
}
