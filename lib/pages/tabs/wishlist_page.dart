import 'package:ecommerce_application/services/blocs/wish_list_bloc/wish_list_bloc.dart';
import 'package:ecommerce_application/services/functions/app_functions.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:ecommerce_application/widgets/wishlist_widgets/empty_wishlist.dart';
import 'package:ecommerce_application/widgets/wishlist_widgets/wishlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListBloc, WishListState>(
      listener: (context, state) {
        if (state is ProductDeletedState) {
          showCustomSnackbar(
            context,
            "Item successfully removed",
            BAppColors.cyanColor,
          );
        }
      },
      builder: (context, state) {
        List<ProductModel> wishList = context.read<WishListBloc>().wishList;
        return Scaffold(
          appBar: const BAppbar(
            title: "Wishlist",
            isBackIcon: false,
          ),
          body: state is WishListLoadingState
              ?  Center(
                  child: Text(
                    "Loading...",
                    style: BTextStyle.body2Medium(context),
                  ),
                )
              : wishList.isEmpty
                  ? const EmptyWishlist()
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: wishList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return WishlistWidget(product: wishList[index]);
                      },
                    ),
        );
      },
    );
  }
}
