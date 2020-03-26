// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) {
  return UpdateResponse(
      error: json['error'] as int,
      success: json['success'] as int,
      tag: json['tag'] as String,
      pickupPoint: json['pickupPoint'] as String);
}

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'success': instance.success,
      'error': instance.error,
      'pickupPoint': instance.pickupPoint
    };
