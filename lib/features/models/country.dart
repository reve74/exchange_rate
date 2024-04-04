class Country {
  final String code;
  double? basePrice;
  final String countryName;
  final String image;
  final String currency;

  Country({
    required this.code,
    this.basePrice,
    required this.countryName,
    required this.image,
    required this.currency,
  });
}

