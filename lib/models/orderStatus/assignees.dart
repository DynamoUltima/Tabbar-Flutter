
import 'package:json_annotation/json_annotation.dart';
part 'assignees.g.dart';

@JsonSerializable(explicitToJson: true)
class Assignees  {
  String  name;
  
  String  email;
  
  String  phone;
  
  String  image;
  
  String  hey_code;
  
  String  gender;

  Assignees({this.email,this.gender,this.hey_code,this.image,this.name,this.phone,});

  factory Assignees.fromJson(Map<String, dynamic> json) => _$AssigneesFromJson(json);
  Map<String, dynamic> toJson() => _$AssigneesToJson(this);
}