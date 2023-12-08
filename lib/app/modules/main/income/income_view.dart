import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/modules/main/income/income_controller.dart';
import 'package:budget_planner/app/services/api_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IncomePage extends GetView<IncomeController> {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add transaction')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Obx(
                  () => AnimatedToggleSwitch.size(
                    // borderWidth: 20,
                    indicatorSize: const Size.fromWidth(150),
                    current: controller.curVal,
                    values: const [0, 1],
                    onChanged: (value) => controller.curVal = value,
                    iconBuilder: (value) {
                      var isActive = value == controller.curVal;
                      return Text(
                        controller.items[value],
                        style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : const Color.fromARGB(255, 109, 109, 109)),
                      );
                    },
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      indicatorColor: ColorsApp.main,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Enter amount",
                style: Get.theme.textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
              const TextField(),
              const SizedBox(height: 30),
              Text(
                "Date",
                style: Get.theme.textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [],
              ),
              Text(
                "Category",
                style: Get.theme.textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                width: 400,
                child: GridView.builder(
                  itemCount: ApiService.to.getCategoryExpenses.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      var category = ApiService.to.getCategoryExpenses[index];
                      var isActive = controller.activeCat == index;
                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          controller.activeCat = index;
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(category.color).withOpacity(.2),
                            borderRadius: BorderRadius.circular(8),
                            border: isActive
                                ? Border.all(color: Color(category.color))
                                : null,
                          ),
                          child: SvgPicture.asset(
                            'assets/${category.icon}.svg',
                            width: 10,
                            height: 20,
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
