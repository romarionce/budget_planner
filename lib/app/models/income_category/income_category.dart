import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_category.freezed.dart';
part 'income_category.g.dart';

@freezed
class CategoryIncome with _$CategoryIncome {
  factory CategoryIncome(
    String id,
    String name,
    String icon,
    int color,
  ) = _CategoryIncome;

  factory CategoryIncome.fromJson(Map<String, dynamic> json) =>
      _$CategoryIncomeFromJson(json);
}
