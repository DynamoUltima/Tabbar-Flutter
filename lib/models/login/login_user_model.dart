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
 String homeLocation;
 String homeOtherlocation;
 String homeStreetName;
 String homeLatitude;
 String homeLongitude;
 String homeReference;
 String homeHousenumber;
 String officeLocation;
 String officeOtherlocation;
 String officeStreetName;
 int officeLatitude;
 int officeLongitude;
 String officeReference;
 String officeCompanyName;
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