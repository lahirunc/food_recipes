import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/route_manager.dart';
import 'package:ionicons/ionicons.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'icon_text.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.instructions,
    this.onTap,
  });

  final int id;
  final String image;
  final String name;
  final String instructions;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: buildImage(),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // name
                      buildName(),
                      SizedBox(height: Get.height * 0.002),
                      // instruction
                      buildInstructions(), SizedBox(height: Get.height * 0.003),
                      const Divider(color: AppColors.lightGrey),
                    ],
                  ),
                ),
                IconText(
                  text: AppStrings.viewString,
                  icon: Ionicons.document_outline,
                  onTap: () {},
                ),
                SizedBox(height: Get.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align buildInstructions() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        instructions.toUpperCase(),
        textAlign: TextAlign.left,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style:
            AppStyles.boldText14FStyle().copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  Align buildName() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        name.toUpperCase(),
        style: AppStyles.boldText14FStyle(color: AppColors.primary),
      ),
    );
  }

  ClipRRect buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(30),
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
            color: AppColors.secondary,
          ),
        ),
        errorWidget: (context, url, error) => Expanded(
          child: Container(
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
