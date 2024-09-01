import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/services/functions/auth_functions.dart';
import 'package:ecommerce_application/services/models/product_model.dart';

class WishlistFunctions {
  static Future<void> addToWishList(ProductModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("wishList")
          .doc(product.productId)
          .set(product.toMap());
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> removeFromWishList(ProductModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("wishList")
          .doc(product.productId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ProductModel>> fetchWishList() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("wishList")
          .get();

      List<ProductModel> wishList = [];
      for (var doc in response.docs) {
        wishList.add(ProductModel.fromMap(doc.data()));
      }
      return wishList;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
