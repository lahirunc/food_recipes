import 'package:flutter/material.dart';
import 'package:food_recipes/controllers/navbar/navbar_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

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
          child: GetBuilder<NavbarController>(
            id: 'navbar',
            init: NavbarController(),
            initState: (_) {},
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < _.screenNameAndIconList.length; i++) ...[
                    IconTextColumnButton(
                      text: _.screenNameAndIconList[i].entries.first.key,
                      iconData: _.screenNameAndIconList[i].entries.first.value,
                      isSelected: i == _.selectedIndex,
                      onTap: () => _.updateSelectedIndex(i),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
