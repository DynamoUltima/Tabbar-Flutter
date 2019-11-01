// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'empty1',
    'empty2',
    'empty3',
    'empty4',
    'empty5',
    'empty6',
    'empty7',
    'empty8',
    'empty9',
    'empty',
    'empty10',
    'empty11',
    'empty12',
    'empty13',
    'empty14'
  ]);
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
      homeLocation: json['empty1'] as String,
      homeOtherlocation: json['empty2'] as String,
      homeStreetName: json['empty3'] as String,
      homeLatitude: json['empty4'] as String,
      homeLongitude: json['empty5'] as String,
      homeReference: json['empty6'] as String,
      homeHousenumber: json['empty7'] as String,
      officeLocation: json['empty8'] as String,
      officeOtherlocation: json['empty9'] as String,
      officeStreetName: json['empty'] as String,
      officeLatitude: json['empty10'] as int,
      officeLongitude: json['empty11'] as int,
      officeReference: json['empty12'] as String,
      officeCompanyName: json['empty13'] as String,
      officeHousenumber: json['empty14'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
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
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('empty1', instance.homeLocation);
  writeNotNull('empty2', instance.homeOtherlocation);
  writeNotNull('empty3', instance.homeStreetName);
  writeNotNull('empty4', instance.homeLatitude);
  writeNotNull('empty5', instance.homeLongitude);
  writeNotNull('empty6', instance.homeReference);
  writeNotNull('empty7', instance.homeHousenumber);
  writeNotNull('empty8', instance.officeLocation);
  writeNotNull('empty9', instance.officeOtherlocation);
  writeNotNull('empty', instance.officeStreetName);
  writeNotNull('empty10', instance.officeLatitude);
  writeNotNull('empty11', instance.officeLongitude);
  writeNotNull('empty12', instance.officeReference);
  writeNotNull('empty13', instance.officeCompanyName);
  writeNotNull('empty14', instance.officeHousenumber);
  return val;
}
