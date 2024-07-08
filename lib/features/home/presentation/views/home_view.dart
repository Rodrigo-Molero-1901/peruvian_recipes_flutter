import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';
import 'package:peruvian_recipes_flutter/shared/constants/app_fb_constants.dart';

class HomeView extends StatefulWidget {
  final UserEntity user;

  const HomeView({
    super.key,
    required this.user,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> getMostLikedRecipes() async {
    final CollectionReference mostLikedRecipesCollection = FirebaseFirestore
        .instance
        .collection(AppFirebaseConstants.mostLikedCollection);
    final QuerySnapshot querySnapshot = await mostLikedRecipesCollection.get();
    final docs = querySnapshot.docs;
    log(docs.toString());
  }

  @override
  void initState() {
    // getMostLikedRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HOLAA ESTOY LOGGEADO'),
      ),
    );
  }
}
