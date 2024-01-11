import 'package:get/get.dart';

import '../modules/create_ju/bindings/create_ju_binding.dart';
import '../modules/create_ju/views/create_ju_view.dart';
import '../modules/drink/bindings/drink_binding.dart';
import '../modules/drink/views/drink_view.dart';
import '../modules/escape_room/bindings/escape_room_binding.dart';
import '../modules/escape_room/views/escape_room_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/murder_mystery/bindings/murder_mystery_binding.dart';
import '../modules/murder_mystery/views/murder_mystery_view.dart';
import '../modules/murder_mystery_detail/bindings/murder_mystery_detail_binding.dart';
import '../modules/murder_mystery_detail/views/murder_mystery_detail_view.dart';
import '../modules/park_hide/bindings/park_hide_binding.dart';
import '../modules/park_hide/views/park_hide_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
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
      transition: Transition.fadeIn,
      name: _Paths.CREATE_JU,
      page: () => const CreateJuView(),
      binding: CreateJuBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: _Paths.MURDER_MYSTERY_DETAIL,
      page: () => const MurderMysteryDetailView(),
      binding: MurderMysteryDetailBinding(),
    ),
  ];
}
