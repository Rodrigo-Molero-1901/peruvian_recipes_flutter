import 'package:peruvian_recipes_flutter/core/network/response/category_response.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

class CategoriesListResponse {
  List<CategoryResponse>? categories;

  CategoriesListResponse({
    this.categories,
  });

  factory CategoriesListResponse.fromJsonList(
      List<Map<String, dynamic>>? docs) {
    return CategoriesListResponse(
      categories: List.from(
        docs.safe.map(CategoryResponse.fromJson),
      ),
    );
  }
}
