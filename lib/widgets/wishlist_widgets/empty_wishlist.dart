import 'package:ecommerce_application/services/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.emptyWishlistIcon),
           Text(
            "Your wishlist is empty",
            style: BTextStyle.heading2Bold(context),
          ),
          const SizedBox(height: 20),
          Text(
            "Tap heart button to start saving your favorite items.",
            style: BTextStyle.body2Regular(context)
                .copyWith(color: BAppColors.grey150Color),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          BButton(
            text: "Explore Categories",
            icon: false,
            onPressed: () {
              context.read<HomeBloc>().add(HomeNavBarTappedEvent(1));
              // context.read<WishListBloc>().add(
              //       AllCategoriesTappedEvent(),
              //     );
            },
          )
        ],
      ),
    );
  }
}
