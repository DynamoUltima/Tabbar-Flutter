import 'package:json_annotation/json_annotation.dart';
part 'place_order.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceOrder {
  String tag;
  String pick_up_point;
  String pickup_date;
  String pick_from_time;
  String pick_to_time;
  String note;
  String delivery_date;
  String delivery_from_time;
  String delivery_to_time;
  String status;
  String user_id;
  String pickup_to_hour;
  String pickup_to_minute;
  String pickup_from_hour;
  String pickup_from_minute;
  String delivery_from_hour;
  String delivery_from_min;
  String delivery_to_hour;
  String delivery_to_min;
  String promotion;
  String promo_code;
  String fold;
  String press;
  String dry_clean;
  String p_only;
  String home_service;
  String nameOfUser;
  String location;
  String other_location;
  String server_code;

  //TODO: Note that user_id is the email and would soon have email and json key user_id

  PlaceOrder(
      {this.nameOfUser,
      this.user_id,
      this.tag,
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
      this.location,
      this.note,
      this.other_location,
      this.p_only,
      this.pick_from_time,
      this.pick_to_time,
      this.pick_up_point,
      this.pickup_date,
      this.pickup_from_hour,
      this.pickup_from_minute,
      this.pickup_to_hour,
      this.pickup_to_minute,
      this.press,
      this.promo_code,
      this.promotion,
      this.server_code,
      this.status});


 factory PlaceOrder.fromJson(Map<String, dynamic> json) => _$PlaceOrderFromJson(json);
 Map<String, dynamic> toJson() => _$PlaceOrderToJson(this);

}
