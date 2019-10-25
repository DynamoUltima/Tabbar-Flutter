// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) {
  return SignUpModel(
      tag: json['tag'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      other_location: json['other_location'] as String,
      phone: json['phone'] as String,
      new_user: json['new_user'] as String,
      From: json['From'] as String,
      gcm_regid: json['gcm_regid'] as bool);
}

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'password': instance.password,
      'other_location': instance.other_location,
      'phone': instance.phone,
      'gcm_regid': instance.gcm_regid,
      'new_user': instance.new_user,
      'From': instance.From
    };
