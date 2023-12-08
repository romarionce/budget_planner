import 'dart:convert';

import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late Box<int> themeBox;
  late Box<bool> launch;
  late Box<String> categoriesExpense;

  List<CategoryExpense> getCategoryExpense() {
    return categoriesExpense.values
        .map((e) => CategoryExpense.fromJson(jsonDecode(e)))
        .toList();
  }

  Future<void> addCategoryExpense(CategoryExpense categoryExpense) {
    return categoriesExpense.put(
        categoryExpense.id, jsonEncode(categoryExpense.toJson()));
  }

  Future<void> removeCategoryExpense(String id) async {
    return categoriesExpense.delete(id);
  }

  ThemeMode getTheme() {
    var themeIndex = themeBox.get('theme') ?? 0;
    return ThemeMode.values[themeIndex];
  }

  Future<void> setTheme(ThemeMode mode) => themeBox.put('theme', mode.index);

  bool isFirstLanuch() => launch.get('launch') ?? true;
  Future<void> setFirstLaunch() => launch.put('launch', false);

  Future<StorageService> init() async {
    await Hive.initFlutter();
    themeBox = await Hive.openBox<int>('theme');
    launch = await Hive.openBox<bool>('launch');
    categoriesExpense = await Hive.openBox<String>('categories');

    if (categoriesExpense.values.isEmpty) {
      var futures = [
        CategoryExpense('0', 'Food', 'food', Colors.amber.value, 150),
        CategoryExpense('1', 'Drinks', 'drinks', Colors.red.value, 150),
        CategoryExpense('2', 'Shop', 'shop', Colors.green.value, 150),
        CategoryExpense('3', 'Transport', 'transport', Colors.blue.value, 150),
      ].map((e) => addCategoryExpense(e));
      await Future.wait(futures);
    }
    return this;
  }

  Future<void> clearData() => Hive.deleteFromDisk().then((value) => init());
}
