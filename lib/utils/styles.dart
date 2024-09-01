import 'package:flutter/material.dart';
import 'package:ecommerce_application/utils/colors.dart';

class BTextStyle {
  static TextStyle heading1Bold(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle heading1SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle heading1Regular(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle heading2Bold(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle heading2SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle heading2Regular(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle heading3Bold(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle heading3SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle heading3Regular(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle button1SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle button2SemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle body1Medium(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle body1Regular(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle body2Medium(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle body2Regular(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle captionSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle captionRegular(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle overlineSemiBold(BuildContext context) {
    return TextStyle(
      fontSize: 10,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle overlineRegular(BuildContext context) {
    return TextStyle(
      fontSize: 10,
      color: BAppColors.getTextColor(context),
      fontWeight: FontWeight.w400,
    );
  }
}
