import 'dart:convert';

import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/models/expense/expense.dart';
import 'package:budget_planner/app/models/income/income.dart';
import 'package:budget_planner/app/models/income_category/income_category.dart';
import 'package:budget_planner/app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  late Box<int> themeBox;
  late Box<bool> launch;
  late Box<String> expenses;
  late Box<String> incomes;
  late Box<String> categoriesExpense;
  late Box<String> categoriesIncome;

  List<Expense> getExpenses() {
    return expenses.values.map((e) => Expense.fromJson(jsonDecode(e))).toList();
  }

  Future<void> addExpense(Expense expense) {
    return expenses.put(expense.id, jsonEncode(expense.toJson()));
  }

  Future<void> removeExpense(String id) => expenses.delete(id);

  List<Income> getIncomes() {
    return incomes.values.map((e) => Income.fromJson(jsonDecode(e))).toList();
  }

  Future<void> addIncome(Income income) {
    return incomes.put(income.id, jsonEncode(income.toJson()));
  }

  Future<void> removeIncome(String id) => incomes.delete(id);

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

  List<CategoryIncome> getCategoryIncome() {
    return categoriesIncome.values
        .map((e) => CategoryIncome.fromJson(jsonDecode(e)))
        .toList();
  }

  Future<void> addCategoryIncome(CategoryIncome categoryIncome) {
    return categoriesIncome.put(
        categoryIncome.id, jsonEncode(categoryIncome.toJson()));
  }

  Future<void> removeCategoryIncome(String id) async {
    return categoriesIncome.delete(id);
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
    categoriesIncome = await Hive.openBox<String>('categoriesIncomes');
    expenses = await Hive.openBox<String>("expenses");
    incomes = await Hive.openBox<String>("incomes");

    if (categoriesIncome.values.isEmpty) {
      var futures1 = [
        CategoryIncome('0', 'Salario', 'add', Colors.green.value),
        CategoryIncome('1', 'Deuda', 'add', Colors.green.value),
        CategoryIncome('2', 'Inversión', 'add', Colors.green.value),
        CategoryIncome('3', 'Otro', 'add', Colors.green.value),
      ].map((e) => addCategoryIncome(e));
      await Future.wait(futures1);
    }
    if (categoriesExpense.values.isEmpty) {
      var futures = [
        CategoryExpense('0', 'Alimento', 'food', Colors.amber.value, 150),
        CategoryExpense('1', 'Bebidas', 'drinks', Colors.red.value, 150),
        CategoryExpense('2', 'Comercio', 'shop', Colors.green.value, 150),
        CategoryExpense('3', 'Transporte', 'transport', Colors.blue.value, 150),
        CategoryExpense('4', 'Casa', 'home', Colors.deepOrange.value, 150),
        CategoryExpense('5', 'Ocio', 'rate', Colors.indigo.value, 150),
        CategoryExpense('6', 'Impuestos', 'share', Colors.brown.value, 150),
        CategoryExpense('7', 'Medicine', 'tablet', Colors.lightBlue.value, 150),
      ].map((e) => addCategoryExpense(e));
      await Future.wait(futures);
    }
    return this;
  }

  Future<void> clearData() => Hive.deleteFromDisk().then((value) async {
        await init();
        await ThemeService.to.defaultTheme();
      });
}
