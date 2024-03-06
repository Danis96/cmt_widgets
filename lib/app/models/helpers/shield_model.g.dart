// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shield_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShieldFilter _$ShieldFilterFromJson(Map<String, dynamic> json) => ShieldFilter(
      id: json['id'] as int? ?? 0,
      text: json['text'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      order: json['order'] as int? ?? 0,
    );

Map<String, dynamic> _$ShieldFilterToJson(ShieldFilter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'text': instance.text,
      'order': instance.order,
    };
