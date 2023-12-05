import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:food_recipes/utils/app_strings.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:ionicons/ionicons.dart';

import 'widgets/home_main_selector.dart';

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
            // main selector
            const HomeMainSelector(),
            const Divider(),
            // category selector
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(color: AppColors.black),
                child: const Expanded(
                  child: Row(),
                ),
              ),
            ),
            const Divider(),
            // category selector
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(color: AppColors.black),
                child: const Expanded(
                  child: Row(),
                ),
              ),
            ),
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
