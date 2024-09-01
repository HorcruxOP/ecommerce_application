// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/images.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePageListWidget extends StatelessWidget {
  const ProfilePageListWidget({
    super.key,
    required this.list,
    required this.text,
    this.onTap,
    this.trailing,
    this.index,
  });
  final List list;
  final int? index;
  final String text;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
            top: 25,
            left: 20,
          ),
          child: Text(
            text,
            style: BTextStyle.captionSemiBold(context),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index1) {
            return Column(
              children: [
                ListTile(
                  onTap: onTap,
                  leading: SvgPicture.asset(
                    list[index1]["icon"],
                    color: BAppColors.grey150Color,
                  ),
                  trailing: index == index1
                      ? trailing
                      : Transform.rotate(
                          angle: pi / 2,
                          child: GestureDetector(
                            child: SvgPicture.asset(
                              Images.arrowIcon,
                              color: BAppColors.grey150Color,
                            ),
                          ),
                        ),
                  title: Text(
                    list[index1]["label"],
                    style: BTextStyle.body2Medium(context)
                        .copyWith(color: BAppColors.grey150Color),
                  ),
                ),
                const Divider()
              ],
            );
          },
          itemCount: list.length,
        ),
      ],
    );
  }
}
