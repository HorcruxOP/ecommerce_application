import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/services/functions/app_functions.dart';
import 'package:ecommerce_application/services/models/categories_model.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/widgets/features/exclusive_deals_widget.dart';
import 'package:ecommerce_application/widgets/features/home_page_appbar.dart';
import 'package:ecommerce_application/widgets/features/home_page_categories_widget.dart';
import 'package:ecommerce_application/widgets/features/homepage_products_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state is HomePageErrorState) {
          showCustomSnackbar(context, state.error, BAppColors.redColor);
        }
      },
      builder: (context, state) {
        List<ProductModel> productsList =
            context.read<HomePageBloc>().productsList;
        List<CategoriesModel> categoriesList =
            context.read<HomePageBloc>().categoriesList;

        return Scaffold(
          appBar: const HomePageAppbar(),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const ExclusiveDealsWidget(),
              const SizedBox(height: 30),
              HomePageCategoriesWidget(categoriesList: categoriesList),
              const SizedBox(height: 30),
              HomepageProductsListview(list: productsList),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}
