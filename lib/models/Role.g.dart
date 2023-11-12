// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name'],
  );
  return Role(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
