import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppbar(
        isBackIcon: true,
        title: "FAQs",
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Text(
            "Can I cancel my order?",
            style: BTextStyle.body2Medium(context),
          ),
          const SizedBox(height: 10),
          Text(
            "Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.",
            style: BTextStyle.body2Medium(context)
                .copyWith(color: BAppColors.grey150Color),
          ),
          const SizedBox(height: 20),
          Text(
            "Will I receive the same product I see in the photo?",
            style: BTextStyle.body2Medium(context),
          ),
          const SizedBox(height: 10),
          Text(
            "Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image's color.",
            style: BTextStyle.body2Medium(context)
                .copyWith(color: BAppColors.grey150Color),
          ),
          const SizedBox(height: 20),
          Text(
            "How can I recover the forgotten password?",
            style: BTextStyle.body2Medium(context),
          ),
          const SizedBox(height: 10),
          Text(
            'If you have forgotten your password, you can recover it from "Login - Forgotten your password?" section. You will receive an e-mail with a link to enter and confirm your new password.',
            style: BTextStyle.body2Medium(context)
                .copyWith(color: BAppColors.grey150Color),
          ),
          const SizedBox(height: 20),
          Text(
            "Is my personal information confidential?",
            style: BTextStyle.body2Medium(context),
          ),
          const SizedBox(height: 10),
          Text(
            "Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.",
            style: BTextStyle.body2Medium(context)
                .copyWith(color: BAppColors.grey150Color),
          ),
          const SizedBox(height: 20),
          Text(
            "What payment methods can I use to make purchases?",
            style: BTextStyle.body2Medium(context),
          ),
          const SizedBox(height: 10),
          Text(
            "We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.",
            style: BTextStyle.body2Medium(context)
                .copyWith(color: BAppColors.grey150Color),
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              style: BTextStyle.captionSemiBold(context),
              children: [
                const TextSpan(
                    text: "For any query, you can visit our website for "),
                TextSpan(
                  text: "Help Center",
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: BTextStyle.captionSemiBold(context).copyWith(
                    color: BAppColors.blueColor,
                  ),
                ),
                const TextSpan(text: " at Quickmart.com"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
