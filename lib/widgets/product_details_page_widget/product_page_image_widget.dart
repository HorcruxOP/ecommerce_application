import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/services/models/product_model.dart';
import 'package:ecommerce_application/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductPageImageWidget extends StatefulWidget {
  const ProductPageImageWidget({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductPageImageWidget> createState() => _ProductPageImageWidgetState();
}

class _ProductPageImageWidgetState extends State<ProductPageImageWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: PageView.builder(
            itemCount: widget.product.imageUrls.length,
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      widget.product.imageUrls[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.only(bottom: size.height * 0.045),
              );
            },
          ),
        ),
        Positioned(
          bottom: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            height: 16,
            decoration: BoxDecoration(
              color: BAppColors.getSecondaryButtonColor(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                widget.product.imageUrls.length,
                (index1) => Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == index1
                        ? BAppColors.cyanColor
                        : BAppColors.grey150Color,
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
