import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listCategories = ApiService.to.getCategoryExpenses;
  var expenses = ApiService.to.getExpenses.obs;

  CategoryExpense getCategory(String id) =>
      listCategories.firstWhere((element) => element.id == id);

  @override
  void update([List<Object>? ids, bool condition = true]) {
    expenses.value = ApiService.to.getExpenses;
    super.update(ids, condition);
  }
}
