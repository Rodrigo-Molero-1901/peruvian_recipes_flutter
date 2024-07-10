import 'package:peruvian_recipes_flutter/core/network/response/categories_list_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/category_response.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/category_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

CategoryModel _categoryFromResponse(CategoryResponse response) {
  return CategoryModel(
    title: response.title,
    imagePath: response.imagePath,
  );
}

List<CategoryModel> categoriesListModelFromResponse(
    CategoriesListResponse response) {
  if (response.categories.isNull || response.categories.safeIsEmpty) {
    return [];
  }
  return response.categories.safe.map(_categoryFromResponse).toList();
}
