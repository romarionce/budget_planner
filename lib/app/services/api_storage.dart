import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/models/expense/expense.dart';
import 'package:budget_planner/app/models/income/income.dart';
import 'package:budget_planner/app/models/income_category/income_category.dart';
import 'package:budget_planner/app/services/storage_service.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  static ApiService get to => Get.find();
  final _storage = StorageService.to;

  List<Expense> get getExpenses {
    var today = DateTime.now();
    return _storage
        .getExpenses()
        .where((element) =>
            element.date.isAfter(DateTime(today.year, today.month)))
        .toList();
  }

  List<Income> get getIncomes {
    var today = DateTime.now();
    return _storage
        .getIncomes()
        .where((element) =>
            element.date.isAfter(DateTime(today.year, today.month)))
        .toList();
  }

  Future<void> removeIncome(String id) => _storage.removeIncome(id);
  Future<void> addIncome(Income income) => _storage.addIncome(income);

  List<CategoryIncome> get getCategoryIncomes => _storage.getCategoryIncome();

  Future<void> removeExpense(String id) => _storage.removeExpense(id);
  Future<void> addExpense(Expense expense) => _storage.addExpense(expense);

  List<CategoryExpense> get getCategoryExpenses =>
      _storage.getCategoryExpense();

  double get expensed => getExpenses.fold(
      0.0, (previousValue, element) => previousValue + element.price);

  double get incomed => getIncomes.fold(
      .0, (previousValue, element) => previousValue + element.price);

  double get budget => getCategoryExpenses.fold(0, (t, s) => t + s.max);

  Future<void> removeCategoryExpense(String id) =>
      _storage.removeCategoryExpense(id);

  Future<void> addCategoryExpense(CategoryExpense categoryExpense) =>
      _storage.addCategoryExpense(categoryExpense);

  Future<ApiService> init() async {
    return this;
  }
}
