import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:ecommerce_application/widgets/global/b_textfield.dart';
import 'package:flutter/material.dart';

class UserPaymentMethod extends StatelessWidget {
  const UserPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: BButton(
                text: "PayPal",
                icon: false,
                onPressed: () {},
                textColor: BAppColors.getTextColor(context),
                color: BAppColors.getOnboardingColor(context),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BButton(
                text: "Google Pay",
                icon: false,
                onPressed: () {},
                textColor: BAppColors.getTextColor(context),
                color: BAppColors.getOnboardingColor(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Text(
          "Card Holder Name",
          style: BTextStyle.body2Medium(context),
        ),
        const SizedBox(height: 10),
        const BTextfield(
          hintText: "Enter card holder name",
          enabled: true,
          color: BAppColors.grey150Color,
        ),
        const SizedBox(height: 20),
        Text(
          "Card Number",
          style: BTextStyle.body2Medium(context),
        ),
        const SizedBox(height: 10),
        const BTextfield(
          hintText: "Enter card number",
          enabled: true,
          color: BAppColors.grey150Color,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expiration",
                    style: BTextStyle.body2Medium(context),
                  ),
                  const SizedBox(height: 10),
                  const BTextfield(
                    hintText: "MM/YY",
                    enabled: true,
                    color: BAppColors.grey150Color,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CVV",
                    style: BTextStyle.body2Medium(context),
                  ),
                  const SizedBox(height: 10),
                  const BTextfield(
                    hintText: "CVV",
                    enabled: true,
                    color: BAppColors.grey150Color,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
