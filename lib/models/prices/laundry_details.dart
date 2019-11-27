import 'package:json_annotation/json_annotation.dart';
part 'laundry_details.g.dart';

@JsonSerializable(explicitToJson: true)
class LaundryDetails{
   String  type_laundry;
  
  String  price;
  
  String  id;

  LaundryDetails({this.id,this.price,this.type_laundry});

 factory LaundryDetails.fromJson(Map<String, dynamic> json) => _$LaundryDetailsFromJson(json);
 Map<String, dynamic> toJson() => _$LaundryDetailsToJson(this);
  

}