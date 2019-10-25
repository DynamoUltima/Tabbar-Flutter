import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
part 'login_mode.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel{
  String email;
  String password;
  String tag;

  LoginModel({this.email,this.password,this.tag});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

}