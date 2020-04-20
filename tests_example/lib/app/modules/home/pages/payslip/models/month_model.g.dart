// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthModel _$MonthModelFromJson(Map<String, dynamic> json) {
  return MonthModel(
    id: json['id'] as int,
    month: json['month'] as int,
    year: json['year'] as int,
  );
}

Map<String, dynamic> _$MonthModelToJson(MonthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'month': instance.month,
      'year': instance.year,
    };
