import 'package:tabbar/models/login/login_user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)

class LoginResponse{
  String tag;
  int success;
  int error;
  String user_id;
  User user;

  LoginResponse({this.tag, this.success, this.error, this.user_id, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  


}