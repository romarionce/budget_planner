import 'package:budget_planner/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  var themeMode = ThemeMode.light.obs;
  final _storageService = StorageService.to;

  bool get isLight => themeMode == ThemeMode.light;

  Future<void> switchTheme() async {
    var newMode =
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    themeMode.value = newMode;
    await _storageService.setTheme(newMode);
    Get.changeThemeMode(newMode);
    await Get.forceAppUpdate();
    print('Changed theme to ${newMode.name}');
  }

  Future<void> defaultTheme() async {
    var mode = ThemeMode.dark;
    await _storageService.setTheme(mode);
    Get.changeThemeMode(mode);
    print('Changed theme to ${mode.name}');
    await Get.forceAppUpdate();
  }

  Future<ThemeService> init() async {
    themeMode.value = _storageService.getTheme();
    return this;
  }
}
