import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static const color = Color(0xFF01B4E4);

  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(color),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
