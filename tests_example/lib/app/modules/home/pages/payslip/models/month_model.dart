import 'package:json_annotation/json_annotation.dart';

part 'month_model.g.dart';

@JsonSerializable()
class MonthModel {
  int id;
  int month;
  int year;

  MonthModel({this.id = 0, this.month, this.year});

  String monthFormated() {
    return month.toString().padLeft(2, '0');
  }

  factory MonthModel.fromJson(Map<String, dynamic> json) =>
      _$MonthModelFromJson(json);
  Map<String, dynamic> toJson() => _$MonthModelToJson(this);
}
