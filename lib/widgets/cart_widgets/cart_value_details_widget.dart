import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';

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
                "Order Info",
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
                "Order Info",
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
                "Order Info",
                style: BTextStyle.body1Medium(context),
              ),
            ],
          ),
          BButton(
            icon: false,
            text: "Checkout",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
