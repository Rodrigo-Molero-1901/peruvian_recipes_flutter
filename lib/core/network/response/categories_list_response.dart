import 'package:peruvian_recipes_flutter/core/network/response/category_response.dart';

class CategoriesListResponse {
  List<CategoryResponse>? categories;

  CategoriesListResponse({
    this.categories,
  });

  factory CategoriesListResponse.fromJsonList(
      List<Map<String, dynamic>>? docs) {
    return CategoriesListResponse(
      categories: List.from(
        (docs ?? []).map(CategoryResponse.fromJson),
      ),
    );
  }
}
