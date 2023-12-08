import 'package:budget_planner/app/routes/app_pages.dart';
import 'package:budget_planner/app/services/storage_service.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  void toMainPage() async {
    await StorageService.to.setFirstLaunch();
    Get.offNamed(Routes.MAIN);
  }

  @override
  void onReady() {
    if (!StorageService.to.isFirstLanuch()) {
      Get.offNamed(Routes.MAIN);
    }
    super.onReady();
  }
}
