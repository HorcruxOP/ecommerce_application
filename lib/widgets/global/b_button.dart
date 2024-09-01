// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BButton extends StatelessWidget {
  const BButton(
      {super.key,
      required this.text,
      this.onPressed,
      required this.icon,
      this.iconName,
      this.color,
      this.textColor,
      this.elevation,
      this.border = false,
      this.iconColor});
  final String text;
  final double? elevation;
  final bool icon, border;
  final String? iconName;
  final void Function()? onPressed;
  final Color? color, textColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      elevation: elevation,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: border
            ? const BorderSide(
                color: BAppColors.grey50Color,
              )
            : BorderSide.none,
      ),
      color: color ?? BAppColors.getButtonColor(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: BTextStyle.button2SemiBold(context)
                .copyWith(color: textColor ?? BAppColors.whiteColor),
          ),
          if (icon) const SizedBox(width: 10),
          if (icon)
            SvgPicture.asset(
              iconName ?? Images.cartIcon,
              color: iconColor ?? BAppColors.whiteColor,
            )
        ],
      ),
    );
  }
}
