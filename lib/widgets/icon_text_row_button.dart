import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class IconTextRowButton extends StatelessWidget {
  const IconTextRowButton({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: Get.height * 0.03,
          ),
          SizedBox(width: Get.width * 0.01),
          Text(
            text,
            style: AppStyles.normalText14FStyle(),
          )
        ],
      ),
    );
  }
}
