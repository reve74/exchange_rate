import 'package:exchange_rate/core/const/text_style.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final VoidCallback? onPressed;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? actions;
  final bool? withOutLeading;
  final bool? isPhotoReviewTitle;
  final String? leadingIcon;
  final Color? appbarColor;
  final bool? centerTitle;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onPressed,
    this.floatingActionButtonLocation,
    this.actions,
    this.withOutLeading,
    this.isPhotoReviewTitle = false,
    this.leadingIcon,
    this.appbarColor,
    this.centerTitle = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(context),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  AppBar? renderAppBar(BuildContext context) {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        scrolledUnderElevation: 0,
        centerTitle: centerTitle,
        elevation: 0.0,
        backgroundColor: appbarColor ?? Colors.white,
        leadingWidth: MediaQuery.of(context).size.width * 0.133,
        title: Text(
          title!,
        style: AppTextStyle.headlineBold2,
        ),
        actions: actions,
      );
    }
  }
}
