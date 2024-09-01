import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/quantity_controller_widget.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/product_description_widget.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/product_name_header.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/product_ratings_widget.dart';
import 'package:ecommerce_application/widgets/product_details_page_widget/top_rated_widget.dart';
import 'package:flutter/material.dart';

class ProductsDetailsWidget extends StatelessWidget {
  const ProductsDetailsWidget(
      {super.key, required this.product, required this.onpressed});
  final ProductModel product;
  final Function(int) onpressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.57,
      decoration: BoxDecoration(
        color: BAppColors.getSecondaryButtonColor(context),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const TopRatedWidget(),
          const SizedBox(height: 20),
          ProductNameHeader(product: product),
          const SizedBox(height: 10),
          ProductRatingsWidget(product: product),
          const SizedBox(height: 10),
          ProductDescriptionWidget(product: product),
          const SizedBox(height: 20),
          Text(
            "Quantity",
            style: BTextStyle.button1SemiBold(context),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              QuantityControllerWidget(
                onPressed: (value) {
                  onpressed(value);
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
