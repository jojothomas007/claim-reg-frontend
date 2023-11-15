// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DocField.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocField _$DocFieldFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['key', 'value', 'confidence'],
  );
  return DocField(
    json['key'] as String,
    json['value'] as String,
    (json['confidence'] as num).toDouble(),
  );
}

Map<String, dynamic> _$DocFieldToJson(DocField instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'confidence': instance.confidence,
    };
