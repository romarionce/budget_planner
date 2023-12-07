import 'package:budget_planner/app/modules/main/income/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomePage extends GetView<IncomeController> {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('IncomePage')),
        body: SafeArea(child: Text('IncomeController')));
  }
}
