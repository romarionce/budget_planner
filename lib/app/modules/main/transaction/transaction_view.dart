import 'package:budget_planner/app/modules/main/transaction/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionPage extends GetView<TransactionController> {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TransactionPage')),
        body: SafeArea(child: Text('TransactionController')));
  }
}
