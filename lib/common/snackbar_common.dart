import 'package:flutter/material.dart';

void snackBarCommon({required String text, required BuildContext context}) {
  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content:
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 20)),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.deepPurple.shade500,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
