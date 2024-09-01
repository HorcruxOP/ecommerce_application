import 'package:ecommerce_application/services/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce_application/services/models/categories_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/skeleton_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCategoriesWidget extends StatelessWidget {
  const HomePageCategoriesWidget({super.key, required this.categoriesList});
  final List<CategoriesModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: BTextStyle.heading3Bold(context),
            ),
            GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(HomeNavBarTappedEvent(1));
              },
              child: Text(
                "SEE ALL",
                style: BTextStyle.overlineSemiBold(context)
                    .copyWith(color: BAppColors.cyanColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => Expanded(
              child: categoriesList.isEmpty
                  ? const SkeletonContainer(
                      height: 80,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      margin: EdgeInsets.all(5),
                      radius: 10,
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BAppColors.getSecondaryButtonColor(context),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: BAppColors.getTextColor(context),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              categoriesList[index].icon,
                              style: BTextStyle.heading1Bold(context),
                            ),
                            Text(
                              categoriesList[index].label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: BTextStyle.overlineSemiBold(context),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
