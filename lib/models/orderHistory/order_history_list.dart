import 'package:json_annotation/json_annotation.dart';
part 'order_history_list.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderHistoryList {
     
  String  server_code;
  
  String  pick_up_point;
  
  String  pick_up_date;
  
  String  pick_from_time;
  
  String  pick_to_time;
  
  String  note;
  
  String  delivery_date;
  
  String  delivery_from_time;
  
  String  delivery_to_time;
  
  String  status;
  
  String  created_at;
  
  String  updated_at;
  
  String  pickup_to_hour;
  
  String  pickup_to_minute;
  
  String  pickup_from_hour;
 
  String  pickup_from_minute;
  
  String  delivery_from_hour;
  
  String  delivery_from_min;
  
  String  delivery_to_hour;
  
  String  delivery_to_min;
  
  String  order_rating;
 
  String  fold;
 
  String  press;
  
  String  dry_clean;
  
  String  press_only;
  
  String  home_service;
  
  String  assign_name;
  
  String  assign_image;
  
  String  assign_email;
  
  String  assign_code;

  OrderHistoryList({
  this.assign_code,
  this.assign_email,
  this.assign_image,
  this.assign_name,
  this.created_at,
  this.delivery_date,
  this.delivery_from_hour,
  this.delivery_from_min,
  this.delivery_from_time,
  this.delivery_to_hour,
  this.delivery_to_min,
  this.delivery_to_time,
  this.dry_clean,
  this.fold,
  this.home_service,
  this.note,
  this.order_rating,
  this.pick_from_time,
  this.pick_to_time,
  this.pick_up_date,
  this.pick_up_point,
  this.pickup_from_hour,
  this.pickup_from_minute,
  this.pickup_to_hour,
  this.pickup_to_minute,
  this.press,
  this.press_only,
  this.server_code,
  this.status,
  this.updated_at
  });

  factory OrderHistoryList.fromJson(Map<String, dynamic> json) => _$OrderHistoryListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderHistoryListToJson(this);
  
}