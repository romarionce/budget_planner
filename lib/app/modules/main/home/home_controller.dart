import 'package:budget_planner/app/services/api_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listCategories = ApiService.to.getCategoryExpenses;
}
