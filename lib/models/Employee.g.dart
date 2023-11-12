// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'department', 'role', 'team'],
  );
  return Employee(
    json['id'] as int,
    json['name'] as String,
    json['department'] as String,
    Role.fromJson(json['role'] as Map<String, dynamic>),
    json['team'] as String,
  );
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'role': instance.role.toJson(),
      'team': instance.team,
    };
