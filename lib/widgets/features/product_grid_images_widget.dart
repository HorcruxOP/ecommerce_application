// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductGridImagesWidget extends StatelessWidget {
  const ProductGridImagesWidget({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<HomePageBloc>()
          .add(ProductTappedEvent(product, context)),
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              product.imageUrls[0],
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.grey,
        ),
        child: GestureDetector(
          onTap: () {
            if (!context.read<WishListBloc>().wishList.any(
                  (element) => element.productId == product.productId,
                )) {
              context.read<WishListBloc>().add(FetchWishListEvent());
              context.read<HomePageBloc>().add(ProductLikedEvent(product));
            } else {
              context
                  .read<WishListBloc>()
                  .add(DeleteProductFromWishListEvent(product));
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              color: BAppColors.blackColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              context.watch<WishListBloc>().wishList.any(
                        (element) => element.productId == product.productId,
                      )
                  ? Images.heartFilledIcon
                  : Images.heartIcon,
              width: 20,
              color: context.watch<WishListBloc>().wishList.any(
                        (element) => element.productId == product.productId,
                      )
                  ? BAppColors.redColor
                  : BAppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
