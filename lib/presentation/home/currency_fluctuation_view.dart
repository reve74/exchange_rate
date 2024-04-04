import 'package:exchange_rate/core/const/colors.dart';
import 'package:exchange_rate/core/const/text_style.dart';
import 'package:exchange_rate/core/layout/default_layout.dart';
import 'package:exchange_rate/core/widget/size_helper.dart';
import 'package:exchange_rate/features/models/dunamu_model.dart';
import 'package:exchange_rate/presentation/home/widget/country_cell.dart';
import 'package:exchange_rate/presentation/home/widget/country_listview.dart';
import 'package:exchange_rate/presentation/provider/currency_provider.dart';
import 'package:exchange_rate/presentation/provider/price_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyFluctuationView extends ConsumerWidget {
  const CurrencyFluctuationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currencyProvider);

    return DefaultLayout(
      appbarColor: Colors.white,
      backgroundColor: Colors.white,
      title: '환율 변동',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('현재 기준 통화'),
            const Text('KRW'),
            const Height(20),
            _tableRow(context),
            const Height(10),
            CountryListView(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LineChartSample2(),
                  //   ),
                  // );
                },
                child: CountryCell(
                  country: state[index],
                  price: initPrice[index].basePrice,
                  cellType: CellType.fluctuation,
                  widget: _detailFluctuation(context, initPrice[index]),
                ),
              ),
              itemCount: initPrice.length,
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(String change) =>
      change == 'RISE' ? AppColor().red : AppColor().blue;

  _detailFluctuation(BuildContext context, DunamuModel dunamu) {
    final deviceWidth = MediaQuery.of(context).size.width - 40;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: deviceWidth * 0.22,
          child: Text(
            dunamu.basePrice.toStringAsFixed(2),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: deviceWidth * 0.18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    dunamu.change == 'RISE'
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined,
                    color: getColor(dunamu.change),
                    size: 18,
                  ),
                  Text(
                    dunamu.changePrice.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyRegular2.copyWith(
                      color: getColor(dunamu.change),
                    ),
                  ),
                ],
              ),
              Text(
                pricePercentage(dunamu),
                style: AppTextStyle.bodyRegular3.copyWith(
                  color: getColor(dunamu.change),
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ],
    );
  }

  _tableRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _tableRowText(context, text: '통화', width: 0.6),
        _tableRowText(context, text: '매매기준율', width: 0.22),
        _tableRowText(context, text: '전일대비', width: 0.18),
      ],
    );
  }

  _tableRowText(
    BuildContext context, {
    required String text,
    required double width,
  }) {
    final deviceWidth = MediaQuery.of(context).size.width - 40;

    return SizedBox(
      width: deviceWidth * width,
      child: Text(
        text,
        style: AppTextStyle.bodyBold2,
        textAlign: TextAlign.center,
      ),
    );
  }

  String pricePercentage(DunamuModel dunamu) {
    if (dunamu.change == "RISE") {
      final startPrice = dunamu.basePrice - dunamu.changePrice;
      final diff = dunamu.basePrice - startPrice;
      final result = (diff / startPrice) * 100;
      return ('+${result.toStringAsFixed(2)}%');
    } else {
      final startPrice = dunamu.basePrice + dunamu.changePrice;
      final diff = startPrice - dunamu.basePrice;
      final result = (diff / startPrice) * 100;
      return ('-${result.toStringAsFixed(2)}%');
    }
  }
}
