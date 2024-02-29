// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WidgetModel _$WidgetModelFromJson(Map<String, dynamic> json) => WidgetModel(
      description: json['description'] as String? ?? '',
      name: json['name'] as String? ?? '',
      parameters: (json['parameters'] as List<dynamic>?)
              ?.map(ParameterModel.fromJson)
              .toList() ??
          [],
    );

Map<String, dynamic> _$WidgetModelToJson(WidgetModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'parameters': instance.parameters,
    };
