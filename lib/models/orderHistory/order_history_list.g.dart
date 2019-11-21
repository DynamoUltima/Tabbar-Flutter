// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryList _$OrderHistoryListFromJson(Map<String, dynamic> json) {
  return OrderHistoryList(
      assign_code: json['assign_code'] as String,
      assign_email: json['assign_email'] as String,
      assign_image: json['assign_image'] as String,
      assign_name: json['assign_name'] as String,
      created_at: json['created_at'] as String,
      delivery_date: json['delivery_date'] as String,
      delivery_from_hour: json['delivery_from_hour'] as String,
      delivery_from_min: json['delivery_from_min'] as String,
      delivery_from_time: json['delivery_from_time'] as String,
      delivery_to_hour: json['delivery_to_hour'] as String,
      delivery_to_min: json['delivery_to_min'] as String,
      delivery_to_time: json['delivery_to_time'] as String,
      dry_clean: json['dry_clean'] as String,
      fold: json['fold'] as String,
      home_service: json['home_service'] as String,
      note: json['note'] as String,
      order_rating: json['order_rating'] as String,
      pick_from_time: json['pick_from_time'] as String,
      pick_to_time: json['pick_to_time'] as String,
      pick_up_date: json['pick_up_date'] as String,
      pick_up_point: json['pick_up_point'] as String,
      pickup_from_hour: json['pickup_from_hour'] as String,
      pickup_from_minute: json['pickup_from_minute'] as String,
      pickup_to_hour: json['pickup_to_hour'] as String,
      pickup_to_minute: json['pickup_to_minute'] as String,
      press: json['press'] as String,
      press_only: json['press_only'] as String,
      server_code: json['server_code'] as String,
      status: json['status'] as String,
      updated_at: json['updated_at'] as String);
}

Map<String, dynamic> _$OrderHistoryListToJson(OrderHistoryList instance) =>
    <String, dynamic>{
      'server_code': instance.server_code,
      'pick_up_point': instance.pick_up_point,
      'pick_up_date': instance.pick_up_date,
      'pick_from_time': instance.pick_from_time,
      'pick_to_time': instance.pick_to_time,
      'note': instance.note,
      'delivery_date': instance.delivery_date,
      'delivery_from_time': instance.delivery_from_time,
      'delivery_to_time': instance.delivery_to_time,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'pickup_to_hour': instance.pickup_to_hour,
      'pickup_to_minute': instance.pickup_to_minute,
      'pickup_from_hour': instance.pickup_from_hour,
      'pickup_from_minute': instance.pickup_from_minute,
      'delivery_from_hour': instance.delivery_from_hour,
      'delivery_from_min': instance.delivery_from_min,
      'delivery_to_hour': instance.delivery_to_hour,
      'delivery_to_min': instance.delivery_to_min,
      'order_rating': instance.order_rating,
      'fold': instance.fold,
      'press': instance.press,
      'dry_clean': instance.dry_clean,
      'press_only': instance.press_only,
      'home_service': instance.home_service,
      'assign_name': instance.assign_name,
      'assign_image': instance.assign_image,
      'assign_email': instance.assign_email,
      'assign_code': instance.assign_code
    };
