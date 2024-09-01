// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BAppbar(
      {super.key,
      required this.title,
      this.actions,
      this.backgroundColor,
      this.shadowColor,
      required this.isBackIcon});
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor, shadowColor;
  final bool isBackIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          backgroundColor ?? BAppColors.getSecondaryButtonColor(context),
      surfaceTintColor: Colors.transparent,
      elevation: .5,
      shadowColor: shadowColor ?? BAppColors.grey50Color,
      foregroundColor: Colors.grey,
      title: Row(
        children: [
          if (isBackIcon)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1),
                child: SvgPicture.asset(
                  Images.backIcon,
                  width: 32,
                  color: BAppColors.getTextColor(context),
                ),
              ),
            ),
          if (isBackIcon) const SizedBox(width: 15),
          Text(
            title,
            style: BTextStyle.body1Medium(context),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
