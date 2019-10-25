// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      name: json['name'] as String,
      email: json['email'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      other_location: json['other_location'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'phone': instance.phone,
      'location': instance.location,
      'other_location': instance.other_location
    };
