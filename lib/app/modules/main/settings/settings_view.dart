import 'package:budget_planner/app/modules/main/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SettingsPage')),
        body: SafeArea(child: Text('SettingsController')));
  }
}
