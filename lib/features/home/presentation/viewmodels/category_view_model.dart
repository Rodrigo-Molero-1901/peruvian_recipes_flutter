import 'package:peruvian_recipes_flutter/features/home/domain/entitites/category.dart';

class CategoryViewModel {
  final String title;
  final String imagePath;

  CategoryViewModel({
    required this.title,
    required this.imagePath,
  });

  CategoryViewModel.fromEntity(CategoryEntity entity)
      : title = entity.title,
        imagePath = entity.imagePath;
}
