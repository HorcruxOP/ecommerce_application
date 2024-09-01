import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductRatingsWidget extends StatelessWidget {
  const ProductRatingsWidget({super.key,required this.product});final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Images.starIcon,
                    width: 16,
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    Images.starIcon,
                    width: 16,
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    Images.starIcon,
                    width: 16,
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    Images.starIcon,
                    width: 16,
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    Images.starHalfIcon,
                    width: 16,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Text(
                "${product.ratings.averageRating} (${product.ratings.totalRatings} reviews)",
                style: BTextStyle.captionSemiBold(context),
              ),
            ],
          );
  }
}