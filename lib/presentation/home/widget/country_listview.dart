import 'package:exchange_rate/core/widget/line.dart';
import 'package:flutter/material.dart';

class CountryListView extends StatelessWidget {
  final NullableIndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const CountryListView({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => const Line(
          height: 0.5,
        ),
        itemCount: itemCount,
      ),
    );
  }
}
