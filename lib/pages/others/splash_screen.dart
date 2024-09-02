import 'dart:async';
import 'package:ecommerce_application/pages/home.dart';
import 'package:ecommerce_application/pages/others/onboarding_page.dart';
import 'package:ecommerce_application/services/blocs/categories_bloc/categories_bloc.dart';
import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(FetchHomePageEvent());
    context.read<CategoriesBloc>().add(FetchCategoriesEvent());
    return Scaffold(
      body: Builder(builder: (context) {
        Timer(
          const Duration(milliseconds: 1500),
          () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const Home();
                    }

                    return const OnboardingPage();
                  },
                ),
              ),
              (route) => false,
            );
          },
        );
        return Center(
          child: SvgPicture.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? Images.splashDarkIcon
                  : Images.splashIcon),
        );
      }),
    );
  }
}
