import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ju/app/modules/model/MurderMysteryPageInfo.dart';
import 'package:ju/app/modules/utils/https_util.dart';
import '../../utils/storage_util.dart';
import '../views/home_view.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late RxInt bottomNaviSelected;
  RxList<MurderMysteryPageInfo> pageInfo = <MurderMysteryPageInfo>[].obs;
  
  static int size = 10;
  static int page = 1;

  final List<Widget> pages = const [
    HomeView()
  ];

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    bottomNaviSelected = 0.obs;

    getMurderMysteryPageData();
    
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    var userInfo = await StorageUtil.get("userInfo");
    if(userInfo == null) {
      Get.offNamed("/login");
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeBottomNaviSelect(selectedIndex) {
    bottomNaviSelected.value = selectedIndex;
  }

  getMurderMysteryPageData() async {
    var response = await HttpsUtil.get("/api/v1/murderMysteries/page?page=${page}&size=${size}");
    if(response != null) {
      pageInfo.addAll(response.data['data'].map<MurderMysteryPageInfo>((info) => MurderMysteryPageInfo.fromJson(info)).toList());
      print(pageInfo);
      page++;
    }
  }
}
