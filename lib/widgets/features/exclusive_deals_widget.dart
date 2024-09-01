import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';

class ExclusiveDealsWidget extends StatelessWidget {
  const ExclusiveDealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: const DecorationImage(
                      image: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1599139894727-62676829679b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: BAppColors.blackColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "30% OFF",
                          style: BTextStyle.body2Regular(context)
                              .copyWith(color: BAppColors.whiteColor),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "On Headphones",
                        style: BTextStyle.body2Regular(context)
                            .copyWith(color: BAppColors.whiteColor),
                      ),
                      Text(
                        "Exclusive Sale",
                        style: BTextStyle.heading2Bold(context)
                            .copyWith(color: BAppColors.whiteColor),
                      ),
                    ],
                  ),
                );
  }
}