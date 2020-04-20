import 'package:json_annotation/json_annotation.dart';
part 'authentication_model.g.dart';

@JsonSerializable()
class AuthenticationModel {
  String login;
  String password;

  AuthenticationModel({this.login, this.password});

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);
}
