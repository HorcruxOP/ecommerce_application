import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/widgets/features/product_grid_details_widget.dart';
import 'package:ecommerce_application/widgets/features/product_grid_images_widget.dart';
import 'package:flutter/material.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({super.key, required this.list, required this.index});
  final List<ProductModel> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductGridImagesWidget(product: list[index]),
        const SizedBox(height: 10),
        ProductGridDetailsWidget(product: list[index])
      ],
    );
  }
}
