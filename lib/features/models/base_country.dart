class BaseCountry {
  final String country;
  final String currency;
  final String imagePath;
  double? price;

  BaseCountry({
    required this.country,
    required this.currency,
    required this.imagePath,
    this.price,
  });
}

const currencyCodeList = [
  "KRW",
  "USD",
  "JPY",
  "EUR",
  "CNY",
  "HKD",
  "THB",
  "TWD",
  "PHP",
  "SGD",
  "AUD",
  "VND",
  "GBP",
  "CAD",
  "MYR",
  "RUB",
  "ZAR",
  "NOK",
  "NZD",
  "DKK",
  "MXN",
  "MNT",
  "BHD",
  "BDT",
  "BRL",
  "BND",
  "SAR",
  "LKR",
  "SEK",
  "CHF",
  "AED",
  "DZD",
  "OMR",
  "JOD",
  "ILS",
  "EGP",
  "INR",
  "IDR",
  "CZK",
  "CLP",
  "KZT",
  "QAR",
  "KES",
  "COP",
  "KWD",
  "TZS",
  "TRY",
  "PKR",
  "PLN",
  "HUF"
];

final baseCountryList = {
  "KRW": BaseCountry(
      country: "대한민국", currency: "원", imagePath: "assets/flags/southkorea.svg"),
  "USD": BaseCountry(
      country: "미국", currency: "달러", imagePath: "assets/flags/usa.svg"),
  "JPY": BaseCountry(
      country: "일본", currency: "엔", imagePath: "assets/flags/japan.svg"),
  "EUR": BaseCountry(
      country: "유로", currency: "유로", imagePath: "assets/flags/euro.svg"),
  "CNY": BaseCountry(
      country: "중국", currency: "위안", imagePath: "assets/flags/china.svg"),
  "HKD": BaseCountry(
      country: "홍콩", currency: "달러", imagePath: "assets/flags/hongkong.svg"),
  "THB": BaseCountry(
      country: "태국", currency: "바트", imagePath: "assets/flags/thailand.svg"),
  "TWD": BaseCountry(
      country: "대만", currency: "달러", imagePath: "assets/flags/taiwan.svg"),
  "PHP": BaseCountry(
      country: "필리핀",
      currency: "페소",
      imagePath: "assets/flags/philippines.svg"),
  "SGD": BaseCountry(
      country: "싱가포르", currency: "달러", imagePath: "assets/flags/singapore.svg"),
  "AUD": BaseCountry(
      country: "호주", currency: "달러", imagePath: "assets/flags/australia.svg"),
  "VND": BaseCountry(
      country: "베트남", currency: "동", imagePath: "assets/flags/vietnam.svg"),
  "GBP": BaseCountry(
      country: "영국",
      currency: "파운드",
      imagePath: "assets/flags/greatbritain.svg"),
  "CAD": BaseCountry(
      country: "캐나다", currency: "달러", imagePath: "assets/flags/canada.svg"),
  "MYR": BaseCountry(
      country: "말레이시아", currency: "링깃", imagePath: "assets/flags/malaysia.svg"),
  "RUB": BaseCountry(
      country: "러시아", currency: "루블", imagePath: "assets/flags/russia.svg"),
  "ZAR": BaseCountry(
      country: "남아프리카공화국",
      currency: "랜드",
      imagePath: "assets/flags/southafrica.svg"),
  "NOK": BaseCountry(
      country: "노르웨이", currency: "크로네", imagePath: "assets/flags/norway.svg"),
  "NZD": BaseCountry(
      country: "뉴질랜드",
      currency: "달러",
      imagePath: "assets/flags/newzealand.svg"),
  "DKK": BaseCountry(
      country: "덴마크", currency: "크로네", imagePath: "assets/flags/denmark.svg"),
  "MXN": BaseCountry(
      country: "멕시코", currency: "페소", imagePath: "assets/flags/mexico.svg"),
  "MNT": BaseCountry(
      country: "몽골", currency: "투그릭", imagePath: "assets/flags/mongolia.svg"),
  "BHD": BaseCountry(
      country: "바레인", currency: "디나르", imagePath: "assets/flags/bahrain.svg"),
  "BDT": BaseCountry(
      country: "방글라데시",
      currency: "타카",
      imagePath: "assets/flags/bangladesh.svg"),
  "BRL": BaseCountry(
      country: "브라질", currency: "헤알", imagePath: "assets/flags/brazil.svg"),
  "BND": BaseCountry(
      country: "브루나이", currency: "달러", imagePath: "assets/flags/brunei.svg"),
  "SAR": BaseCountry(
      country: "사우디아라비아",
      currency: "리얄",
      imagePath: "assets/flags/saudiarabia.svg"),
  "LKR": BaseCountry(
      country: "스리랑카", currency: "루피", imagePath: "assets/flags/srilanka.svg"),
};
