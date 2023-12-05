import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

import '../../../controllers/home/home_controller.dart';

class HomeCategorySelector extends StatelessWidget {
  const HomeCategorySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.04,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HomeController>(
          id: 'category',
          init: HomeController(),
          initState: (_) {},
          builder: (_) {
            return ListView.separated(
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
            );
          },
        ),
      ),
    );
  }
}
