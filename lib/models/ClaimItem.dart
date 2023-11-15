import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ClaimItem.g.dart';

@JsonSerializable()
class ClaimItem {
  @JsonKey(required: true)
  int id;
  @JsonKey(required: true, fromJson: _fromJson, toJson: _toJson)
  DateTime billDate;
  @JsonKey(required: true)
  String billNumber;
  @JsonKey(required: true)
  String expenseCode;
  @JsonKey(required: true)
  int costCenter;
  @JsonKey(required: true)
  double amount;
  @JsonKey(required: true, fromJson: _fromJson, toJson: _toJson)
  DateTime subscriptionStartDate;
  @JsonKey(required: true, fromJson: _fromJson, toJson: _toJson)
  DateTime subscriptionEndDate;

  ClaimItem(
    this.id,
    this.billDate,
    this.billNumber,
    this.expenseCode,
    this.costCenter,
    this.amount,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
  );

  factory ClaimItem.fromJson(Map<String, dynamic> json) =>
      _$ClaimItemFromJson(json);

  Map<String, dynamic> toJson() => _$ClaimItemToJson(this);

  static final _dateFormatter = DateFormat('yyyy-MM-dd');
  static DateTime _fromJson(String date) => _dateFormatter.parse(date);
  static String _toJson(DateTime date) => _dateFormatter.format(date);
}
