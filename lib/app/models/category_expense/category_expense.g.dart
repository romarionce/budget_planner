// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryExpenseImpl _$$CategoryExpenseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryExpenseImpl(
      json['id'] as String,
      json['name'] as String,
      json['icon'] as String,
      json['color'] as int,
      (json['max'] as num).toDouble(),
    );

Map<String, dynamic> _$$CategoryExpenseImplToJson(
        _$CategoryExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'color': instance.color,
      'max': instance.max,
    };
