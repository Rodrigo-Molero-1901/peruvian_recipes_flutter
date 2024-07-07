import 'package:flutter/material.dart';
import 'package:peruvian_recipes_flutter/features/authentication/domain/entitites/user.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HOLAA ESTOY LOGGEADO'),
      ),
    );
  }
}
