import 'package:freezed_annotation/freezed_annotation.dart';

part 'income.freezed.dart';
part 'income.g.dart';

@freezed
class Income with _$Income {
  factory Income(
    String id,
    String categoryId,
    DateTime date,
    double price,
  ) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
}
