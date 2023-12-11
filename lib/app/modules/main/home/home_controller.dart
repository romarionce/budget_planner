import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/models/expense/expense.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listCategories = ApiService.to.getCategoryExpenses.obs;
  var expenses = ApiService.to.getExpenses.obs;

  var expensed = ApiService.to.expensed.obs;
  var budget = ApiService.to.budget.obs;

  CategoryExpense getCategory(String id) =>
      listCategories.value.firstWhere((element) => element.id == id);

  double exp(String id) => expenses.value
      .where((element) => element.categoryId == id)
      .fold(0, (value, element) => value += element.price);

  int transactions(String id) =>
      expenses.value.where((element) => element.categoryId == id).length;

  int calcBudget() {
    var result = expenses.value
        .fold(0.0, (previousValue, element) => previousValue + element.price);
    return result.ceil();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    expenses.value = ApiService.to.getExpenses;
    listCategories.value = ApiService.to.getCategoryExpenses;
    super.update(ids, condition);
  }
}
