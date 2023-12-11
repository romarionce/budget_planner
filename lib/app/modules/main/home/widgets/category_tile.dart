// ignore_for_file: deprecated_member_use

import 'package:budget_planner/app/core/theme.dart';
import 'package:budget_planner/app/models/category_expense/category_expense.dart';
import 'package:budget_planner/app/modules/main/home/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    this.spent,
    this.transactions,
    this.budget,
  });

  final CategoryExpense category;
  final double? spent;
  final int? transactions;
  final double? budget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(category.color).withOpacity(.2),
                borderRadius: BorderRadius.circular(6)),
            child: SvgPicture.asset(
              'assets/${category.icon}.svg',
              color: Color(category.color),
              width: 15,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(),
                ),
                if (transactions != null)
                  Text(
                    '$transactions transactions',
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: ColorsApp.grey2,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (spent != null)
                  Slide(per: (((spent ?? 0) / category.max) * 100).ceil()),
                const SizedBox(height: 5),
                if (budget != null) Text("$budget \$"),
                if (spent != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('$spent \$ spent',
                          style: Get.theme.textTheme.labelSmall!
                              .copyWith(color: ColorsApp.grey2)),
                      const Spacer(),
                      Text('${category.max} \$',
                          style: Get.theme.textTheme.labelSmall!
                              .copyWith(color: ColorsApp.grey2)),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
