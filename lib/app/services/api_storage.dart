import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/services/storage_service.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  static ApiService get to => Get.find();
  final _storage = StorageService.to;

  List<CategoryExpense> get getCategoryExpenses =>
      _storage.getCategoryExpense();

  Future<void> removeCategoryExpense(String id) =>
      _storage.removeCategoryExpense(id);

  Future<void> addCategoryExpense(CategoryExpense categoryExpense) =>
      _storage.addCategoryExpense(categoryExpense);

  Future<ApiService> init() async {
    return this;
  }
}
