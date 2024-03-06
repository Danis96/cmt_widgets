// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterModel _$ParameterModelFromJson(Map<String, dynamic> json) =>
    ParameterModel(
      description: json['description'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ParameterModelToJson(ParameterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
    };
