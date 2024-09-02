// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Column(
          children: [
            SvgPicture.asset(
              Images.shippingBoxIcon,
              color: index == 0
                  ? BAppColors.getTextColor(context)
                  : BAppColors.cyanColor,
            ),
            Text(
              "Shipping",
              style: BTextStyle.captionSemiBold(context).copyWith(
                color: index == 0
                    ? BAppColors.getTextColor(context)
                    : BAppColors.cyanColor,
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        const Expanded(child: Divider()),
        const SizedBox(width: 20),
        Column(
          children: [
            SvgPicture.asset(
              Images.cardIcon,
              color: index == 1
                  ? BAppColors.getTextColor(context)
                  : index < 1
                      ? BAppColors.grey150Color
                      : BAppColors.cyanColor,
            ),
            Text(
              "Payment",
              style: BTextStyle.captionSemiBold(context).copyWith(
                color: index == 1
                    ? BAppColors.getTextColor(context)
                    : index < 1
                        ? BAppColors.grey150Color
                        : BAppColors.cyanColor,
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        const Expanded(child: Divider()),
        const SizedBox(width: 20),
        Column(
          children: [
            SvgPicture.asset(
              Images.cardIcon,
              color: index == 2
                  ? BAppColors.getTextColor(context)
                  : index < 2
                      ? BAppColors.grey150Color
                      : BAppColors.cyanColor,
            ),
            Text(
              "Review",
              style: BTextStyle.captionSemiBold(context).copyWith(
                color: index == 2
                    ? BAppColors.getTextColor(context)
                    : index < 2
                        ? BAppColors.grey150Color
                        : BAppColors.cyanColor,
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
