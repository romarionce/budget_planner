import 'package:get/get.dart';

class IncomeController extends GetxController {
  final _curVal = 0.obs;

  int get curVal => _curVal.value;
  set curVal(int i) => _curVal.value = i;

  List<String> items = ['Income', 'Expenses'];

  final _activeCategory = 0.obs;
  int get activeCat => _activeCategory.value;
  set activeCat(i) => _activeCategory.value = i;
}
