// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_application/services/models/ratings_model.dart';

class CartModel {
  String productId;
  int quantity;
  double price;
  Ratings ratings;
  List imageUrls;
  String name;
  int stockQuantity;
  String description;
  String subCategoryId;
  String categoryId;
  CartModel({
    required this.productId,
    required this.quantity,
    required this.price,
    required this.ratings,
    required this.imageUrls,
    required this.name,
    required this.stockQuantity,
    required this.description,
    required this.subCategoryId,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'quantity': quantity,
      'price': price,
      'ratings': ratings.toJson(),
      'imageUrls': imageUrls,
      'name': name,
      'stockQuantity': stockQuantity,
      'description': description,
      'subCategoryId': subCategoryId,
      'categoryId': categoryId,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productId: map['productId'],
      quantity: map['quantity'],
      price: map['price'] as double,
      ratings: Ratings.fromJson(map['ratings']),
      imageUrls: List.from((map['imageUrls'])),
      name: map['name'],
      stockQuantity: map['stockQuantity'],
      description: map['description'],
      subCategoryId: map['subCategoryId'],
      categoryId: map['categoryId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
