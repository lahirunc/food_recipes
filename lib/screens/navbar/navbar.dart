import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_strings.dart';
import 'package:get/route_manager.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/app_colors.dart';
import '../../widgets/icon_text_column_button.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        elevation: 20,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconTextColumnButton(
                text: AppStrings.homeString,
                iconData: Ionicons.home_outline,
                isSelected: false,
                onTap: () {},
              ),
              IconTextColumnButton(
                text: AppStrings.allenamentoString,
                iconData: Icons.fitness_center_outlined,
                isSelected: false,
                onTap: () {},
              ),
              IconTextColumnButton(
                text: AppStrings.nutrizioneString,
                iconData: Icons.apple,
                isSelected: true,
                onTap: () {},
              ),
              IconTextColumnButton(
                text: AppStrings.profiloString,
                iconData: Ionicons.person_circle_outline,
                isSelected: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
