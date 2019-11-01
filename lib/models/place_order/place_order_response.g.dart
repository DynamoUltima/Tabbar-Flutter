// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderResponse _$PlaceOrderResponseFromJson(Map<String, dynamic> json) {
  return PlaceOrderResponse(
      dryClean: json['dryClean'] as String,
      error: json['error'] as int,
      fold: json['fold'] as String,
      gcm_result: json['gcm_result'] as String,
      tag: json['tag'] as String,
      p_only: json['p_only'] as String,
      press: json['press'] as String,
      promo: json['promo'] as bool,
      promo_message: json['promo_message'] as String,
      success: json['success'] as int,
      user_id: json['user_id'] as String);
}

Map<String, dynamic> _$PlaceOrderResponseToJson(PlaceOrderResponse instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'success': instance.success,
      'error': instance.error,
      'user_id': instance.user_id,
      'promo': instance.promo,
      'promo_message': instance.promo_message,
      'gcm_result': instance.gcm_result,
      'p_only': instance.p_only,
      'press': instance.press,
      'fold': instance.fold,
      'dryClean': instance.dryClean
    };
