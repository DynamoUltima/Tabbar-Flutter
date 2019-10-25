// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
      tag: json['tag'] as String);
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'tag': instance.tag
    };
