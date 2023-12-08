import 'package:budget_planner/app/modules/main/home/home_view.dart';
import 'package:budget_planner/app/modules/main/income/income_view.dart';
import 'package:budget_planner/app/modules/main/settings/settings_view.dart';
import 'package:budget_planner/app/modules/main/transaction/transaction_view.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final _tabIndex = 0.obs;
  int get activeTab => _tabIndex.value;
  set activeTab(int index) => _tabIndex.value = index;

  var pages = [
    const HomePage(),
    const TransactionPage(),
    const IncomePage(),
    const SettingsPage(),
  ];

  List<PageItem> pageItems = [
    (icon: "home", label: 'Home'),
    (icon: "transaction", label: 'Categories'),
    (icon: "income", label: 'Income & Expenses'),
    (icon: "settings", label: 'Settings'),
  ];
}

typedef PageItem = ({
  String icon,
  String label,
});
