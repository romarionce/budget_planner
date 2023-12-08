import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/routes/navigators.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:budget_planner/app/services/storage_service.dart';
import 'package:budget_planner/app/services/theme_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService.to.themeMode,
      navigatorKey: Get.nestedKey(NavigatorKeys.mainNavigator.index),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => ThemeService().init());
  await Get.putAsync(() => ApiService().init());
}
