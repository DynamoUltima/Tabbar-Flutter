// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) {
  return OrderStatus(
      tag: json['tag'] as String,
      success: json['success'] as int,
      error: json['error'] as int,
      assignedFac: (json['assignedFac'] as List)
          ?.map((e) => e == null
              ? null
              : AssignedFac.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      assignees: (json['assignees'] as List)
          ?.map((e) =>
              e == null ? null : Assignees.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      order_admin: (json['order_admin'] as List)
          ?.map((e) =>
              e == null ? null : OrderAdmin.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      order_list: (json['order_list'] as List)
          ?.map((e) =>
              e == null ? null : OrderList.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$OrderStatusToJson(OrderStatus instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'success': instance.success,
      'error': instance.error,
      'order_list': instance.order_list?.map((e) => e?.toJson())?.toList(),
      'assignees': instance.assignees?.map((e) => e?.toJson())?.toList(),
      'assignedFac': instance.assignedFac?.map((e) => e?.toJson())?.toList(),
      'order_admin': instance.order_admin?.map((e) => e?.toJson())?.toList()
    };
