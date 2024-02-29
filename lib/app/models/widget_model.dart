import 'package:cmt/app/models/parameter_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'widget_model.g.dart';

@JsonSerializable()
class WidgetModel {
  WidgetModel({
    this.description = '',
    this.name = '',
    this.parameters,
  });

  factory WidgetModel.fromJson(dynamic json) => _$WidgetModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$WidgetModelToJson(this);

  @JsonKey(name: 'name', defaultValue: '')
  String name;
  @JsonKey(name: 'description', defaultValue: '')
  String description;
  @JsonKey(name: 'parameters', defaultValue: <ParameterModel>[])
  List<ParameterModel>? parameters;
}