import 'package:get/get.dart';

import 'onboard_controller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnboardController>(
      OnboardController(),
    );
  }
}
