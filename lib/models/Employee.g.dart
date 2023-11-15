// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'department', 'isApprover', 'team'],
  );
  return Employee(
    json['id'] as int,
    json['name'] as String,
    json['department'] as String,
    json['isApprover'] as bool,
    json['team'] as String,
  );
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'isApprover': instance.isApprover,
      'team': instance.team,
    };
