import 'package:budget_planner/app/modules/main/home/widgets/category_tile.dart';
import 'package:budget_planner/app/modules/main/transaction/transaction_controller.dart';
import 'package:budget_planner/app/modules/main/transaction/trn_wid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorias')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => ListView.builder(
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
        ),
      ),
    );
  }
}
