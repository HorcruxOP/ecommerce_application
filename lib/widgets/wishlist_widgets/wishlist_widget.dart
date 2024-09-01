import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/wishlist_widgets/wishlist_delete_button.dart';
import 'package:flutter/material.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 130,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    product.imageUrls[0],
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: BTextStyle.body2Medium(context),
                  ),
                  Column(
                    children: [
                      Text(
                        "\$ ${product.price}",
                        style: BTextStyle.captionSemiBold(context),
                      ),
                      Text(
                        "\$ ${product.price}",
                        style: BTextStyle.captionRegular(context)
                            .copyWith(color: BAppColors.grey150Color),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [WishlistDeleteButton(product: product)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
