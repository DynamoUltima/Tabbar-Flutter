import 'package:json_annotation/json_annotation.dart';
part 'update_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateResponse {
  String tag;
  int success;
  int error;
  String pickupPoint;

  UpdateResponse({this.error, this.success, this.tag, this.pickupPoint});

  factory UpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);
}
