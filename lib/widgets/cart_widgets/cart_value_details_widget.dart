import 'package:ecommerce_application/pages/others/checkout_page.dart';
import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartValueDetailsWidget extends StatelessWidget {
  const CartValueDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      height: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Order Info",
            style: BTextStyle.body1Medium(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: BTextStyle.captionRegular(context),
              ),
              Text(
                "\$ ${context.watch<CartBloc>().total.toStringAsFixed(2)}",
                style: BTextStyle.captionRegular(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Cost",
                style: BTextStyle.captionRegular(context),
              ),
              Text(
                "\$ 10.00",
                style: BTextStyle.captionRegular(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: BTextStyle.body1Medium(context),
              ),
              Text(
                "\$ ${(context.watch<CartBloc>().total + 10.00).toStringAsFixed(2)}",
                style: BTextStyle.body1Medium(context),
              ),
            ],
          ),
          BButton(
            icon: false,
            text: "Checkout",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckoutPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
