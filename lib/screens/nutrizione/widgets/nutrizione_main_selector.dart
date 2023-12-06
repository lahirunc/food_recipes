import 'package:flutter/material.dart';
import 'package:food_recipes/controllers/nutrizione/nutrizione_controller.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class NutrizioneMainSelector extends StatelessWidget {
  const NutrizioneMainSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      // grey background container
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.black.withOpacity(0.05),
            width: 1.5,
          ),
        ),
        child: GetBuilder<NutrizioneController>(
          id: 'mainSelector',
          init: NutrizioneController(),
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // selectables
                for (int i = 0; i < _.mainSelectorList.length; i++) ...[
                  buildSelector(_, i),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  GestureDetector buildSelector(NutrizioneController _, int i) {
    return GestureDetector(
      onTap: () => _.updateSelectedMainIndex(i),
      // selection indicator container
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.002),
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.072,
          vertical: Get.height * 0.01,
        ),
        decoration: BoxDecoration(
          color: _.selectedMainIndex == i ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(30),
        ),
        // text
        child: Text(
          _.mainSelectorList[i],
          style: AppStyles.boldText16FStyle(
            color: _.selectedMainIndex == i ? AppColors.lightGrey : null,
          ),
        ),
      ),
    );
  }
}
