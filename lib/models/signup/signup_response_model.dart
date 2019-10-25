import 'package:json_annotation/json_annotation.dart';
import 'package:tabbar/models/signup/user_mode.dart';

part 'signup_response_model.g.dart';

@JsonSerializable(explicitToJson: true)

class SignUpResponse{
  String tag;
  String success;
  String error;
  String user_id;
  User user;

  SignUpResponse({this.tag,this.error,this.success,this.user_id,this.user});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

}