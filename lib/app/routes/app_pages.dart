import 'package:get/get.dart';

import '../modules/main/main_binding.dart';
import '../modules/main/main_view.dart';
import '../modules/onboard/onboard_binding.dart';
import '../modules/onboard/onboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
  ];
}
