import 'package:ecommerce_application/services/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewDetailsWidget extends StatelessWidget {
  const ReviewDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Shipping Address",
          style: BTextStyle.body1Medium(context),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Full Name",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                maxLines: 1,
                "Bhupender Singh",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: BTextStyle.body2Regular(context)
                    .copyWith(color: BAppColors.grey150Color),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mobile Number",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                maxLines: 1,
                "+91 7678362318",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: BTextStyle.body2Regular(context)
                    .copyWith(color: BAppColors.grey150Color),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Address",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                maxLines: 1,
                "Address",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: BTextStyle.body2Regular(context)
                    .copyWith(color: BAppColors.grey150Color),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        Text(
          "Order Info",
          style: BTextStyle.body1Medium(context),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
            Text(
              "\$${context.read<CartBloc>().total.toString()}",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Cost",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
            Text(
              "\$10.00",
              style: BTextStyle.body2Regular(context)
                  .copyWith(color: BAppColors.grey150Color),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: BTextStyle.body1Medium(context),
            ),
            Text(
              "\$${(context.read<CartBloc>().total + 10.00).toString()}",
              style: BTextStyle.body1Medium(context),
            ),
          ],
        ),
      ],
    );
  }
}
