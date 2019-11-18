// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assignees _$AssigneesFromJson(Map<String, dynamic> json) {
  return Assignees(
      email: json['email'] as String,
      gender: json['gender'] as String,
      hey_code: json['hey_code'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String);
}

Map<String, dynamic> _$AssigneesToJson(Assignees instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'hey_code': instance.hey_code,
      'gender': instance.gender
    };
