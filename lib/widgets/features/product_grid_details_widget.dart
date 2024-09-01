import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductGridDetailsWidget extends StatelessWidget {
  const ProductGridDetailsWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 10),
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                      color: BAppColors.brownColor, shape: BoxShape.circle),
                ),
                Positioned(
                  left: 16,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                        color: BAppColors.blueColor, shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                        color: BAppColors.blackColor, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            Text(
              "All 5 Colors",
              style: BTextStyle.captionRegular(context)
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ],
        ),
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: BTextStyle.body2Medium(context),
        ),
        Text(
          "\$ ${product.price}",
          style: BTextStyle.captionSemiBold(context),
        ),
        Text(
          "\$126.00",
          style: BTextStyle.captionSemiBold(context).copyWith(
              color: BAppColors.grey100Color,
              decoration: TextDecoration.lineThrough,
              decorationColor: BAppColors.grey100Color),
        ),
      ],
    );
  }
}
