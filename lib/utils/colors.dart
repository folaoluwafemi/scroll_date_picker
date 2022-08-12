import 'package:flutter/material.dart';

abstract class AppColors {
  ///FF5D00
  static const Color orange = Color(0xFFFF5D00);

  ///FF5D00
  static const Color darkOrange = Color(0xFFC64200);

  ///#FFDECB
  static const Color lightOrange = Color(0xFFFFDECB);

  ///#34A853
  static const Color green = Color(0xFF34A853);

  ///#1F823A
  static const Color darkGreen = Color(0xFF1F823A);

  ///#0066FF
  static const Color blue = Color(0xFF0066FF);

  ///#EA4335
  static const Color darkOrangeVariant = Color(0xFFEA4335);

  ///FF5D00 - 3A4335
  static const List<Color> orangeGradient = [
    orange,
    darkOrangeVariant,
  ];

  ///34A853 - 1F823A
  static const List<Color> greenGradient = [
    green,
    darkGreen,
  ];

  ///#686868
  static const Color darkGrey = Color(0xFF686868);

  ///#7B7B7B
  static const Color textGrey = Color(0xFF7B7B7B);

  ///#7E7E7E
  static const Color iconGrey = Color(0xFF7E7E7E);

  ///#BCBCBC
  static const Color midGrey = Color(0xFFBCBCBC);

  ///#EEEEEE
  static const Color lightGrey = Color(0xFFEEEEEE);

  ///FBBC05
  static const Color yellow = Color(0xFFFBBC05);

  ///242121
  static const Color textBlack = Color(0xFF242121);

  ///000000
  static const Color black = Color(0xFF000000);

  ///FFFFFF
  static const Color white = Color(0xFFFFFFFF);
}
