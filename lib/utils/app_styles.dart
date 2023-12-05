import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';

class AppStyles {
  //* bold
  static TextStyle headingTextStyle({Color? color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );

  static TextStyle boldText18FStyle({Color? color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  static TextStyle boldText16FStyle({Color? color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle boldText14FStyle({Color? color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );

  //* normal
  static TextStyle normalText14FStyle({Color? color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontSize: 14,
      );
}
