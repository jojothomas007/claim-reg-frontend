// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Claim _$ClaimFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'claimant',
      'approver',
      'type',
      'currency',
      'status'
    ],
  );
  return Claim(
    json['id'] as int,
    Employee.fromJson(json['claimant'] as Map<String, dynamic>),
    Employee.fromJson(json['approver'] as Map<String, dynamic>),
    json['type'] as String,
    (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['currency'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$ClaimToJson(Claim instance) => <String, dynamic>{
      'id': instance.id,
      'claimant': instance.claimant.toJson(),
      'approver': instance.approver.toJson(),
      'type': instance.type,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'currency': instance.currency,
      'status': instance.status,
    };
