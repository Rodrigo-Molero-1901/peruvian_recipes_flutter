import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peruvian_recipes_flutter/core/network/response/base_response.dart';
import 'package:peruvian_recipes_flutter/core/network/response/categories_list_response.dart';
import 'package:peruvian_recipes_flutter/shared/constants/app_firebase_constants.dart';
import 'package:peruvian_recipes_flutter/shared/extensions/snapshot_extension.dart';

class CategoryApi {
  final FirebaseFirestore _firebaseFirestore;

  CategoryApi(this._firebaseFirestore);

  Future<Response<CategoriesListResponse>> getCategories() async {
    CategoriesListResponse? responseData;
    try {
      final CollectionReference categoriesCollection = _firebaseFirestore
          .collection(AppFirebaseConstants.categoriesCollection);
      final QuerySnapshot querySnapshot = await categoriesCollection.get();
      responseData =
          CategoriesListResponse.fromJsonList(querySnapshot.toJsonList);
    } catch (_) {
      rethrow;
    }
    return Response<CategoriesListResponse>(
      data: responseData,
    );
  }
}
