import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:food_recipes/utils/app_strings.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:ionicons/ionicons.dart';

import 'widgets/home_category_selector.dart';
import 'widgets/home_main_selector.dart';
import 'widgets/home_recipes_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(),
      body: SizedBox(
        width: Get.height,
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.03),
            // main selector
            const HomeMainSelector(),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.01),
              child: const Divider(color: AppColors.lightGrey),
            ),
            // category selector
            const HomeCategorySelector(),
            const Divider(color: AppColors.lightGrey),
            // category selector
            const HomeRecipesView(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      // header text
      title: Text(
        AppStrings.nutrizioneString,
        style: AppStyles.headingTextStyle(),
      ),
      centerTitle: true,
      actions: [
        // settings icon
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Ionicons.settings_outline,
            color: AppColors.black,
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: AppColors.white,
    );
  }
}
