// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/pages/tabs/cart_page.dart';
import 'package:ecommerce_application/pages/tabs/categories_page.dart';
import 'package:ecommerce_application/pages/tabs/wishlist_page.dart';
import 'package:ecommerce_application/pages/tabs/home_page.dart';
import 'package:ecommerce_application/pages/tabs/profile_page.dart';
import 'package:ecommerce_application/services/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Widget> _pages = const [
    HomePage(),
    CategoriesPage(),
    CartPage(),
    WishlistPage(),
    ProfilePage(),
  ];
  final List<Map<String, dynamic>> navBarData = const [
    {
      "label": "Home",
      "activeIcon": Images.homeFilledIcon,
      "icon": Images.homeIcon,
    },
    {
      "label": "Categories",
      "activeIcon": Images.exploreFilledIcon,
      "icon": Images.exploreIcon,
    },
    {
      "label": "My Cart",
      "activeIcon": Images.cartFilledIcon,
      "icon": Images.cartIcon,
    },
    {
      "label": "Wishlist",
      "activeIcon": Images.heartFilledIcon,
      "icon": Images.heartIcon,
    },
    {
      "label": "Profile",
      "activeIcon": Images.profileFilledIcon,
      "icon": Images.profileIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int index = 0;
        if (state is HomeChildChangedState) {
          index = state.index;
        }
        return Scaffold(
          body: _pages[index],
          bottomSheet: BottomNavigationBar(
            currentIndex: index,
            elevation: 10,
            enableFeedback: true,
            selectedLabelStyle: BTextStyle.captionSemiBold(context),
            unselectedLabelStyle: BTextStyle.captionRegular(context),
            onTap: (value) {
              context.read<HomeBloc>().add(HomeNavBarTappedEvent(value));
            },
            items: List.generate(
              navBarData.length,
              (index1) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  navBarData[index1]["icon"],
                  color: BAppColors.grey150Color,
                ),
                label: navBarData[index1]["label"],
                activeIcon: SvgPicture.asset(
                  navBarData[index1]["activeIcon"],
                  color: BAppColors.cyanColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
