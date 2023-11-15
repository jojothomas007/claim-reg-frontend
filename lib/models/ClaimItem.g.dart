// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClaimItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimItem _$ClaimItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'billDate',
      'billNumber',
      'expenseCode',
      'costCenter',
      'amount',
      'subscriptionStartDate',
      'subscriptionEndDate'
    ],
  );
  return ClaimItem(
    json['id'] as int,
    ClaimItem._fromJson(json['billDate'] as String),
    json['billNumber'] as String,
    json['expenseCode'] as String,
    json['costCenter'] as int,
    (json['amount'] as num).toDouble(),
    ClaimItem._fromJson(json['subscriptionStartDate'] as String),
    ClaimItem._fromJson(json['subscriptionEndDate'] as String),
  );
}

Map<String, dynamic> _$ClaimItemToJson(ClaimItem instance) => <String, dynamic>{
      'id': instance.id,
      'billDate': ClaimItem._toJson(instance.billDate),
      'billNumber': instance.billNumber,
      'expenseCode': instance.expenseCode,
      'costCenter': instance.costCenter,
      'amount': instance.amount,
      'subscriptionStartDate':
          ClaimItem._toJson(instance.subscriptionStartDate),
      'subscriptionEndDate': ClaimItem._toJson(instance.subscriptionEndDate),
    };
