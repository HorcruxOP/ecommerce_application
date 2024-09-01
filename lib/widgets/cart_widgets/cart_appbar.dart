import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:ecommerce_application/widgets/global/b_button.dart';
import 'package:flutter/material.dart';

class CartAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BAppbar(
      isBackIcon: false,
      title: "My Cart",
      actions: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: BAppColors.whiteColor,
              constraints: const BoxConstraints(maxHeight: 250),
              context: context,
              builder: (context) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Voucher Code",
                      style: BTextStyle.body1Medium(context),
                    ),
                    BButton(
                      icon: false,
                      text: "Apply",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(
            "Voucher Code",
            style: BTextStyle.body2Medium(context)
                .copyWith(color: BAppColors.cyanColor),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
