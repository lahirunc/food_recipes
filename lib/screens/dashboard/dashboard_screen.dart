import 'package:flutter/material.dart';
import 'package:food_recipes/controllers/navbar/navbar_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../navbar/navbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      id: 'navbar',
      init: NavbarController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: buildAppBar(
              _.screenNameAndIconList[_.selectedIndex].entries.first.key),
          body: Stack(
            children: [
              // screen
              _.screenList[_.selectedIndex],
              // navbar
              Positioned(
                bottom: Get.height * 0.05,
                left: Get.width * 0.03,
                right: Get.width * 0.03,
                child: const Navbar(),
              ),
            ],
          ),
        );
      },
    );
  }

  AppBar buildAppBar(String title) {
    return AppBar(
      // header text
      title: Text(
        title,
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
