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
    (icon: "home", label: 'Iniciar'),
    (icon: "transaction", label: 'Categorías'),
    (icon: "income", label: 'Ingresos y gastos'),
    (icon: "settings", label: 'Ajustes'),
  ];
}

typedef PageItem = ({
  String icon,
  String label,
});
