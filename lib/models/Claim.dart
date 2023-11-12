import 'package:json_annotation/json_annotation.dart';

import 'Employee.dart';
import 'Item.dart';

part 'Claim.g.dart';

@JsonSerializable(explicitToJson: true)
class Claim {
  @JsonKey(required: true, name: "id")
  int id;
  @JsonKey(required: true, name: "claimant")
  Employee claimant;
  @JsonKey(required: true, name: "approver")
  Employee approver;
  @JsonKey(required: true, name: "type")
  String type;
  @JsonKey(name: "items")
  List<Item> items;
  @JsonKey(required: true, name: "currency")
  String currency;
  @JsonKey(required: true, name: "status")
  String status;

  Claim(
    this.id,
    this.claimant,
    this.approver,
    this.type,
    this.items,
    this.currency,
    this.status,
  );

  factory Claim.fromJson(Map<String, dynamic> json) => _$ClaimFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimToJson(this);
}
