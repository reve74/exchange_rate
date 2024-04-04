import 'package:exchange_rate/core/const/colors.dart';
import 'package:exchange_rate/core/layout/default_layout.dart';
import 'package:exchange_rate/core/widget/size_helper.dart';
import 'package:exchange_rate/features/models/country_list.dart';
import 'package:exchange_rate/presentation/home/widget/country_cell.dart';
import 'package:exchange_rate/presentation/home/widget/country_listview.dart';
import 'package:exchange_rate/presentation/home/widget/custom_text_field.dart';
import 'package:exchange_rate/presentation/provider/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CalculateView extends ConsumerStatefulWidget {
  const CalculateView({super.key});

  @override
  ConsumerState<CalculateView> createState() => _CalculateViewState();
}

class _CalculateViewState extends ConsumerState<CalculateView> {
  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currencyProvider);

    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            focusNode.unfocus();
          },
          child: DefaultLayout(
            title: '환율 계산기',
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    builder: (context) {
                      return _bottomModalSheet();
                    },
                  );
                },
                icon: const Icon(
                  Icons.settings,
                  size: 25,
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  baseCurrency(),
                  const Height(10),
                  currencyList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget currencyList() {
    final state = ref.watch(currencyProvider);

    // final parsed = state.sublist(1);

    if (state.last.basePrice == null) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return CountryListView(
      itemBuilder: (context, index) => CountryCell(
        country: state[index],
        price: state[index].basePrice!,
      ),
      itemCount: countryList.length,
    );
  }

  Widget baseCurrency() {
    return Row(
      children: [
        // TODO: 기준 통화 변경 시 수정 필요
        SvgPicture.asset(

          'assets/images/flags/southkorea.svg',
          width: 40,
        ),
        const Width(10),
        Expanded(
          child: CustomTextField(
            focusNode: focusNode,
            controller: textController,
            onChanged: (value) {
              if (value != null && value.length != 0) {
                ref
                    .read(currencyProvider.notifier)
                    .getCalculate(double.parse(value));
              } else {
                ref.read(currencyProvider.notifier).getPrice();
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
          width: 20,
          child: Icon(Icons.search),
        ),
      ],
    );
  }

  Widget _bottomModalSheet() {
    final state = ref.watch(currencyProvider);


    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Height(10),
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: AppColor().gray50,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            const Height(10),
            Text('통화를 선택하세요'),
            const Height(5),

            CountryListView(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CountryCell(
                  country: state[index],
                  price: state[index].basePrice!,
                ),
              ),
              itemCount: countryList.length,
            )
          ],
        ),
      ),
    );
  }
}
