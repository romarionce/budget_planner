import 'package:budget_planner/app/core/const.dart';
import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/modules/main/home/widgets/category_tile.dart';
import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/home/widgets/slide.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:budget_planner/app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your budget')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You budget for month",
                  style: Get.theme.textTheme.bodyLarge,
                ),
                Text(
                  "${(controller.budget.value - controller.expensed.value).toStringAsFixed(2)} \$",
                  style: Get.theme.textTheme.titleLarge,
                ),
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
                          var category = controller.listCategories.value[index];
                          var spent = controller.exp(category.id);
                          var transactions =
                              controller.transactions(category.id);
                          return CategoryTile(
                            category: category,
                            spent: spent,
                            transactions: transactions,
                          );
                        },
                        itemCount: controller.listCategories.value.length,
                        shrinkWrap: true,
                      )),
                ),
                const SizedBox(height: 30),
                Obx(() {
                  if (controller.expenses.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var expense = controller.expenses[index];
                        var category =
                            controller.getCategory(expense.categoryId);
                        return ListTile(
                          dense: true,
                          title: Text(category.name),
                          subtitle: Text(
                            Cnst.dFormat.format(expense.date),
                            style: TextStyle(
                                color: ColorsApp.mainText.withOpacity(.5)),
                          ),
                          leading: SvgPicture.asset(
                            'assets/${category.icon}.svg',
                            color: Color(category.color),
                            width: 15,
                          ),
                          trailing: Text(
                            '-${expense.price} \$',
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      itemCount: controller.expenses.length,
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
