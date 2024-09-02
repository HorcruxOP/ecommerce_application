import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_textfield.dart';
import 'package:flutter/material.dart';

class UserAddressWidget extends StatelessWidget {
  const UserAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Full Name",
          style: BTextStyle.body2Medium(context),
        ),
        const SizedBox(height: 10),
        const BTextfield(
          hintText: "Enter your full name",
          enabled: true,
          color: BAppColors.grey150Color,
        ),
        const SizedBox(height: 20),
        Text(
          "Phone Number",
          style: BTextStyle.body2Medium(context),
        ),
        const SizedBox(height: 10),
        const BTextfield(
          hintText: "Enter your phone number",
          enabled: true,
          color: BAppColors.grey150Color,
        ),
        const SizedBox(height: 20),
        Text(
          "Street Address",
          style: BTextStyle.body2Medium(context),
        ),
        const SizedBox(height: 10),
        const BTextfield(
          hintText: "Enter your address",
          enabled: true,
          color: BAppColors.grey150Color,
        ),
      ],
    );
  }
}
