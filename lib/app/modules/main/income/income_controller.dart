import 'package:budget_planner/app/models/expense/expense.dart';
import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/main_controller.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {
  final _curVal = 1.obs;

  int get curVal => _curVal.value;
  set curVal(int i) => _curVal.value = i;

  List<String> items = ['Income', 'Expenses'];

  final date = DateTime.now().obs;
  final _isToday = true.obs;
  bool get isToday => _isToday.value;

  void setToday() {
    date.value = DateTime.now();
    _isToday.value = true;
  }

  void setYesterDay() {
    date.value = DateTime.now().subtract(const Duration(days: 1));
    _isToday.value = false;
  }

  final _activeCategory = 0.obs;
  int get activeCat => _activeCategory.value;
  set activeCat(i) => _activeCategory.value = i;

  final amountCtrl = TextEditingController(text: '10');

  void reset() {
    amountCtrl.text = '10';
    activeCat = 0;
    setToday();
    update();
  }

  void addTransaction() async {
    var newExpense = Expense(
        DateTime.now().millisecondsSinceEpoch.toString(),
        ApiService.to.getCategoryExpenses[activeCat].id,
        date.value,
        double.tryParse(amountCtrl.text) ?? 100);
    await ApiService.to.addExpense(newExpense);
    var ctrl = Get.find<MainController>();
    ctrl.activeTab = 0;
    Get.find<HomeController>().update();
    reset();
  }
}
