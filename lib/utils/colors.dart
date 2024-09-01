import 'package:flutter/material.dart';

class BAppColors {
  static const whiteColor = Color(0xffffffff);
  static const cyanColor = Color(0xff21D4B4);
  static const cyan50Color = Color(0xffF4FDFA);
  static const blackColor = Color(0xff1c1b1b);
  static const grey50Color = Color(0xffF4F5FD);
  static const grey100Color = Color(0xffC0C0C0);
  static const grey150Color = Color(0xff6F7384);
  static const redColor = Color(0xffEE4D4D);
  static const blueColor = Color(0xff1F88DA);
  static const purpleColor = Color(0xff4F1FDA);
  static const yellowColor = Color(0xffEBEF14);
  static const orangeColor = Color(0xffF0821D);
  static const merigoldColor = Color(0xffFFCB45);
  static const brownColor = Color(0xff5A1A05);
  static const pinkColor = Color(0xffCE1DEB);
  static const greenColor = Color(0xff08E488);
  static const Color lightTextColor = blackColor;
  static const Color lightBackgroundColor = whiteColor;

  // Dark theme colors
  static const Color darkTextColor = whiteColor;
  static const Color darkBackgroundColor = blackColor;

  // Method to get text color based on theme
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextColor
        : lightTextColor;
  }

  static Color getButtonColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? cyanColor
        : lightTextColor;
  }

  static Color getOnboardingColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color.fromARGB(255, 41, 41, 41)
        : cyan50Color;
  }

  static Color getSecondaryButtonColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackgroundColor
        : lightBackgroundColor;
  }
}
