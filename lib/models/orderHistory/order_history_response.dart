import 'package:json_annotation/json_annotation.dart';

import 'order_history_list.dart';
part 'order_history_response.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderHistory {
  

  String tag;
  
  int success;
  
  int error;
  
  List<OrderHistoryList> order_list;

  OrderHistory({this.error,this.order_list,this.success,this.tag});

  factory OrderHistory.fromJson(Map<String, dynamic> json) => _$OrderHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$OrderHistoryToJson(this);
}