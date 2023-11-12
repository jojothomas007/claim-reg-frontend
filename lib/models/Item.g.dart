// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
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
  return Item(
    json['id'] as int,
    DateTime.parse(json['billDate'] as String),
    json['billNumber'] as String,
    json['expenseCode'] as String,
    json['costCenter'] as int,
    json['amount'] as int,
    DateTime.parse(json['subscriptionStartDate'] as String),
    DateTime.parse(json['subscriptionEndDate'] as String),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'billDate': instance.billDate.toIso8601String(),
      'billNumber': instance.billNumber,
      'expenseCode': instance.expenseCode,
      'costCenter': instance.costCenter,
      'amount': instance.amount,
      'subscriptionStartDate': instance.subscriptionStartDate.toIso8601String(),
      'subscriptionEndDate': instance.subscriptionEndDate.toIso8601String(),
    };
