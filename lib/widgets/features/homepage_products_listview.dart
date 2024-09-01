import 'package:ecommerce_application/services/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageProductsListview extends StatelessWidget {
  const HomepageProductsListview({super.key, required this.list});
  final List<ProductModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "Latest Products",
              style: BTextStyle.heading3Bold(context),
            ),
            GestureDetector(
              onTap: () => context
                  .read<HomePageBloc>()
                  .add(AllProductsViewTappedEvent(context, list)),
              child: Text(
                "SEE ALL",
                style: BTextStyle.overlineSemiBold(context)
                    .copyWith(color: BAppColors.cyanColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ProductsGridview(
          list: list,
          length: 10,
        ),
      ],
    );
  }
}
