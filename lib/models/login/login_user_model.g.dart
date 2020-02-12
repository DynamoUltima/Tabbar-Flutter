// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      otherLocation: json['otherLocation'] as String,
      gcmId: json['gcmId'] as String,
      user_code: json['user_code'] as String,
      status: json['status'] as String,
      home_location: json['home_location'] as String,
      home_otherlocation: json['home_otherlocation'] as String,
      home_street_name: json['home_street_name'] as String,
      home_latitude: json['home_latitude'] as String,
      home_longitude: json['home_longitude'] as String,
      home_reference: json['home_reference'] as String,
      home_housenumber: json['home_housenumber'] as String,
      office_location: json['office_location'] as String,
      office_otherlocation: json['office_otherlocation'] as String,
      office_street_name: json['office_street_name'] as String,
      office_latitude: json['office_latitude'] as String,
      office_longitude: json['office_longitude'] as String,
      office_reference: json['office_reference'] as String,
      office_company_name: json['office_company_name'] as String,
      office_housenumber: json['office_housenumber'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'phone': instance.phone,
      'location': instance.location,
      'otherLocation': instance.otherLocation,
      'gcmId': instance.gcmId,
      'user_code': instance.user_code,
      'status': instance.status,
      'home_location': instance.home_location,
      'home_otherlocation': instance.home_otherlocation,
      'home_street_name': instance.home_street_name,
      'home_latitude': instance.home_latitude,
      'home_longitude': instance.home_longitude,
      'home_reference': instance.home_reference,
      'home_housenumber': instance.home_housenumber,
      'office_location': instance.office_location,
      'office_otherlocation': instance.office_otherlocation,
      'office_street_name': instance.office_street_name,
      'office_latitude': instance.office_latitude,
      'office_longitude': instance.office_longitude,
      'office_reference': instance.office_reference,
      'office_company_name': instance.office_company_name,
      'office_housenumber': instance.office_housenumber
    };
