import 'package:budget_planner/app/core/const.dart';
import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/models/expense/expense.dart';
import 'package:budget_planner/app/models/income/income.dart';
import 'package:budget_planner/app/modules/main/home/widgets/category_tile.dart';
import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/home/widgets/slide.dart';
import 'package:budget_planner/app/modules/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Su presupuesto')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Tu presupuesto para el mes",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.find<MainController>().activeTab = 1;
                        },
                        icon: const Icon(Icons.edit))
                  ],
                ),
                Obx(() => Text(
                      "${(controller.budget.value - controller.expensed.value).toStringAsFixed(2).replaceFirst('.', ',')} €",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Slide(
                        per: (controller.expensed.value /
                                controller.budget.value *
                                100)
                            .ceil(),
                        height: 8),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.grey2.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(() => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var category = controller.listCategories[index];
                          var spent = controller.exp(category.id);
                          var transactions =
                              controller.transactions(category.id);
                          return CategoryTile(
                            category: category,
                            spent: spent,
                            transactions: transactions,
                          );
                        },
                        itemCount: controller.listCategories.length,
                        shrinkWrap: true,
                      )),
                ),
                const SizedBox(height: 30),
                Obx(() {
                  if (controller.operations.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var operation = controller.operations[index];
                        var category;
                        switch (operation.runtimeType.toString()) {
                          case '_\$ExpenseImpl':
                            category =
                                controller.getCategory(operation.categoryId);
                            break;
                          case '_\$IncomeImpl':
                            category = controller
                                .getCategoryIncome(operation.categoryId);
                            break;
                          default:
                            print("OEOE");
                        }
                        return ListTile(
                          dense: true,
                          title: Text(category?.name),
                          subtitle: Text(
                            Cnst.dFormat.format(operation.date),
                          ),
                          leading: SvgPicture.asset(
                            'assets/${category.icon}.svg',
                            color: Color(category.color),
                            width: 15,
                          ),
                          trailing: Text(
                            '${operation is Income ? '' : '-'}${operation.price.toString().replaceFirst('.', ',')} €',
                            style: TextStyle(
                              color: operation is Income
                                  ? Colors.green
                                  : Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      itemCount: controller.operations.length,
                    );
                  }
                  return const SizedBox();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
