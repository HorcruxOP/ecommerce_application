import 'package:ecommerce_application/pages/home.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.emptyCartIcon),
            Text(
              "Your order has been placed successfully",
              style: BTextStyle.heading2Bold(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            BButton(
              text: "Continue Shopping",
              icon: false,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                  (route) => false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
