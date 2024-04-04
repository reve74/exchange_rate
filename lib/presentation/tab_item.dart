import 'package:exchange_rate/presentation/home/calculate_view.dart';
import 'package:exchange_rate/presentation/home/currency_fluctuation_view.dart';
import 'package:flutter/material.dart';

enum TabItem {
  home(Icons.calculate, '계산기', CalculateView()),
  currencyFluctuation(Icons.candlestick_chart, '환율 변동', CurrencyFluctuationView());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage,
      {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context,
      {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated
              ? Colors.white
              : Colors.grey.shade400
        ),
        label: tabName);
  }
}
