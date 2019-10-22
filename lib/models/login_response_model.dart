import 'package:json_annotation/json_annotation.dart';
import 'package:tabbar/models/user_mode.dart';
part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true)

class LoginResponse{
  String tag;
  String success;
  String error;
  String user_id;
  User user;

  LoginResponse({this.tag,this.error,this.success,this.user_id,this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}