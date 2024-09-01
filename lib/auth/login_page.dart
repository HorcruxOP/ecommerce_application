import 'package:ecommerce_application/pages/home.dart';
import 'package:ecommerce_application/pages/profile_pages/privacy_policy_page.dart';
import 'package:ecommerce_application/pages/profile_pages/t_and_c_page.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:ecommerce_application/widgets/global/b_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: BAppColors.getSecondaryButtonColor(context),
        scrolledUnderElevation: 5,
        shadowColor: BAppColors.grey50Color,
        title: SvgPicture.asset(
          Theme.of(context).brightness == Brightness.dark
              ? Images.quickmartDarkIcon
              : Images.quickmartIcon,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  "Login",
                  style: BTextStyle.heading2Bold(context),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: BTextStyle.body2Regular(context)
                            .copyWith(color: BAppColors.grey150Color),
                      ),
                      TextSpan(
                        text: "Signup",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: BTextStyle.body2Regular(context)
                            .copyWith(color: BAppColors.cyanColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Email",
                  style: BTextStyle.body2Medium(context),
                ),
                const SizedBox(height: 10),
                const BTextfield(
                  enabled: true,
                  hintText: "Enter your email",
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: BTextStyle.body2Medium(context),
                ),
                const SizedBox(height: 10),
                BTextfield(
                  enabled: true,
                  hintText: "Enter your password",
                  suffixIcon: GestureDetector(
                    onTapDown: (details) {},
                    onTapUp: (details) {},
                    child: SvgPicture.asset(
                      Images.eyeIcon,
                      height: 24,
                      width: 24,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                BButton(
                  text: "Login",
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
                ),
                const SizedBox(height: 20),
                BButton(
                  color: BAppColors.getSecondaryButtonColor(context),
                  iconColor: BAppColors.cyanColor,
                  textColor: BAppColors.blackColor,
                  text: "Login with Google",
                  icon: true,
                  elevation: 0,
                  iconName: Images.googleIcon,
                  border: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                      text: "By login , you agree to our ",
                      style: BTextStyle.captionSemiBold(context)),
                  TextSpan(
                    text: "Privacy Policy",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyPage(),
                          ),
                        );
                      },
                    style: BTextStyle.captionSemiBold(context)
                        .copyWith(color: BAppColors.blueColor),
                  ),
                  TextSpan(
                    text: " and ",
                    style: BTextStyle.captionSemiBold(context)
                        .copyWith(color: BAppColors.grey150Color),
                  ),
                  TextSpan(
                    text: "Terms & Conditions.",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TAndCPage(),
                          ),
                        );
                      },
                    style: BTextStyle.captionSemiBold(context)
                        .copyWith(color: BAppColors.blueColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
