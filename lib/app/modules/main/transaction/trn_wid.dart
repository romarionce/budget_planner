import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/transaction/transaction_controller.dart';
import 'package:budget_planner/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCatDialog extends StatefulWidget {
  const EditCatDialog({super.key, required this.cat});
  final CategoryExpense cat;

  @override
  State<EditCatDialog> createState() => _EditCatDialogState();
}

class _EditCatDialogState extends State<EditCatDialog> {
  final tctrl = TextEditingController(text: '');

  @override
  void initState() {
    tctrl.text = widget.cat.max.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 200,
        height: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: tctrl,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () async {
                    await StorageService.to.removeExpense(widget.cat.id);
                    var newCat = widget.cat
                        .copyWith(max: double.tryParse(tctrl.text) ?? 100);
                    await StorageService.to.addCategoryExpense(newCat);
                    Get.find<TransactionController>().update();
                    Get.find<HomeController>().update();
                    Get.back();
                  },
                  style:
                      FilledButton.styleFrom(backgroundColor: ColorsApp.main),
                  child: const Text("Ok"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
