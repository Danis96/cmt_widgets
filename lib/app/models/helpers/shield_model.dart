import 'package:json_annotation/json_annotation.dart';
part 'shield_model.g.dart';

@JsonSerializable()
class ShieldFilter {
  ShieldFilter({
    this.id = 0,
    this.text = '',
    this.icon = '',
    this.order = 0,
  });

  factory ShieldFilter.fromJson(dynamic json) => _$ShieldFilterFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ShieldFilterToJson(this);

  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String icon;
  @JsonKey(defaultValue: '')
  String text;
  @JsonKey(defaultValue: 0)
  int order;
}
