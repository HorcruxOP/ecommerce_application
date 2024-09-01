// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/main.dart';
import 'package:ecommerce_application/services/functions/auth_functions.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/profile_page_widgets/profile_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BAppColors.cyanColor,
      appBar: AppBar(
        backgroundColor: BAppColors.cyanColor,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1521119989659-a83eee488004?q=80&w=1923&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bhupender Singh",
                                style: BTextStyle.button1SemiBold(context)
                                    .copyWith(color: BAppColors.whiteColor),
                              ),
                              Text(
                                "bhupender7678362318@gmail.com",
                                overflow: TextOverflow.ellipsis,
                                style: BTextStyle.button2SemiBold(context)
                                    .copyWith(color: BAppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () {
                      AuthFunctions.logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                        (route) => false,
                      );
                    },
                    child: SvgPicture.asset(
                      Images.logoutIcon,
                      color: BAppColors.whiteColor,
                      width: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const ProfilePageBody()
    );
  }
}
