import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishlistDeleteButton extends StatelessWidget {
  const WishlistDeleteButton({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(Images.trashIcon),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: BAppColors.getSecondaryButtonColor(context),
          constraints: const BoxConstraints(maxHeight: 250),
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delete product from wishlist",
                  style: BTextStyle.body1Medium(context),
                ),
                BButton(
                  icon: false,
                  text: "Delete",
                  onPressed: () {
                    context
                        .read<WishListBloc>()
                        .add(DeleteProductFromWishListEvent(product));
                    Navigator.pop(context);
                  },
                ),
                BButton(
                  text: "Cancel",
                  icon: false,
                  color: BAppColors.getSecondaryButtonColor(context),
                  textColor: BAppColors.getTextColor(context),
                  elevation: 0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
