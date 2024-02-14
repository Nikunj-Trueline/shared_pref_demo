import 'package:flutter/material.dart';

class ColorsClass {
  static final primaryColor = Colors.deepPurple.shade500;

  static final gradientForBackground = LinearGradient(
    colors: [
      Colors.deepPurple.shade500,
      Colors.deepPurple.shade400,
      Colors.deepPurple.shade300,
    ],
  );

  static final gradientForBackground1 = LinearGradient(
    colors: [
      Colors.deepPurple.shade300,
      Colors.deepPurple.shade400,
      Colors.deepPurple.shade500,
      // Colors.deepPurple.shade400,
      // Colors.deepPurple.shade300,
    ],
  );

  static final splashGradient = LinearGradient(
    colors: [
      Colors.deepPurple.shade900,
      Colors.deepPurple.shade500,
      Colors.deepPurple.shade300,
    ],
  );
}
