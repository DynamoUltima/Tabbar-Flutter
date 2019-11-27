import 'package:json_annotation/json_annotation.dart';

import 'laundry_items.dart';
part 'price_list.g.dart';

@JsonSerializable(explicitToJson: true)
class PriceList {
  
  String  tag;
  
  int  success;
  
  int  error;
  
  List<LaundryItems>  laundryItems;

  PriceList({this.error,this.laundryItems,this.success,this.tag,});

 factory PriceList.fromJson(Map<String, dynamic> json) => _$PriceListFromJson(json);
 Map<String, dynamic> toJson() => _$PriceListToJson(this);


}