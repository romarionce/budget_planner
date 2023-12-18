import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/models/expense/expense.dart';
import 'package:budget_planner/app/models/income/income.dart';
import 'package:budget_planner/app/models/income_category/income_category.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listCategories = ApiService.to.getCategoryExpenses.obs;
  var expenses = ApiService.to.getExpenses.obs;
  var listCategoriesIncomes = ApiService.to.getCategoryIncomes.obs;
  var incomes = ApiService.to.getIncomes.obs;

  List<dynamic> get operations {
    var res = [...incomes, ...expenses];
    res.sort((a, b) {
      var ar, ab;
      try {
        ar = a as Income;
      } catch (e) {
        ar = a as Expense;
      }
      try {
        ab = b as Income;
      } catch (e) {
        ab = b as Expense;
      }
      return ab.date.millisecondsSinceEpoch - ar.date.millisecondsSinceEpoch;
    });
    return res;
  }

  var expensed = ApiService.to.expensed.obs;
  var budget = ApiService.to.budget.obs;

  CategoryExpense getCategory(String id) =>
      listCategories.firstWhere((element) => element.id == id);

  CategoryIncome getCategoryIncome(String id) =>
      listCategoriesIncomes.firstWhere((el) => el.id == id);

  double exp(String id) => expenses
      .where((element) => element.categoryId == id)
      .fold(0, (value, element) => value += element.price);

  int transactions(String id) =>
      expenses.where((element) => element.categoryId == id).length;

  int calcBudget() {
    var result = expenses.fold(
        0.0, (previousValue, element) => previousValue + element.price);
    return result.ceil();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    expenses.value = ApiService.to.getExpenses;
    incomes.value = ApiService.to.getIncomes;
    expensed.value = ApiService.to.expensed;
    budget.value = ApiService.to.budget;
    listCategories.value = ApiService.to.getCategoryExpenses;
    listCategoriesIncomes.value = ApiService.to.getCategoryIncomes;
    super.update(ids, condition);
  }
}
