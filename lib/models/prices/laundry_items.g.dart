// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundry_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaundryItems _$LaundryItemsFromJson(Map<String, dynamic> json) {
  return LaundryItems(
      cartegory: json['cartegory'] as String,
      item_icon: json['item_icon'] as String,
      laundryDetails: (json['laundryDetails'] as List)
          ?.map((e) => e == null
              ? null
              : LaundryDetails.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      laundryItem: json['laundryItem'] as String);
}

Map<String, dynamic> _$LaundryItemsToJson(LaundryItems instance) =>
    <String, dynamic>{
      'laundryItem': instance.laundryItem,
      'item_icon': instance.item_icon,
      'cartegory': instance.cartegory,
      'laundryDetails':
          instance.laundryDetails?.map((e) => e?.toJson())?.toList()
    };
