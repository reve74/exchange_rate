import 'package:json_annotation/json_annotation.dart';
part 'dunamu_model.g.dart';

@JsonSerializable()
class DunamuModel {
  final String code;
  final String currencyCode;
  final String? currencyName;
  final String? country;
  final String? name;
  final String date;
  final String time;
  final int recurrenceCount;
  final double basePrice;
  final double openingPrice;
  final double highPrice;
  final double lowPrice;
  final String change;
  final double changePrice;
  final double cashBuyingPrice;
  final double cashSellingPrice;
  final double ttBuyingPrice;
  final double ttSellingPrice;
  final double? tcBuyingPrice;
  final double? fcSellingPrice;
  final double exchangeCommission;
  final double usDollarRate;
  final double high52wPrice;
  final String high52wDate;
  final double low52wPrice;
  final String low52wDate;
  final int currencyUnit;
  final String? provider;
  final int timestamp;
  final int id;
  final String createdAt;
  final String modifiedAt;
  final double signedChangeRate;
  final double signedChangePrice;
  final double changeRate;

  const DunamuModel({
    required this.code,
    required this.currencyCode,
    this.currencyName,
    this.country,
    this.name,
    required this.date,
    required this.time,
    required this.recurrenceCount,
    required this.basePrice,
    required this.openingPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.change,
    required this.changePrice,
    required this.cashBuyingPrice,
    required this.cashSellingPrice,
    required this.ttBuyingPrice,
    required this.ttSellingPrice,
    this.tcBuyingPrice,
    this.fcSellingPrice,
    required this.exchangeCommission,
    required this.usDollarRate,
    required this.high52wPrice,
    required this.high52wDate,
    required this.low52wPrice,
    required this.low52wDate,
    required this.currencyUnit,
    this.provider,
    required this.timestamp,
    required this.id,
    required this.createdAt,
    required this.modifiedAt,
    required this.signedChangeRate,
    required this.signedChangePrice,
    required this.changeRate,
  });

  factory DunamuModel.fromJson(Map<String, dynamic> json) =>
      _$DunamuModelFromJson(json);
}
