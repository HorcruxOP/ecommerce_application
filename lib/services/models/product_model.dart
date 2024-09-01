import 'package:ecommerce_application/services/models/ratings_model.dart';

class ProductModel {
  String productId;
  double price;
  Ratings ratings;
  List imageUrls;
  String name;
  int stockQuantity;
  String description;
  String subCategoryId;
  String categoryId;

  ProductModel({
    required this.productId,
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

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'],
      price: map['price'] as double,
      ratings: Ratings.fromJson(map['ratings']),
      imageUrls: map['imageUrls'],
      name: map['name'],
      stockQuantity: map['stockQuantity'],
      description: map['description'],
      subCategoryId: map['subCategoryId'],
      categoryId: map['categoryId'],
    );
  }
}

// class Ratings {
//   int? totalRatings;
//   double? averageRating;

//   Ratings({this.totalRatings, this.averageRating});

//   Ratings.fromJson(Map<String, dynamic> json) {
//     totalRatings = json['totalRatings'];
//     averageRating = json['averageRating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['totalRatings'] = totalRatings;
//     data['averageRating'] = averageRating;
//     return data;
//   }
// }
