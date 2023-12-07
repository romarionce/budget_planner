import 'package:budget_planner/app/modules/main/widgets/navbar_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => IndexedStack(
              index: controller.activeTab,
              children: controller.pages,
            )),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.activeTab,
            onTap: (index) => controller.activeTab = index,
            items: controller.pageItems
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: NavbarItem(icon: e.icon),
                    activeIcon: NavbarItem(icon: e.icon, isActive: true),
                    label: e.label,
                  ),
                )
                .toList(),
          )),
    );
  }
}
