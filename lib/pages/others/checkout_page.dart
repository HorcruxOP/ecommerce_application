// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/services/functions/app_functions.dart';
import 'package:ecommerce_application/services/functions/cart_functions.dart';
import 'package:ecommerce_application/services/functions/razorpay_functions.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:ecommerce_application/widgets/global/checkout_stepper.dart';
import 'package:ecommerce_application/widgets/global/order_placed_screen.dart';
import 'package:ecommerce_application/widgets/global/review_details_widget.dart';
import 'package:ecommerce_application/widgets/global/user_address_widget.dart';
import 'package:ecommerce_application/widgets/global/user_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<Widget> pageViewList = [
    const UserAddressWidget(),
    const UserPaymentMethod(),
    const ReviewDetailsWidget(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppbar(
        title: "Checkout",
        isBackIcon: true,
        backOnTap: () {
          if (index != 0) {
            setState(() {
              index--;
            });
          } else {
            Navigator.pop(context);
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CheckoutStepper(index: index),
            const SizedBox(height: 30),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pageViewList.length,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder: (context, _) => pageViewList[index],
              ),
            ),
            const SizedBox(height: 40),
            BButton(
              text: index < 2 ? "Continue" : "Place Order",
              icon: false,
              onPressed: () {
                if (index < 2) {
                  setState(() {
                    index++;
                  });
                } else {
                  RazorpayFunctions razorpayService = RazorpayFunctions(
                    onSuccess: (response) async {
                      await CartFunctions.deleteCart();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderPlacedScreen(),
                        ),
                      );
                    },
                    onFailure: (response) {
                      showCustomSnackbar(
                          context, "Payment Failed", BAppColors.redColor);
                    },
                  );
                  var cartList = context.read<CartBloc>().cartList;
                  double total = context.read<CartBloc>().total;
                  razorpayService.openPayment(
                    name: cartList.length > 1
                        ? "Multiple Products"
                        : cartList[0].name,
                    amount: total + 10.00,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
