import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

import 'widgets/nutrizione_category_selector.dart';
import 'widgets/nutrizione_main_selector.dart';
import 'widgets/nutrizione_recipes_view.dart';

class NutrizioneScreen extends StatelessWidget {
  const NutrizioneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.height,
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.03),
          // main selector
          const NutrizioneMainSelector(),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.01),
            child: const Divider(color: AppColors.lightGrey),
          ),
          // category selector
          const NutrizioneCategorySelector(),
          const Divider(color: AppColors.lightGrey),
          // recipes
          const NutrizioneRecipesView(),
        ],
      ),
    );
  }
}
