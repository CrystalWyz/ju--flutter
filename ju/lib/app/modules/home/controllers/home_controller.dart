import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/storage_util.dart';
import '../views/home_view.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late RxInt bottomNaviSelected;

  final List<Widget> pages = const [
    HomeView()
  ];

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    bottomNaviSelected = 0.obs;
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
}
