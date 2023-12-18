// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncomeImpl _$$IncomeImplFromJson(Map<String, dynamic> json) => _$IncomeImpl(
      json['id'] as String,
      json['categoryId'] as String,
      DateTime.parse(json['date'] as String),
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$IncomeImplToJson(_$IncomeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
    };
