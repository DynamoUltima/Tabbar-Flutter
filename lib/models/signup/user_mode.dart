import 'package:json_annotation/json_annotation.dart';
part 'user_mode.g.dart';

@JsonSerializable(explicitToJson: true)
class User{
  String name;
  String email;
  String created_at;
  String updated_at;
  String phone;
  String location;
  String other_location;

  User({this.name,this.email,this.created_at,this.updated_at,this.phone,this.location,this.other_location});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}