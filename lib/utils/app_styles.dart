import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';

class AppStyles {
  static TextStyle headingTextStyle({Color color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );

  static TextStyle boldText16FStyle({Color color = AppColors.black}) =>
      TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
}
