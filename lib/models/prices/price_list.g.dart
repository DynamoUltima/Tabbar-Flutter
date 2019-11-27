// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceList _$PriceListFromJson(Map<String, dynamic> json) {
  return PriceList(
      error: json['error'] as int,
      laundryItems: (json['laundryItems'] as List)
          ?.map((e) => e == null
              ? null
              : LaundryItems.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      success: json['success'] as int,
      tag: json['tag'] as String);
}

Map<String, dynamic> _$PriceListToJson(PriceList instance) => <String, dynamic>{
      'tag': instance.tag,
      'success': instance.success,
      'error': instance.error,
      'laundryItems': instance.laundryItems?.map((e) => e?.toJson())?.toList()
    };
