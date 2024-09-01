// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/product_page_bottom_buttons.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/product_page_image_widget.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/products_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BAppbar(
          isBackIcon: true,
          title: "",
          actions: [
            GestureDetector(
              onTap: () {
                if (!context.read<WishListBloc>().wishList.any(
                      (element) =>
                          element.productId == widget.product.productId,
                    )) {
                  context.read<WishListBloc>().add(FetchWishListEvent());
                } else {
                  context
                      .read<WishListBloc>()
                      .add(DeleteProductFromWishListEvent(widget.product));
                }
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: BAppColors.blackColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(7),
                child: SvgPicture.asset(
                  context.watch<WishListBloc>().wishList.any(
                            (element) =>
                                element.productId == widget.product.productId,
                          )
                      ? Images.heartFilledIcon
                      : Images.heartIcon,
                  width: 20,
                  color: context.watch<WishListBloc>().wishList.any(
                            (element) =>
                                element.productId == widget.product.productId,
                          )
                      ? BAppColors.redColor
                      : BAppColors.whiteColor,
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: ProductPageImageWidget(product: widget.product),
        bottomSheet: ProductsDetailsWidget(
          product: widget.product,
          onpressed: (value) {
            setState(() {
              quantity = value;
            });
            log(quantity.toString());
          },
        ),
        bottomNavigationBar: ProductPageBottomButtons(
            product: widget.product, quantity: quantity));
  }
}
