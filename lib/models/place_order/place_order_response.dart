import 'package:json_annotation/json_annotation.dart';
part 'place_order_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceOrderResponse {
  String tag;

  int success;

  int error;

  String user_id;

  bool promo;

  String promo_message;

  String gcm_result;

  String p_only;

  String press;

  String fold;

  String dryClean;

  //TODO:user_id would be used for the server_code

PlaceOrderResponse({this.dryClean,this.error,this.fold,this.gcm_result,
this.tag,this.p_only,this.press,this.promo,this.promo_message,this.success,this.user_id});

factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) => _$PlaceOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceOrderResponseToJson(this);
 

}
