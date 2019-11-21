// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return OrderHistory(
      error: json['error'] as int,
      order_list: (json['order_list'] as List)
          ?.map((e) => e == null
              ? null
              : OrderHistoryList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      success: json['success'] as int,
      tag: json['tag'] as String);
}

Map<String, dynamic> _$OrderHistoryToJson(OrderHistory instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'success': instance.success,
      'error': instance.error,
      'order_list': instance.order_list?.map((e) => e?.toJson())?.toList()
    };
