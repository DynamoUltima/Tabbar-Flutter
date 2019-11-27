import 'package:json_annotation/json_annotation.dart';

import 'laundry_details.dart';
part 'laundry_items.g.dart';

@JsonSerializable(explicitToJson: true)
class LaundryItems{
  
  String  laundryItem;
  
  String  item_icon;
  
  String  cartegory;
  
  List<LaundryDetails>  laundryDetails;

  LaundryItems({this.cartegory,this.item_icon,this.laundryDetails,this.laundryItem});

  factory LaundryItems.fromJson(Map<String, dynamic> json) => _$LaundryItemsFromJson(json);
 Map<String, dynamic> toJson() => _$LaundryItemsToJson(this);

  


}