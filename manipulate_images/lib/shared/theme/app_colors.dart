import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFF0061FF);
  static const Color textsColor = Color(0XFF56636B);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const List<Color> gradientSecondary = [
    Color(0xFF0061FF),
    Color(0xFF2C76EC)
  ];
  static const List<Color> gradientAppBar = [
    Color(0xFF0061ff),
    Color(0xFF60efff),
  ];
  static const List<Color> gradientWarning = [
    Color(0xFFF44336),
    Color(0xFFFF5252),
  ];
}
