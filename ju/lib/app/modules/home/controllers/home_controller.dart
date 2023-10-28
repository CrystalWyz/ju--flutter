import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  void onReady() {
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
