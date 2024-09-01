import 'package:ecommerce_application/pages/profile_pages/faq_page.dart';
import 'package:ecommerce_application/services/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/widgets/features/profile_page_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  final List personalInfo = const [
    {
      "label": "Shipping Address",
      "icon": Images.shippingBoxIcon,
    },
    {
      "label": "Payment Method",
      "icon": Images.cardIcon,
    },
    {
      "label": "Order History",
      "icon": Images.orderHistoryIcon,
    },
  ];

  final List supportInfo = const [
    {
      "label": "Privacy Policy",
      "icon": Images.privacyIcon,
    },
    {
      "label": "Terms & Conditions",
      "icon": Images.tAndCIcon,
    },
    {
      "label": "FAQs",
      "icon": Images.faqIcon,
    },
  ];

  final List accountManagementInfo = const [
    {
      "label": "Change Password",
      "icon": Images.lockIcon,
    },
    {
      "label": "Dark Theme",
      "icon": Images.mobileIcon,
    },
  ];
  bool switchValue = false;
  @override
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        switchValue = Theme.of(context).brightness == Brightness.dark;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BAppColors.getSecondaryButtonColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView(
        children: [
          ProfilePageListWidget(
            list: personalInfo,
            text: "Personal Information",
          ),
          ProfilePageListWidget(
            list: supportInfo,
            text: "Support & Information",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FaqPage(),
                ),
              );
            },
          ),
          ProfilePageListWidget(
            list: accountManagementInfo,
            text: "Account Management",
            index: 1,
            trailing: Switch(
              value: switchValue,
              activeColor: BAppColors.cyanColor,
              inactiveTrackColor: BAppColors.grey150Color,
              thumbColor: const WidgetStatePropertyAll(BAppColors.whiteColor),
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                  context
                      .read<HomeBloc>()
                      .add(ThemeModeChangeEvent(switchValue));
                });
              },
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
