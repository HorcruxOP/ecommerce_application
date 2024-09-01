import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/widgets/global/product_grid_widget.dart';
import 'package:ecommerce_application/widgets/global/skeleton_container.dart';
import 'package:flutter/material.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.list, this.length});
  final List<ProductModel> list;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: length ?? list.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisExtent: 270,
      ),
      itemBuilder: (context, index) {
        return list.isEmpty
            ? const SkeletonContainer(
                margin: EdgeInsets.only(bottom: 20),
                radius: 25,
              )
            : ProductGridWidget(list: list, index: index);
      },
    );
  }
}
