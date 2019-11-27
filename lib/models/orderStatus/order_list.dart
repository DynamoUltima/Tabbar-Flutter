import 'package:json_annotation/json_annotation.dart';
part 'order_list.g.dart';

 @JsonSerializable(explicitToJson: true)
 class OrderList {
    
  String  server_code;
 
  String  pickup_point;
 
  String  pickup_date;
  
  String  pick_from_time;
 
  String  pick_to_time;
 
  String  note;
  
  @JsonKey(disallowNullValue: true,name:'empty2')
  String  delivery_date;
  
  String  delivery_from_time;
  
  String  delivery_to_time;
 
  String  status;

  String  assigned_to;
  
  String  promotion;
 
  String  comment;
 
  String  order_rating;
  
  String  payment;
  
  String  amount;
  
  String  payment_mode;
  
  String  fold;
  
  String  press;
  
  String  dry_clean;
 
  String  press_only;
  
  String  home_service;
  
  String  cancel_message;
  
  String  payment_status;
  
  String  receipt_url;
  
  String  created_at;
  
  String  medium;
  
  String  service_cost;
  
  String  client_name;
  
  String  client_phone;
 
  String  client_gcm;
  
  String  home_location;
  
  String  home_otherlocation;
 
  String  home_street_name;
  
  String  homeLatitude;
  
  String  home_latitude;
  
  String  home_reference;
  
  String  home_housenumber;

 OrderList({
   this.amount,
   this.assigned_to,
   this.cancel_message,
   this.client_gcm,
   this.client_name,
   this.client_phone,
   this.comment,
   this.created_at,
   this.delivery_date,
   this.delivery_from_time,
   this.delivery_to_time,
   this.dry_clean,
   this.fold,
   this.home_housenumber,
   this.home_latitude,
   this.home_location,
   this.home_otherlocation,
   this.home_reference,
   this.home_service,
   this.home_street_name,
   this.homeLatitude,
   this.medium,
   this.note,
   this.order_rating,
   this.payment,
   this.payment_mode,
   this.payment_status,
   this.pick_from_time,
   this.pick_to_time,
   this.pickup_date,
   this.pickup_point,
   this.press,
   this.press_only,
   this.promotion,
   this.receipt_url,
   this.server_code,
   this.service_cost,
  
   });

  factory OrderList.fromJson(Map<String, dynamic> json) => _$OrderListFromJson(json);
  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}