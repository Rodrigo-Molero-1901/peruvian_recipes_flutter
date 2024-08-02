import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peruvian_recipes_flutter/core/network/response/base_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/carousel_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/detailed_recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/recipe_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/shared/constants/app_firebase_constants.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/snapshot_extension.dart';

class RecipeApi {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  RecipeApi(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<Response<CarouselRecipesListResponse>> getCarouselRecipes() async {
    CarouselRecipesListResponse? responseData;
    try {
      final CollectionReference mostLikedRecipesCollection = _firebaseFirestore
          .collection(AppFirebaseConstants.mostLikedCollection);
      final QuerySnapshot querySnapshot =
          await mostLikedRecipesCollection.get();
      responseData =
          CarouselRecipesListResponse.fromJsonList(querySnapshot.toJsonList);
    } catch (_) {
      rethrow;
    }
    return Response<CarouselRecipesListResponse>(
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

  Future<Response<RecipesListResponse>> getFavoriteRecipes() async {
    RecipesListResponse? responseData;
    List<RecipeResponse> favoriteRecipes = [];
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot userDocSnapshot = await _firebaseFirestore
            .collection(AppFirebaseConstants.usersCollection)
            .doc(currentUser.uid)
            .get();
        if (userDocSnapshot.exists) {
          final refs = List<DocumentReference>.from(
            userDocSnapshot.toJson[AppFirebaseConstants.userFavoriteRecipes],
          );
          for (var ref in refs) {
            final DocumentSnapshot recipeSnapshot = await ref.get();
            if (recipeSnapshot.exists) {
              favoriteRecipes
                  .add(RecipeResponse.fromJson(recipeSnapshot.toJson));
            }
          }
        }
      }
    } catch (_) {
      rethrow;
    }
    responseData = RecipesListResponse(recipes: favoriteRecipes);
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

  Future<bool> saveToFavorite({required String recipeId}) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final DocumentReference userDocument = _firebaseFirestore
            .collection(AppFirebaseConstants.usersCollection)
            .doc(currentUser.uid);
        await userDocument.update({
          AppFirebaseConstants.userFavoriteRecipes: FieldValue.arrayUnion([
            _firebaseFirestore
                .collection(AppFirebaseConstants.recipesCollection)
                .doc(recipeId),
          ])
        });
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  Future<bool> removeFromFavorite({required String recipeId}) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        final DocumentReference userDocument = _firebaseFirestore
            .collection(AppFirebaseConstants.usersCollection)
            .doc(currentUser.uid);
        await userDocument.update({
          AppFirebaseConstants.userFavoriteRecipes: FieldValue.arrayUnion([
            _firebaseFirestore
                .collection(AppFirebaseConstants.recipesCollection)
                .doc(recipeId),
          ])
        });
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }
}
