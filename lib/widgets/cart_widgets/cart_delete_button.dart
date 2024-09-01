import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/services/models/cart_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartDeleteButton extends StatelessWidget {
  const CartDeleteButton({super.key, required this.product});
  final CartModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: BAppColors.getSecondaryButtonColor(context),
            constraints: const BoxConstraints(maxHeight: 250),
            context: context,
            builder: (context) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete product from cart",
                    style: BTextStyle.body1Medium(context),
                  ),
                  BButton(
                    icon: false,
                    text: "Delete",
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(DeleteProductFromCartEvent(product));
                      Navigator.pop(context);
                    },
                  ),
                  BButton(
                    text: "Cancel",
                    icon: false,
                    color: BAppColors.getSecondaryButtonColor(context),
                    elevation: 0,
                    textColor: BAppColors.getTextColor(context),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        },
        child: SvgPicture.asset(Images.trashIcon));
  }
}
