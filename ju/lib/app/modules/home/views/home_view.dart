import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/fitness_app_home_screen.dart';
import '../controllers/home_controller.dart';

import 'murder_mystery_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FitnessAppHomeScreen(),
    );
  }
}
