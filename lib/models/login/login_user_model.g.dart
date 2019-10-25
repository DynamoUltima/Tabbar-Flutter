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
      userCode: json['userCode'] as String,
      status: json['status'] as String,
      homeLocation: json['homeLocation'] as String,
      homeOtherlocation: json['homeOtherlocation'] as String,
      homeStreetName: json['homeStreetName'] as String,
      homeLatitude: json['homeLatitude'] as String,
      homeLongitude: json['homeLongitude'] as String,
      homeReference: json['homeReference'] as String,
      homeHousenumber: json['homeHousenumber'] as String,
      officeLocation: json['officeLocation'] as String,
      officeOtherlocation: json['officeOtherlocation'] as String,
      officeStreetName: json['officeStreetName'] as String,
      officeLatitude: json['officeLatitude'] as int,
      officeLongitude: json['officeLongitude'] as int,
      officeReference: json['officeReference'] as String,
      officeCompanyName: json['officeCompanyName'] as String,
      officeHousenumber: json['officeHousenumber'] as int);
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
      'userCode': instance.userCode,
      'status': instance.status,
      'homeLocation': instance.homeLocation,
      'homeOtherlocation': instance.homeOtherlocation,
      'homeStreetName': instance.homeStreetName,
      'homeLatitude': instance.homeLatitude,
      'homeLongitude': instance.homeLongitude,
      'homeReference': instance.homeReference,
      'homeHousenumber': instance.homeHousenumber,
      'officeLocation': instance.officeLocation,
      'officeOtherlocation': instance.officeOtherlocation,
      'officeStreetName': instance.officeStreetName,
      'officeLatitude': instance.officeLatitude,
      'officeLongitude': instance.officeLongitude,
      'officeReference': instance.officeReference,
      'officeCompanyName': instance.officeCompanyName,
      'officeHousenumber': instance.officeHousenumber
    };
