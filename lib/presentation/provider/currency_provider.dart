import 'package:exchange_rate/core/uitls/set_price.dart';
import 'package:exchange_rate/features/models/country.dart';
import 'package:exchange_rate/features/models/country_list.dart';
import 'package:exchange_rate/presentation/provider/price_provider.dart';
import 'package:exchange_rate/features/repository/exchange_api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCurrencyProvider = StateProvider<String>((ref) => '');

final currencyProvider =
    StateNotifierProvider<CurrencyStateNotifier, List<Country>>((ref) {
  return CurrencyStateNotifier(ref);
});

//TODO: 수정필요
class CurrencyStateNotifier extends StateNotifier<List<Country>> {
  final Ref ref;

  CurrencyStateNotifier(
    this.ref,
  ) : super(countryList) {
    getPrice();
  }

  getPrice() async {
    final repository = ref.watch(exchangeRepositoryProvider);
    final result = await repository.getExchange(codes: getCountryList());

    initPrice = result;

    // final remainingCountries = countryList.sublist(1);
    //
    for (final country in countryList) {
      for (final dunamuModel in result) {
        if (country.code == dunamuModel.code.substring(7)) {
          country.basePrice = dunamuModel.basePrice;
        }
      }
    }
    state = [...state];
  }

  getCalculate(double? value) {
    if (value == null) {
      for (final country in countryList) {
        for (final dunamuModel in initPrice) {
          country.basePrice = dunamuModel.basePrice;
        }
      }
    }
    final exchangeRates = initPrice.map((e) => value! / e.basePrice).toList();
    for (int i = 0; i < state.length; i++) {
      state[i].basePrice = exchangeRates[i];
      print('${state[i].basePrice}');
      state = [...state];
    }
  }
}
