// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    userName: json['userName'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'name': instance.name,
      'password': instance.password,
      'accessToken': instance.accessToken,
    };
