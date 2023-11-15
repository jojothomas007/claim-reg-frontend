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
    $enumDecode(_$ClaimTypeEnumMap, json['type']),
    (json['items'] as List<dynamic>)
        .map((e) => ClaimItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    $enumDecode(_$CurrencyEnumMap, json['currency']),
    $enumDecode(_$ClaimStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$ClaimToJson(Claim instance) => <String, dynamic>{
      'id': instance.id,
      'claimant': instance.claimant.toJson(),
      'approver': instance.approver.toJson(),
      'type': _$ClaimTypeEnumMap[instance.type]!,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'status': _$ClaimStatusEnumMap[instance.status]!,
    };

const _$ClaimTypeEnumMap = {
  ClaimType.internet: 'internet',
};

const _$CurrencyEnumMap = {
  Currency.INR: 'INR',
};

const _$ClaimStatusEnumMap = {
  ClaimStatus.created: 'created',
  ClaimStatus.submitted: 'submitted',
  ClaimStatus.approved: 'approved',
};
