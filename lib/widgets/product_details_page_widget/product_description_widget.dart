import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatefulWidget {
  const ProductDescriptionWidget({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDescriptionWidget> createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: isExpand
                ? widget.product.description
                : "${widget.product.description.substring(0, 200)}...",
            style: BTextStyle.body2Regular(context).copyWith(
              color: BAppColors.grey150Color,
            ),
          ),
          TextSpan(
            text: isExpand ? "Read less" : "Read more",
            style: BTextStyle.body2Regular(context).copyWith(
              color: BAppColors.cyanColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isExpand = !isExpand;
                });
              },
          ),
        ],
      ),
    );
  }
}
