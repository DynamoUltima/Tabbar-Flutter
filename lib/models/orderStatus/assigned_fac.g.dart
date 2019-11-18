// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_fac.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedFac _$AssignedFacFromJson(Map<String, dynamic> json) {
  return AssignedFac(
      facility_name: json['facility_name'] as String,
      service_type: json['service_type'] as String);
}

Map<String, dynamic> _$AssignedFacToJson(AssignedFac instance) =>
    <String, dynamic>{
      'facility_name': instance.facility_name,
      'service_type': instance.service_type
    };
