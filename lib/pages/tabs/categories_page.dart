import 'package:ecommerce_application/pages/others/sub_categories_page.dart';
import 'package:ecommerce_application/services/blocs/categories_bloc/categories_bloc.dart';
import 'package:ecommerce_application/services/models/categories_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:ecommerce_application/widgets/global/skeleton_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<CategoriesModel> categoriesList =
            context.read<CategoriesBloc>().categoriesList;
        return Scaffold(
          appBar: const BAppbar(
            title: "Categories",
            isBackIcon: false,
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 130,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              return categoriesList.isEmpty
                  ? const SkeletonContainer(
                      height: 50,
                      radius: 10,
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubCategoriesPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: BAppColors.getSecondaryButtonColor(context),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: BAppColors.grey50Color,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                categoriesList[index].icon,
                                style: BTextStyle.heading1Bold(context),
                              ),
                              Text(
                                categoriesList[index].label,
                                style: BTextStyle.captionSemiBold(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
        );
      },
    );
  }
}
