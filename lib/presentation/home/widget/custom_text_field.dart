import 'package:exchange_rate/core/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.focusNode,
    this.onChanged,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: '금액을 입력하세요',
          hintStyle: TextStyle(
            color: AppColor().gray50,
            fontSize: 16,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor().blue),
          ),
        ),
        textAlign: TextAlign.end,
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
}
