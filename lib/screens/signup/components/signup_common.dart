import 'package:flutter/material.dart';

Widget elevatedButtonForSignup({required void Function()? onPressed}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fixedSize: const Size(300, 50),
      elevation: 10,
      shadowColor: Colors.black,
      backgroundColor: Colors.deepPurple.shade400,
    ),
    onPressed: onPressed,
    child: const Text('S I G N - U P',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        )),
  );
}
