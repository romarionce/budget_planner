import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/modules/main/home/widgets/category_tile.dart';
import 'package:budget_planner/app/modules/main/home/home_controller.dart';
import 'package:budget_planner/app/modules/main/home/widgets/slide.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You budget for today",
                style: Get.theme.textTheme.bodyLarge,
              ),
              Text(
                "10 000 \$",
                style: Get.theme.textTheme.titleLarge,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Slide(per: 25, height: 8),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: ColorsApp.grey2.withOpacity(.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var category = controller.listCategories[index];
                    return CategoryTile(category: category);
                  },
                  itemCount: controller.listCategories.length,
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
