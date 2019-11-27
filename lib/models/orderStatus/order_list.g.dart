// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['empty2']);
  return OrderList(
      amount: json['amount'] as String,
      assigned_to: json['assigned_to'] as String,
      cancel_message: json['cancel_message'] as String,
      client_gcm: json['client_gcm'] as String,
      client_name: json['client_name'] as String,
      client_phone: json['client_phone'] as String,
      comment: json['comment'] as String,
      created_at: json['created_at'] as String,
      delivery_date: json['empty2'] as String,
      delivery_from_time: json['delivery_from_time'] as String,
      delivery_to_time: json['delivery_to_time'] as String,
      dry_clean: json['dry_clean'] as String,
      fold: json['fold'] as String,
      home_housenumber: json['home_housenumber'] as String,
      home_latitude: json['home_latitude'] as String,
      home_location: json['home_location'] as String,
      home_otherlocation: json['home_otherlocation'] as String,
      home_reference: json['home_reference'] as String,
      home_service: json['home_service'] as String,
      home_street_name: json['home_street_name'] as String,
      homeLatitude: json['homeLatitude'] as String,
      medium: json['medium'] as String,
      note: json['note'] as String,
      order_rating: json['order_rating'] as String,
      payment: json['payment'] as String,
      payment_mode: json['payment_mode'] as String,
      payment_status: json['payment_status'] as String,
      pick_from_time: json['pick_from_time'] as String,
      pick_to_time: json['pick_to_time'] as String,
      pickup_date: json['pickup_date'] as String,
      pickup_point: json['pickup_point'] as String,
      press: json['press'] as String,
      press_only: json['press_only'] as String,
      promotion: json['promotion'] as String,
      receipt_url: json['receipt_url'] as String,
      server_code: json['server_code'] as String,
      service_cost: json['service_cost'] as String)
    ..status = json['status'] as String;
}

Map<String, dynamic> _$OrderListToJson(OrderList instance) {
  final val = <String, dynamic>{
    'server_code': instance.server_code,
    'pickup_point': instance.pickup_point,
    'pickup_date': instance.pickup_date,
    'pick_from_time': instance.pick_from_time,
    'pick_to_time': instance.pick_to_time,
    'note': instance.note,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('empty2', instance.delivery_date);
  val['delivery_from_time'] = instance.delivery_from_time;
  val['delivery_to_time'] = instance.delivery_to_time;
  val['status'] = instance.status;
  val['assigned_to'] = instance.assigned_to;
  val['promotion'] = instance.promotion;
  val['comment'] = instance.comment;
  val['order_rating'] = instance.order_rating;
  val['payment'] = instance.payment;
  val['amount'] = instance.amount;
  val['payment_mode'] = instance.payment_mode;
  val['fold'] = instance.fold;
  val['press'] = instance.press;
  val['dry_clean'] = instance.dry_clean;
  val['press_only'] = instance.press_only;
  val['home_service'] = instance.home_service;
  val['cancel_message'] = instance.cancel_message;
  val['payment_status'] = instance.payment_status;
  val['receipt_url'] = instance.receipt_url;
  val['created_at'] = instance.created_at;
  val['medium'] = instance.medium;
  val['service_cost'] = instance.service_cost;
  val['client_name'] = instance.client_name;
  val['client_phone'] = instance.client_phone;
  val['client_gcm'] = instance.client_gcm;
  val['home_location'] = instance.home_location;
  val['home_otherlocation'] = instance.home_otherlocation;
  val['home_street_name'] = instance.home_street_name;
  val['homeLatitude'] = instance.homeLatitude;
  val['home_latitude'] = instance.home_latitude;
  val['home_reference'] = instance.home_reference;
  val['home_housenumber'] = instance.home_housenumber;
  return val;
}
