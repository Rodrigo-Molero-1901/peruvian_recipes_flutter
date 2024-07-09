import 'package:flutter/material.dart';

abstract class AppDialog {
  static void showLoadingDialog({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircleAvatar(
            radius: 24.0,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog({required BuildContext context}) {
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop();
    }
  }
}
