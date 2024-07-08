import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peruvian_recipes_flutter/core/network/response/base_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/most_liked_recipes_list_response.dart';
import 'package:peruvian_recipes_flutter/shared/constants/app_fb_constants.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/query_snapshot_extension.dart';

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
}
