import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/services/models/cart_model.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/cart_widgets/cart_appbar.dart';
import 'package:ecommerce_application/widgets/cart_widgets/cart_value_details_widget.dart';
import 'package:ecommerce_application/widgets/cart_widgets/cart_widget.dart';
import 'package:ecommerce_application/widgets/cart_widgets/empty_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<CartModel> cartList = context.read<CartBloc>().cartList;
        return Scaffold(
          appBar: const CartAppbar(),
          body: state is CartLoadingState
              ?  Center(
                  child: Text(
                    "Loading...",
                    style: BTextStyle.body2Medium(context),
                  ),
                )
              : cartList.isEmpty
                  ? const EmptyCartWidget()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10),
                            itemCount: cartList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CartWidget(
                                  product: cartList[index], index: index);
                            },
                          ),
                        ),
                        const CartValueDetailsWidget()
                      ],
                    ),
        );
      },
    );
  }
}
