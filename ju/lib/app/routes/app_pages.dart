import 'package:get/get.dart';

import '../modules/create_ju/bindings/create_ju_binding.dart';
import '../modules/create_ju/views/create_ju_view.dart';
import '../modules/drink/bindings/drink_binding.dart';
import '../modules/drink/views/drink_view.dart';
import '../modules/escape_room/bindings/escape_room_binding.dart';
import '../modules/escape_room/views/escape_room_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/murder_mystery/bindings/murder_mystery_binding.dart';
import '../modules/murder_mystery/views/murder_mystery_view.dart';
import '../modules/park_hide/bindings/park_hide_binding.dart';
import '../modules/park_hide/views/park_hide_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MURDER_MYSTERY,
      page: () => const MurderMysteryView(),
      binding: MurderMysteryBinding(),
    ),
    GetPage(
      name: _Paths.DRINK,
      page: () => const DrinkView(),
      binding: DrinkBinding(),
    ),
    GetPage(
      name: _Paths.ESCAPE_ROOM,
      page: () => const EscapeRoomView(),
      binding: EscapeRoomBinding(),
    ),
    GetPage(
      name: _Paths.PARK_HIDE,
      page: () => const ParkHideView(),
      binding: ParkHideBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_JU,
      page: () => const CreateJuView(),
      binding: CreateJuBinding(),
    ),
  ];
}
