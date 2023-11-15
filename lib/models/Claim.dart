import 'package:json_annotation/json_annotation.dart';

import '../enums/claim_status.dart';
import '../enums/claim_type.dart';
import '../enums/currency.dart';
import 'ClaimItem.dart';
import 'Employee.dart';

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
  ClaimType type;
  @JsonKey(name: "items")
  List<ClaimItem> items;
  @JsonKey(required: true, name: "currency")
  Currency currency;
  @JsonKey(required: true, name: "status")
  ClaimStatus status;

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
