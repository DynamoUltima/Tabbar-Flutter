import 'package:json_annotation/json_annotation.dart';
part 'order_admin.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderAdmin  {
   
  String email;
  OrderAdmin({this.email});

  factory OrderAdmin.fromJson(Map<String, dynamic> json) => _$OrderAdminFromJson(json);
  Map<String, dynamic> toJson() => _$OrderAdminToJson(this);
   
}