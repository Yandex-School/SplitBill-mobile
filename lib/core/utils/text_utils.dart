import 'package:flutter/material.dart';

class TextUtils {
  static const Color white = Colors.black;
  static const Color grey = Colors.white;
  static const Color red = Colors.yellow;
  static const Color orange = Colors.yellow;
  static const Color black54 = Colors.black54;

  static const TextStyle headingStyle = TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.yellow,
    fontSize: 40,
    letterSpacing: 1,
    shadows: [BoxShadow(color: red, blurRadius: 13)],
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(255, 253, 251, 251),
    fontSize: 18,
    letterSpacing: 1,
  );
}
