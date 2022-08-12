import 'package:flutter/material.dart';
import 'package:scroll_date_picker/utils/colors.dart';

abstract class Ui {
  static BorderRadius circularBorder(double radius) => BorderRadius.all(
        Radius.circular(radius),
      );

  static SizedBox boxHeight(double height) => SizedBox(
        height: height,
      );

  static SizedBox boxWidth(double width) => SizedBox(
        width: width,
      );

  static BoxDecoration circularDecoration(
    double radius, {
    Color color = AppColors.lightGrey,
  }) =>
      BoxDecoration(
        borderRadius: circularBorder(radius),
        color: color,
      );

  static InputBorder authInputBorder() => OutlineInputBorder(
        borderRadius: circularBorder(8),
        borderSide: const BorderSide(
          color: AppColors.lightGrey,
          width: 1,
        ),
      );

  static Widget shadow({required Widget child}) => Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              //25% opacity
              color: Color(0x40E4E4E4),
              blurRadius: 7,
              spreadRadius: -7,
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 11),
            ),
          ],
        ),
        child: child,
      );

  static InputDecoration authInputDecoration(String hint) => InputDecoration(
        border: authInputBorder(),
        enabledBorder: authInputBorder(),
        disabledBorder: authInputBorder(),
        focusedBorder: authInputBorder(),
        contentPadding: const EdgeInsets.all(21),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.midGrey,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: AppColors.white,
      );

  static InputDecoration passwordInputDecoration(String hint, {Widget? icon}) =>
      InputDecoration(
        suffixIcon: icon,
        border: authInputBorder(),
        enabledBorder: authInputBorder(),
        disabledBorder: authInputBorder(),
        focusedBorder: authInputBorder(),
        contentPadding: const EdgeInsets.all(21),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.midGrey,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: AppColors.white,
      );
}
