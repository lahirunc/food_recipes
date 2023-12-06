import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:food_recipes/utils/app_styles.dart';

class IconTextColumnButton extends StatelessWidget {
  const IconTextColumnButton({
    super.key,
    required this.text,
    required this.iconData,
    this.onTap,
    this.isSelected,
  });

  final String text;
  final IconData iconData;
  final void Function()? onTap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            color: (isSelected ?? false) ? AppColors.primary : AppColors.grey,
          ),
          Text(
            text,
            style: AppStyles.normalText14FStyle(
              color: (isSelected ?? false) ? AppColors.primary : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
