import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peruvian_recipes_flutter/core/network/response/base_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/detailed_recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/shared/constants/app_firebase_constants.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/snapshot_extension.dart';

class RecipeApi {
  final FirebaseFirestore _firebaseFirestore;

  RecipeApi(this._firebaseFirestore);

  Future<Response<MostLikedRecipesListResponse>> getMostLikedRecipes() async {
    MostLikedRecipesListResponse? responseData;
    try {
      final CollectionReference mostLikedRecipesCollection = _firebaseFirestore
          .collection(AppFirebaseConstants.mostLikedCollection);
      final QuerySnapshot querySnapshot =
          await mostLikedRecipesCollection.get();
      responseData =
          MostLikedRecipesListResponse.fromJsonList(querySnapshot.toJsonList);
    } catch (_) {
      rethrow;
    }
    return Response<MostLikedRecipesListResponse>(
      data: responseData,
    );
  }

  Future<Response<RecipesListResponse>> getRecipes() async {
    RecipesListResponse? responseData;
    try {
      final CollectionReference recipesCollection =
          _firebaseFirestore.collection(AppFirebaseConstants.recipesCollection);
      final QuerySnapshot querySnapshot = await recipesCollection.get();
      responseData = RecipesListResponse.fromJsonList(querySnapshot.toJsonList);
    } catch (_) {
      rethrow;
    }
    return Response<RecipesListResponse>(
      data: responseData,
    );
  }

  Future<Response<DetailedRecipeResponse>> getRecipeDetails(
      {required String recipeId}) async {
    DetailedRecipeResponse? responseData;
    try {
      final DocumentReference recipeDocument = _firebaseFirestore
          .collection(AppFirebaseConstants.recipesCollection)
          .doc(recipeId)
          .collection(AppFirebaseConstants.recipeDetailsCollection)
          .doc(AppFirebaseConstants.recipeDetailsDocument);
      final DocumentSnapshot docSnapshot = await recipeDocument.get();
      responseData = DetailedRecipeResponse.fromJson(docSnapshot.toJson);
    } catch (_) {
      rethrow;
    }
    return Response<DetailedRecipeResponse>(
      data: responseData,
    );
  }
}
