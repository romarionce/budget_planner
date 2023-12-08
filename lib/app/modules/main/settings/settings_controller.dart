import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/routes/app_pages.dart';
import 'package:budget_planner/app/services/storage_service.dart';
import 'package:budget_planner/app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void switchTheme() {
    Fluttertoast.showToast(
        msg: "Theme changed!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsApp.main,
        textColor: Colors.white,
        fontSize: 16.0);
    ThemeService.to.switchTheme();
  }

  void clearStorage() async {
    await StorageService.to.clearData();
    Fluttertoast.showToast(
        msg: "Data is cleared!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorsApp.main,
        textColor: Colors.white,
        fontSize: 16.0);
    await Future.delayed(const Duration(milliseconds: 500));
    Fluttertoast.cancel();
    Get.offNamed(Routes.ONBOARD);
  }
}
