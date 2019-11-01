// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrder _$PlaceOrderFromJson(Map<String, dynamic> json) {
  return PlaceOrder(
      nameOfUser: json['nameOfUser'] as String,
      user_id: json['user_id'] as String,
      tag: json['tag'] as String,
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
      location: json['location'] as String,
      note: json['note'] as String,
      other_location: json['other_location'] as String,
      p_only: json['p_only'] as String,
      pick_from_time: json['pick_from_time'] as String,
      pick_to_time: json['pick_to_time'] as String,
      pick_up_point: json['pick_up_point'] as String,
      pickup_date: json['pickup_date'] as String,
      pickup_from_hour: json['pickup_from_hour'] as String,
      pickup_from_minute: json['pickup_from_minute'] as String,
      pickup_to_hour: json['pickup_to_hour'] as String,
      pickup_to_minute: json['pickup_to_minute'] as String,
      press: json['press'] as String,
      promo_code: json['promo_code'] as String,
      promotion: json['promotion'] as String,
      server_code: json['server_code'] as String,
      status: json['status'] as String);
}

Map<String, dynamic> _$PlaceOrderToJson(PlaceOrder instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'pick_up_point': instance.pick_up_point,
      'pickup_date': instance.pickup_date,
      'pick_from_time': instance.pick_from_time,
      'pick_to_time': instance.pick_to_time,
      'note': instance.note,
      'delivery_date': instance.delivery_date,
      'delivery_from_time': instance.delivery_from_time,
      'delivery_to_time': instance.delivery_to_time,
      'status': instance.status,
      'user_id': instance.user_id,
      'pickup_to_hour': instance.pickup_to_hour,
      'pickup_to_minute': instance.pickup_to_minute,
      'pickup_from_hour': instance.pickup_from_hour,
      'pickup_from_minute': instance.pickup_from_minute,
      'delivery_from_hour': instance.delivery_from_hour,
      'delivery_from_min': instance.delivery_from_min,
      'delivery_to_hour': instance.delivery_to_hour,
      'delivery_to_min': instance.delivery_to_min,
      'promotion': instance.promotion,
      'promo_code': instance.promo_code,
      'fold': instance.fold,
      'press': instance.press,
      'dry_clean': instance.dry_clean,
      'p_only': instance.p_only,
      'home_service': instance.home_service,
      'nameOfUser': instance.nameOfUser,
      'location': instance.location,
      'other_location': instance.other_location,
      'server_code': instance.server_code
    };
