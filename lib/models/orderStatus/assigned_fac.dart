import 'package:json_annotation/json_annotation.dart';
part 'assigned_fac.g.dart';

@JsonSerializable(explicitToJson: true)
 class AssignedFac  {
  
  String  facility_name;
  
  String  service_type;

  AssignedFac({this.facility_name,this.service_type});

  factory AssignedFac.fromJson(Map<String, dynamic> json) => _$AssignedFacFromJson(json);
  Map<String, dynamic> toJson() => _$AssignedFacToJson(this);
}
