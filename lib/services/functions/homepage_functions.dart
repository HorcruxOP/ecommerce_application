import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/services/models/categories_model.dart';
import 'package:ecommerce_application/services/models/product_model.dart';

class HomepageFunctions {
  static Future<List<ProductModel>> fetchProductsList() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection("products").get();
      List<ProductModel> productsList = [];
      for (var doc in querySnapshot.docs) {
        productsList.add(ProductModel.fromMap(doc.data()));
      }
      return productsList;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  static Future<List<CategoriesModel>> fetchCategories() async {
    try {
      var querySnapshot =
          await FirebaseFirestore.instance.collection("categories").get();
      List<CategoriesModel> categoriesList = [];
      for (var doc in querySnapshot.docs) {
        categoriesList.add(CategoriesModel.fromMap(doc.data()));
      }
      return categoriesList;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
