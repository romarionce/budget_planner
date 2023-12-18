import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/main_controller.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var listCategories = ApiService.to.getCategoryExpenses.obs;
  var listCategoriesIncome = ApiService.to.getCategoryIncomes.obs;

  var budget = ApiService.to.budget.obs;
  var expensed = ApiService.to.expensed.obs;
  var incomed = ApiService.to.incomed.obs;

  @override
  void update([List<Object>? ids, bool condition = true]) {
    expensed.value = ApiService.to.expensed;
    incomed.value = ApiService.to.incomed;
    budget.value = ApiService.to.budget;
    listCategories.value = ApiService.to.getCategoryExpenses;
    listCategoriesIncome.value = ApiService.to.getCategoryIncomes;
    Get.find<HomeController>().update();
    super.update(ids, condition);
  }
}
