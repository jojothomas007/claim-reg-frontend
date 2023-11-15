import 'package:json_annotation/json_annotation.dart';

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
  bool isApprover;
  @JsonKey(required: true)
  String team;

  Employee(
    this.id,
    this.name,
    this.department,
    this.isApprover,
    this.team,
  );
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  String toString() => name;
}
