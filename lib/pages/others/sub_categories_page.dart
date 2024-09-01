import 'package:ecommerce_application/utils/styles.dart';
import 'package:ecommerce_application/widgets/global/b_appbar.dart';
import 'package:flutter/material.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppbar(
        title: "Electronics",
        isBackIcon: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1556306510-31ca015374b0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey,
                ),
              ),
              Text(
                "Laptops",
                style: BTextStyle.body2Medium(context),
              )
            ],
          );
        },
      ),
    );
  }
}
