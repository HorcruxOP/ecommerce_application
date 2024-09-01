import 'package:ecommerce_application/utils/colors.dart';
import 'package:flutter/material.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.padding,
      this.margin});
  final double? width, height, radius;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: BAppColors.grey50Color,
      ),
    );
  }
}
