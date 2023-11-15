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
    Item._fromJson(json['billDate'] as String),
    json['billNumber'] as String,
    json['expenseCode'] as String,
    json['costCenter'] as int,
    json['amount'] as int,
    Item._fromJson(json['subscriptionStartDate'] as String),
    Item._fromJson(json['subscriptionEndDate'] as String),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'billDate': Item._toJson(instance.billDate),
      'billNumber': instance.billNumber,
      'expenseCode': instance.expenseCode,
      'costCenter': instance.costCenter,
      'amount': instance.amount,
      'subscriptionStartDate': Item._toJson(instance.subscriptionStartDate),
      'subscriptionEndDate': Item._toJson(instance.subscriptionEndDate),
    };
