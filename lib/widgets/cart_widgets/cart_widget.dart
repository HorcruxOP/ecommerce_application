// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/services/functions/cart_functions.dart';
import 'package:ecommerce_application/services/models/cart_model.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/services/models/ratings_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/cart_widgets/cart_delete_button.dart';
import 'package:ecommerce_application/widgets/global/quantity_controller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key, required this.product, required this.index});
  final CartModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  product.imageUrls[0],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: BTextStyle.body2Medium(context),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Ratings ratings = Ratings(
                          totalRatings: product.ratings.totalRatings,
                          averageRating: product.ratings.averageRating,
                        );
                        ProductModel productModel = ProductModel(
                          productId: product.productId,
                          price: product.price,
                          ratings: ratings,
                          imageUrls: product.imageUrls,
                          name: product.name,
                          stockQuantity: product.stockQuantity,
                          description: product.description,
                          subCategoryId: product.subCategoryId,
                          categoryId: product.categoryId,
                        );
                        if (!context.read<WishListBloc>().wishList.any(
                              (element) =>
                                  element.productId == product.productId,
                            )) {
                          context
                              .read<HomePageBloc>()
                              .add(ProductLikedEvent(productModel));
                          context
                              .read<WishListBloc>()
                              .add(FetchWishListEvent());
                        } else {
                          context.read<WishListBloc>().add(
                              DeleteProductFromWishListEvent(productModel));
                        }
                      },
                      child: SvgPicture.asset(
                        context.watch<WishListBloc>().wishList.any(
                                  (element) =>
                                      element.productId == product.productId,
                                )
                            ? Images.checkBoxIcon
                            : Images.checkBoxOutlineIcon,
                        color: BAppColors.cyanColor,
                      ),
                    )
                  ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityControllerWidget(
                      quantityFrom: product.quantity,
                      onPressed: (value) {
                        CartFunctions.updateQuantity(product, value, index);
                      },
                    ),
                    CartDeleteButton(product: product),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
