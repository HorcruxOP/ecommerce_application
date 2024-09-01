import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: BAppColors.blueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Top Rated",
                  style: BTextStyle.captionSemiBold(context)
                      .copyWith(color: BAppColors.whiteColor),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: BAppColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Free Shipping",
                  style: BTextStyle.captionSemiBold(context)
                      .copyWith(color: BAppColors.whiteColor),
                ),
              ),
            ],
          );
  }
}