import 'package:json_annotation/json_annotation.dart';

part 'DocField.g.dart';

@JsonSerializable()
class DocField {
  @JsonKey(required: true)
  String key;
  @JsonKey(required: true)
  String value;
  @JsonKey(required: true)
  double confidence;

  DocField(
    this.key,
    this.value,
    this.confidence,
  );

  factory DocField.fromJson(Map<String, dynamic> json) =>
      _$DocFieldFromJson(json);

  Map<String, dynamic> toJson() => _$DocFieldToJson(this);
}
