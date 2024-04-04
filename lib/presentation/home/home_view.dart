import 'package:exchange_rate/core/const/colors.dart';
import 'package:exchange_rate/features/models/country_list.dart';
import 'package:exchange_rate/presentation/provider/currency_provider.dart';
import 'package:exchange_rate/presentation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with SingleTickerProviderStateMixin {
  TabItem _currentTab = TabItem.home;
  final tabs = [TabItem.home, TabItem.currencyFluctuation];
  int get _currentIndex => tabs.indexOf(_currentTab);

  final textController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    getCurrencyData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: pages,
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColor().blue,
        items: navigationBarItems(context),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedItemColor: Colors.grey.shade100,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _changeTab,
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .map((tab) => tab.toNavigationBarItem(
              context,
              isActivated: _currentIndex == tabs.indexOf(tab),
            ))
        .toList();
  }

  IndexedStack get pages => IndexedStack(
        index: _currentIndex,
        children: tabs.map((tab) => tab.firstPage).toList(),
      );

  void _changeTab(int index) {
    setState(() {
      _currentTab = tabs[index];
    });
  }

  void getCurrencyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // final state = ref.read(currentCurrencyProvider);

    final currency = prefs.getString('currency');
    if(currency == null) {
      prefs.setString('currency', 'KRW');
    }
    // final after = prefs.getString('currency');

    if( currency != null) {
      final index = countryList.indexWhere((element) => element.code == currency);
      countryList.removeAt(index);

      ref.read(currentCurrencyProvider.notifier).state = currency;
    }
  }
}
