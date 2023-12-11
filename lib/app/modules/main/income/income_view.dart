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
        child: SingleChildScrollView(
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
                      // onChanged: (value) => controller.curVal = value,
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
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.amountCtrl,
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  decoration: const InputDecoration(
                    prefixIcon: IconButton(
                      icon: Text(
                        "\$",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Date",
                  style: Get.theme.textTheme.titleLarge!.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Obx(() => Row(
                      children: [
                        InkWell(
                          onTap: () => controller.setToday(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.4),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: controller.isToday
                                      ? Colors.black
                                      : Colors.transparent,
                                )),
                            child: const Text("Today"),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => controller.setYesterDay(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.4),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: !controller.isToday
                                      ? Colors.black
                                      : Colors.transparent,
                                )),
                            child: const Text("Yesterday"),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Category",
                  style: Get.theme.textTheme.titleLarge!.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                  ),
                  width: 400,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ApiService.to.getCategoryExpenses.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
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
                              color: Color(category.color),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        icon: const Icon(Icons.replay),
                        onPressed: () => controller.reset(),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                        ),
                        label: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: FilledButton.icon(
                        icon: const Icon(Icons.add),
                        onPressed: () => controller.addTransaction(),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: ColorsApp.main,
                          foregroundColor: Colors.white,
                        ),
                        label: const Text('Add transaction'),
                      ),
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
