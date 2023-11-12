import 'package:json_annotation/json_annotation.dart';

part 'Item.g.dart';

@JsonSerializable()
class Item {
  @JsonKey(required: true)
  int id;
  @JsonKey(required: true)
  DateTime billDate;
  @JsonKey(required: true)
  String billNumber;
  @JsonKey(required: true)
  String expenseCode;
  @JsonKey(required: true)
  int costCenter;
  @JsonKey(required: true)
  int amount;
  @JsonKey(required: true)
  DateTime subscriptionStartDate;
  @JsonKey(required: true)
  DateTime subscriptionEndDate;

  Item(
    this.id,
    this.billDate,
    this.billNumber,
    this.expenseCode,
    this.costCenter,
    this.amount,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
  );
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
