import 'package:budget_planner/app/services/api_storage.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var listCategories = ApiService.to.getCategoryExpenses.obs;

  @override
  void update([List<Object>? ids, bool condition = true]) {
    listCategories.value = ApiService.to.getCategoryExpenses;
    super.update(ids, condition);
  }
}
