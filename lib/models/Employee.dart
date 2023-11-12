import 'package:json_annotation/json_annotation.dart';

import 'Role.dart';

part 'Employee.g.dart';

@JsonSerializable(explicitToJson: true)
class Employee {
  @JsonKey(required: true)
  int id;
  @JsonKey(required: true)
  String name;
  @JsonKey(required: true)
  String department;
  @JsonKey(required: true)
  Role role;
  @JsonKey(required: true)
  String team;

  Employee(
    this.id,
    this.name,
    this.department,
    this.role,
    this.team,
  );
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
