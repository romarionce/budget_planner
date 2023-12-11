import 'package:budget_planner/app/modules/main/settings/settings_controller.dart';
import 'package:budget_planner/app/modules/main/settings/widgets/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ajustes')),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SettingsTile(
                  fun: () {}, asset: 'share', text: "Share with friends"),
              SettingsTile(
                  fun: controller.switchTheme,
                  asset: 'theme',
                  text: "Switch theme"),
              SettingsTile(
                  fun: () {}, asset: 'rate', text: "Rate in the App Store"),
              SettingsTile(
                  fun: controller.clearStorage,
                  asset: 'logout',
                  text: "Clear app data"),
            ],
          ),
        )));
  }
}
