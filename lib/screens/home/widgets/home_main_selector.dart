import 'package:flutter/material.dart';
import 'package:food_recipes/controllers/home/home_controller.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class HomeMainSelector extends StatelessWidget {
  const HomeMainSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.black.withOpacity(0.05),
            width: 1.5,
          ),
        ),
        child: GetBuilder<HomeController>(
          id: 'mainSelector',
          init: HomeController(),
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < _.mainSelectorList.length; i++) ...[
                  GestureDetector(
                    onTap: () => _.selectedMainIndexUpdate(i),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: Get.height * 0.002),
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.068,
                        vertical: Get.height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color:
                            _.selectedMainIndex == i ? AppColors.primary : null,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        _.mainSelectorList[i],
                        style: AppStyles.boldText16FStyle(
                          color: _.selectedMainIndex == i
                              ? AppColors.lightGrey
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
