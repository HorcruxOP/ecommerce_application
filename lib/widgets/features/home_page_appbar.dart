// ignore_for_file: deprecated_member_use

import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BAppColors.getSecondaryButtonColor(context),
      scrolledUnderElevation: 5,
      shadowColor: BAppColors.grey50Color,
      title: SvgPicture.asset(
        Theme.of(context).brightness == Brightness.dark
            ? Images.quickmartDarkIcon
            : Images.quickmartIcon,
      ),
      surfaceTintColor: Colors.transparent,
      actions: [
        GestureDetector(
          onTap: () =>
              context.read<HomePageBloc>().add(SearchIconTappedEvent()),
          child: SvgPicture.asset(
            Images.searchIcon,
            color: BAppColors.getTextColor(context),
          ),
        ),
        GestureDetector(
          onTap: () {
            // DbFunctions.update();
          },
          child: Container(
            width: 35,
            height: 35,
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
