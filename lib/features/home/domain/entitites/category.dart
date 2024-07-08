import 'package:peruvian_recipes_flutter/features/home/data/models/category_model.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/string_extension.dart';

class CategoryEntity {
  final String title;
  final String imagePath;

  CategoryEntity({
    required this.title,
    required this.imagePath,
  });

  factory CategoryEntity.fromModel(CategoryModel model) {
    return CategoryEntity(
      title: model.title.safe,
      imagePath: model.imagePath.safe,
    );
  }
}
