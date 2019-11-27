// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundry_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaundryDetails _$LaundryDetailsFromJson(Map<String, dynamic> json) {
  return LaundryDetails(
      id: json['id'] as String,
      price: json['price'] as String,
      type_laundry: json['type_laundry'] as String);
}

Map<String, dynamic> _$LaundryDetailsToJson(LaundryDetails instance) =>
    <String, dynamic>{
      'type_laundry': instance.type_laundry,
      'price': instance.price,
      'id': instance.id
    };
