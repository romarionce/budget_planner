import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/modules/main/home/widgets/category_tile.dart';
import 'package:budget_planner/app/modules/main/income/income_controller.dart';
import 'package:budget_planner/app/modules/main/main_controller.dart';
import 'package:budget_planner/app/modules/main/transaction/transaction_controller.dart';
import 'package:budget_planner/app/modules/main/transaction/trn_wid.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administrar categorías')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Obx(() => Text(
                          "Presupuesto total: ${controller.budget.toString().replaceFirst('.', ',')} €",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var category = controller.listCategories[index];
                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Get.dialog(EditCatDialog(cat: category));
                          },
                          child: CategoryTile(
                            category: category,
                            budget: category.max,
                          ),
                        );
                      },
                      itemCount: controller.listCategories.length,
                      shrinkWrap: true,
                    )),
                const SizedBox(height: 20),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Tus ingresos totales"),
                        Obx(() => Text(
                              "+${controller.incomed.toString().replaceFirst('.', ',')} €",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: ColorsApp.main,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.find<MainController>().activeTab = 2;
                        Get.find<IncomeController>().curVal = 0;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.main,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Tus ingresos totales"),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Tu gasto total"),
                        Obx(() => Text(
                              "-${controller.expensed.toString().replaceFirst('.', ',')} €",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.find<MainController>().activeTab = 2;
                        Get.find<IncomeController>().curVal = 1;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Agregar Gastos"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
