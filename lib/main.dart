import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/routes/navigators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      navigatorKey: Get.nestedKey(NavigatorKeys.mainNavigator.index),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
