import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/services/functions/auth_functions.dart';
import 'package:ecommerce_application/services/models/cart_model.dart';
import 'package:ecommerce_application/services/models/ratings_model.dart';

class CartFunctions {
  static Future<List<CartModel>> fetchCart() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("cartList")
          .get();

      List<CartModel> cartList = [];

      for (var doc in response.docs) {
        cartList.add(CartModel.fromMap(doc.data()));
      }

      return cartList;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  static Future<void> removeFromCart(CartModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("cartList")
          .doc(product.productId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addToCart(CartModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("cartList")
          .doc(product.productId)
          .set(product.toMap());
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateQuantity(
      CartModel product, int quantity, int index) async {
    try {
      Ratings ratings = Ratings(
        totalRatings: product.ratings.totalRatings,
        averageRating: product.ratings.averageRating,
      );
      CartModel cartModel = CartModel(
        productId: product.productId,
        quantity: quantity,
        price: product.price,
        ratings: ratings,
        imageUrls: product.imageUrls,
        name: product.name,
        stockQuantity: product.stockQuantity,
        description: product.description,
        subCategoryId: product.subCategoryId,
        categoryId: product.categoryId,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(AuthFunctions.user!.uid)
          .collection("cartList")
          .doc(product.productId)
          .set(cartModel.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
