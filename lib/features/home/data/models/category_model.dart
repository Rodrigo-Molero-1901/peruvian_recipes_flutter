import 'package:peruvian_recipes_flutter/core/network/response/category_response.dart';

class CategoryModel {
  String? title;
  String? imagePath;

  CategoryModel({
    this.title,
    this.imagePath,
  });

  factory CategoryModel.fromResponse(CategoryResponse response) {
    return CategoryModel(
      title: response.title,
      imagePath: response.imagePath,
    );
  }
}
