import 'package:json_annotation/json_annotation.dart';
part 'login_user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String name;
  String email;
  String createdAt;
  String updatedAt;
  String phone;
  String location;
  String otherLocation;
  String gcmId;
  String user_code;
  String status;

  //@JsonKey(disallowNullValue: true,name:'empty1')
  String home_location;

  //@JsonKey(disallowNullValue: true,name:'empty2')
  String home_otherlocation;

//@JsonKey(disallowNullValue: true,name:'empty3')
  String home_street_name;

//  @JsonKey(disallowNullValue: true,name:'empty4')
  String home_latitude;

//  @JsonKey(disallowNullValue: true,name:'empty5')
  String home_longitude;

//  @JsonKey(disallowNullValue: true,name:'empty6')
  String home_reference;

//  @JsonKey(disallowNullValue: true,name:'empty7')
  String home_housenumber;

//  @JsonKey(disallowNullValue: true,name:'empty8')
  String office_location;

//  @JsonKey(disallowNullValue: true,name:'empty9')
  String office_otherlocation;

//  @JsonKey(disallowNullValue: true,name:'empty')
  String office_street_name;

//  @JsonKey(disallowNullValue: true,name:'empty10')
  String office_latitude;

//  @JsonKey(disallowNullValue: true,name:'empty11')
  String office_longitude;

//  @JsonKey(disallowNullValue: true,name:'empty12')
  String office_reference;

//  @JsonKey(disallowNullValue: true,name:'empty13')
  String office_company_name;

//  @JsonKey(disallowNullValue: true,name:'empty14')
  String office_housenumber;

  User(
      {this.name,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.phone,
      this.location,
      this.otherLocation,
      this.gcmId,
      this.user_code,
      this.status,
      this.home_location,
      this.home_otherlocation,
      this.home_street_name,
      this.home_latitude,
      this.home_longitude,
      this.home_reference,
      this.home_housenumber,
      this.office_location,
      this.office_otherlocation,
      this.office_street_name,
      this.office_latitude,
      this.office_longitude,
      this.office_reference,
      this.office_company_name,
      this.office_housenumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
