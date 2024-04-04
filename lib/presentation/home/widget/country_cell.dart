import 'package:exchange_rate/core/const/colors.dart';
import 'package:exchange_rate/core/const/text_style.dart';
import 'package:exchange_rate/core/widget/size_helper.dart';
import 'package:exchange_rate/features/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CellType {
  calculate,
  fluctuation,
}

class CountryCell extends StatelessWidget {
  final Country country;
  final double? price;
  final CellType cellType;
  final Widget? widget;

  const CountryCell({
    required this.country,
    this.price,
    this.cellType = CellType.calculate,
    this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: SvgPicture.asset(country.image),
          ),
          const Width(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                country.code,
                style: AppTextStyle.bodyBold3,
              ),
              Row(
                children: [
                  Text(
                    country.countryName,
                    style: AppTextStyle.bodyRegular3
                        .copyWith(color: AppColor().gray70),
                  ),
                  const Width(3),
                  if (cellType == CellType.fluctuation)
                    Text(
                      country.currency,
                      style: AppTextStyle.bodyRegular3
                          .copyWith(color: AppColor().gray70),
                    )
                ],
              ),
            ],
          ),
          Expanded(child: Container(color: Colors.white)),
          if (cellType == CellType.fluctuation)
            Row(
              children: [
                widget!,
              ],
            )
          else
            Align(
              alignment: Alignment.centerRight,
              child: Text(price!.toStringAsFixed(2)),
            )
        ],
      ),
    );
  }
}
