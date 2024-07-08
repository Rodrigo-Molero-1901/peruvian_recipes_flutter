import 'package:peruvian_recipes_flutter/core/network/response/categories_list_response.dart';
import 'package:peruvian_recipes_flutter/features/home/data/models/category_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/iterable_extension.dart';

List<CategoryModel> categoriesListModelFromResponse(
    CategoriesListResponse response) {
  if (response.categories.isNull || response.categories.safeIsEmpty) {
    return [];
  }
  return List.from(response.categories.safe);
}
