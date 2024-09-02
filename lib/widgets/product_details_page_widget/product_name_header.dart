import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductNameHeader extends StatelessWidget {
  const ProductNameHeader({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            product.name,
            style: BTextStyle.heading3Bold(context),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Text(
              "\$ ${product.price}",
              style: BTextStyle.heading3Bold(context),
            ),
            Text(
              "\$ ${product.price + 200.00}",
              style: BTextStyle.body2Medium(context).copyWith(
                color: BAppColors.grey150Color,
                decoration: TextDecoration.lineThrough,
                decorationColor: BAppColors.grey150Color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
