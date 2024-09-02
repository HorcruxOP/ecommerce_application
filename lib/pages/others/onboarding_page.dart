// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/auth/login_page.dart';
import 'package:ecommerce_application/auth/signup_page.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var index2 = 0;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  index2 = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(index == 0
                              ? Images.onboarding1Icon
                              : index == 1
                                  ? Images.onboarding2Icon
                                  : Images.onboarding3Icon),
                        ),
                        borderRadius: BorderRadius.circular(32),
                        color: BAppColors.getOnboardingColor(context),
                      ),
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: index == 0
                                ? () {}
                                : () {
                                    setState(() {
                                      index2--;
                                    });
                                    _controller.previousPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  },
                            child: index == 0
                                ? SvgPicture.asset(
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Images.quickmartDarkIcon
                                        : Images.quickmartIcon)
                                : SvgPicture.asset(
                                    Images.backIcon,
                                    color: BAppColors.getTextColor(context),
                                  ),
                          ),
                          if (index != 2)
                            GestureDetector(
                              onTap: () {
                                _controller.animateToPage(2,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                                setState(() {
                                  index2 = 2;
                                });
                              },
                              child: Text(
                                "Skip for now",
                                style: BTextStyle.body2Medium(context)
                                    .copyWith(color: BAppColors.cyanColor),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      index == 0
                          ? "Explore a wide range of products"
                          : index == 1
                              ? "Unlock exclusive offers and discounts"
                              : "Safe and secure payments",
                      style: BTextStyle.heading2Bold(context),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      index == 0
                          ? "Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs."
                          : index == 1
                              ? "Get access to limited-time deals and special promotions available only to our valued customers."
                              : " QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.",
                      style: BTextStyle.body2Medium(context)
                          .copyWith(color: BAppColors.grey150Color),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
              itemCount: 3,
            ),
          ),
          index2 != 2
              ? BButton(
                  text: "Next",
                  icon: false,
                  onPressed: () async {
                    setState(() {
                      index2++;
                    });
                    _controller.animateToPage(index2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                )
              : Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
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
                          "Login",
                          style: BTextStyle.button2SemiBold(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BButton(
                        iconName: Images.rightArrowIcon,
                        icon: true,
                        text: "Get Started",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index1) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index2 == index1
                      ? BAppColors.cyanColor
                      : BAppColors.grey100Color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
