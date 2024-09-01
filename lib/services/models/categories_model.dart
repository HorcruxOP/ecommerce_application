import 'dart:convert';

class CategoriesModel {
  String categoryId;
  String icon;
  String label;
  CategoriesModel({
    required this.categoryId,
    required this.icon,
    required this.label,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'icon': icon,
      'label': label,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      categoryId: map['categoryId'] as String,
      icon: map['icon'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
