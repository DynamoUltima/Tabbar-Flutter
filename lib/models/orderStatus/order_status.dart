import 'package:json_annotation/json_annotation.dart';

import 'assigned_fac.dart';
import 'assignees.dart';
import 'order_admin.dart';
import 'order_list.dart';
part 'order_status.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderStatus  {
 
  
  String  tag;
  
  int success;
  
  int error;
  
  List<OrderList> order_list;
  
  List<Assignees> assignees;
  
  List<AssignedFac> assignedFac;
  
  List<OrderAdmin> order_admin;

  OrderStatus({this.tag,this.success,this.error,this.assignedFac,this.assignees,this.order_admin,this.order_list});


  factory OrderStatus.fromJson(Map<String, dynamic> json) => _$OrderStatusFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStatusToJson(this);
}
