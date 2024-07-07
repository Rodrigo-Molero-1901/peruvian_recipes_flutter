import 'package:flutter/material.dart';

abstract class AppSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      {required BuildContext context}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: FlutterLogo(),
      ),
    );
  }
}
