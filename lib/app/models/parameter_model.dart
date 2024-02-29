import 'package:json_annotation/json_annotation.dart';

part 'parameter_model.g.dart';

@JsonSerializable()
class ParameterModel {
  ParameterModel({
    this.description = '',
    this.name = '',
    this.type = '',
  });

  factory ParameterModel.fromJson(dynamic json) => _$ParameterModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ParameterModelToJson(this);

  @JsonKey(name: 'name', defaultValue: '')
  String name;
  @JsonKey(name: 'description', defaultValue: '')
  String description;
  @JsonKey(name: 'type', defaultValue: '')
  String type;
}