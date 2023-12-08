import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_expense.freezed.dart';
part 'category_expense.g.dart';

@freezed
class CategoryExpense with _$CategoryExpense {
  factory CategoryExpense(
    String id,
    String name,
    String icon,
    int color,
    double max,
  ) = _CategoryExpense;

  factory CategoryExpense.fromJson(Map<String, dynamic> json) =>
      _$CategoryExpenseFromJson(json);
}
