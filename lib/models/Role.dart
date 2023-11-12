import 'package:json_annotation/json_annotation.dart';

part 'Role.g.dart';

@JsonSerializable()
class Role {
  @JsonKey(required: true)
  int id;
  @JsonKey(required: true)
  String name;

  Role(
    this.id,
    this.name,
  );
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
