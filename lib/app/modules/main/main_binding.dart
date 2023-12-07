import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/income/income_controller.dart';
import 'package:budget_planner/app/modules/main/settings/settings_controller.dart';
import 'package:budget_planner/app/modules/main/transaction/transaction_controller.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => IncomeController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => TransactionController());
  }
}
