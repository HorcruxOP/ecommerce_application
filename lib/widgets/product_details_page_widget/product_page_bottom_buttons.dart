import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/services/functions/app_functions.dart';
import 'package:ecommerce_application/services/functions/cart_functions.dart';
import 'package:ecommerce_application/services/models/cart_model.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/services/models/ratings_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPageBottomButtons extends StatelessWidget {
  const ProductPageBottomButtons(
      {super.key, required this.product, required this.quantity});

  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {},
              color: BAppColors.getSecondaryButtonColor(context),
              height: 60,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: BAppColors.grey50Color,
                ),
              ),
              child: Text(
                "Buy Now",
                style: BTextStyle.button2SemiBold(context),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: BButton(
              icon: true,
              text: "Add to Cart",
              onPressed: () {
                Ratings ratings = Ratings(
                  totalRatings: product.ratings.totalRatings,
                  averageRating: product.ratings.averageRating,
                );
                CartModel cartModel = CartModel(
                  productId: product.productId,
                  quantity: quantity,
                  price: product.price,
                  ratings: ratings,
                  imageUrls: product.imageUrls,
                  name: product.name,
                  stockQuantity: product.stockQuantity,
                  description: product.description,
                  subCategoryId: product.subCategoryId,
                  categoryId: product.categoryId,
                );
                CartFunctions.addToCart(cartModel);
                context.read<CartBloc>().add(FetchCartEvent());
                showCustomSnackbar(
                    context, "Added to cart", BAppColors.cyanColor);
              },
            ),
          ),
        ],
      ),
    );
  }
}
