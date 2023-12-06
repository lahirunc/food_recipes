import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../controllers/nutrizione/nutrizione_controller.dart';

class NutrizioneCategorySelector extends StatelessWidget {
  const NutrizioneCategorySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.043,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<NutrizioneController>(
          id: 'category',
          init: NutrizioneController(),
          initState: (_) {},
          builder: (_) {
            return SuperTooltip(
              controller: _.superToolTipController,
              elevation: 2,
              showBarrier: false,
              backgroundColor: AppColors.secondary,
              content: const ToolTipConent(),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _.categoryList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _.updateSelectedCategoryIndex(index),
                  child: Text(
                    _.categoryList[index],
                    style: AppStyles.boldText18FStyle(
                      color: _.selectedCategoryIndex == index
                          ? AppColors.primary
                          : AppColors.grey,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: Get.width * 0.08),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ToolTipConent extends StatelessWidget {
  const ToolTipConent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select the desired category',
                style: AppStyles.boldText16FStyle()
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Get.find<NutrizioneController>()
                    .superToolTipController
                    .hideTooltip(),
                icon: const Icon(Icons.close),
              )
            ],
          ),
          const Text(
              'By selecting categories you can view specific recipes. Give it a try!'),
        ],
      ),
    );
  }
}
