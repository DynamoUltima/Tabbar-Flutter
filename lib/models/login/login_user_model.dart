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
  String userCode;
  String status;

 @JsonKey(disallowNullValue: true,name:'empty1')
 String homeLocation;

 @JsonKey(disallowNullValue: true,name:'empty2')
 String homeOtherlocation;

 @JsonKey(disallowNullValue: true,name:'empty3')
 String homeStreetName;

 @JsonKey(disallowNullValue: true,name:'empty4')
 String homeLatitude;

 @JsonKey(disallowNullValue: true,name:'empty5')
 String homeLongitude;

 @JsonKey(disallowNullValue: true,name:'empty6')
 String homeReference;

 @JsonKey(disallowNullValue: true,name:'empty7')
 String homeHousenumber;

 @JsonKey(disallowNullValue: true,name:'empty8')
 String officeLocation;

 @JsonKey(disallowNullValue: true,name:'empty9')
 String officeOtherlocation;

 @JsonKey(disallowNullValue: true,name:'empty')
 String officeStreetName;

 @JsonKey(disallowNullValue: true,name:'empty10')
 int officeLatitude;

 @JsonKey(disallowNullValue: true,name:'empty11')
 int officeLongitude;

 @JsonKey(disallowNullValue: true,name:'empty12')
 String officeReference;

 @JsonKey(disallowNullValue: true,name:'empty13')
 String officeCompanyName;

 @JsonKey(disallowNullValue: true,name:'empty14')
 int officeHousenumber;

  User(
      {this.name,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.phone,
      this.location,
      this.otherLocation,
      this.gcmId,
      this.userCode,
      this.status,
      this.homeLocation,
      this.homeOtherlocation,
      this.homeStreetName,
      this.homeLatitude,
      this.homeLongitude,
      this.homeReference,
      this.homeHousenumber,
      this.officeLocation,
      this.officeOtherlocation,
      this.officeStreetName,
      this.officeLatitude,
      this.officeLongitude,
      this.officeReference,
      this.officeCompanyName,
      this.officeHousenumber});


      factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
      Map<String, dynamic> toJson() => _$UserToJson(this);
      
      
      
      }