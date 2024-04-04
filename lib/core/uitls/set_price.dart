import 'package:exchange_rate/features/models/country_list.dart';
import 'package:exchange_rate/presentation/provider/currency_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// String getCountryList(Ref ref) {
//   List<String> codeList = [];
//   String result = "";
//
//
//   final state = ref.watch(currentCurrencyProvider);
//
//   // codeList = baseCountryList.keys.toList();
//   // codeList.removeWhere((element) => element == state);
//
//   // print('codeList $codeList');
//
//   codeList = countryList.map((e) => 'FRX.KRW${e.code}').toList();
//   // print(result += codeList.join(','));
//   return result += codeList.join(',');
// }

String getCountryList() {
  List<String> codeList = countryList.map((e) => 'FRX.KRW${e.code}').toList();
  return codeList.join(',');
}
