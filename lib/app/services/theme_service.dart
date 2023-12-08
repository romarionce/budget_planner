import 'package:budget_planner/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  static ThemeService get to => Get.find();

  late ThemeMode themeMode;
  final _storageService = StorageService.to;

  bool get isLight => themeMode == ThemeMode.light;

  Future<void> switchTheme() async {
    var newMode =
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    themeMode = newMode;
    await _storageService.setTheme(newMode);
    Get.changeThemeMode(newMode);
    print('Changed theme to ${newMode.name}');
  }

  Future<ThemeService> init() async {
    themeMode = await _storageService.getTheme();
    return this;
  }
}
