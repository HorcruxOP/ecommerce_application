// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuantityControllerWidget extends StatefulWidget {
  const QuantityControllerWidget({
    super.key,
    required this.onPressed,
    this.quantityFrom = 1,
  });
  final Function(int) onPressed;
  final int quantityFrom;

  @override
  State<QuantityControllerWidget> createState() =>
      _QuantityControllerWidgetState();
}

class _QuantityControllerWidgetState extends State<QuantityControllerWidget> {
  int quantity = 1;
  @override
  void initState() {
    quantity = widget.quantityFrom;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BAppColors.getSecondaryButtonColor(context),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: BAppColors.grey50Color,
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) {
                setState(() {
                  quantity--;
                  widget.onPressed(quantity);
                });
              }
            },
            child: SvgPicture.asset(
              Images.minusIcon,
              color: BAppColors.getTextColor(context),
            ),
          ),
          const SizedBox(width: 25),
          Text(
            quantity.toString(),
            style: BTextStyle.body1Medium(context),
          ),
          const SizedBox(width: 25),
          GestureDetector(
            onTap: () {
              if (quantity < 10) {
                setState(() {
                  quantity++;
                  widget.onPressed(quantity);
                });
              }
            },
            child: SvgPicture.asset(
              Images.addIcon,
              color: BAppColors.getTextColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
