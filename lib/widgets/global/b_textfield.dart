import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';

class BTextfield extends StatelessWidget {
  const BTextfield({
    super.key,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.obscureText = false, this.initialValue, required this.enabled,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText,initialValue;
  final Widget? suffixIcon;
  final bool obscureText,enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(enabled: enabled,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      cursorColor: BAppColors.blackColor,
      validator: validator,
      style: BTextStyle.captionRegular(context),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            BTextStyle.captionRegular(context).copyWith(color: BAppColors.grey100Color),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: BAppColors.cyanColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: BAppColors.cyanColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: BAppColors.cyanColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: BAppColors.cyanColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: BAppColors.cyanColor,
          ),
        ),
      ),
    );
  }
}
