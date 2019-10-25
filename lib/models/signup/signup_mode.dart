import 'package:json_annotation/json_annotation.dart';
part 'signup_mode.g.dart';

@JsonSerializable(explicitToJson: true)
class SignUpModel{
  String tag;
  String name;
  String location;
  String email;
  String password;
  String other_location;
  String phone;
  bool gcm_regid;
  String new_user;
  String From;

  SignUpModel({this.tag,this.name,this.location,this.email,this.password,this.other_location,this.phone,this.new_user,this.From,this.gcm_regid});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => _$SignUpModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  

}