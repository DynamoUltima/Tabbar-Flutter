// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
      tag: json['tag'] as String,
      error: json['error'] as String,
      success: json['success'] as String,
      user_id: json['user_id'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'success': instance.success,
      'error': instance.error,
      'user_id': instance.user_id,
      'user': instance.user?.toJson()
    };
