// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/services/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/constants.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(FetchCartEvent());
    context.read<WishListBloc>().add(FetchWishListEvent());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int index = 0;
        if (state is HomeChildChangedState) {
          index = state.index;
        }
        return Scaffold(
          body: pages[index],
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
