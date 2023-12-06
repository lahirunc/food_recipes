import 'package:flutter/material.dart';
import 'package:food_recipes/controllers/home/home_controller.dart';
import 'package:food_recipes/models/recipes_model.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:food_recipes/utils/app_strings.dart';
import 'package:food_recipes/utils/app_styles.dart';
import 'package:get/get.dart';

import '../../../widgets/recipe_card.dart';

class HomeRecipesView extends GetView<HomeController> {
  const HomeRecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: controller.obx(
        (state) => buildRecipes(),
        onLoading: const Center(
            child: CircularProgressIndicator(color: AppColors.primary)),
        onEmpty: Center(
            child: Text(
          AppStrings.noRecipesFoundString,
          style: AppStyles.boldText18FStyle(),
        )),
        onError: (error) => const Text(AppStrings.somethingWentWrongString),
      ),
    );
  }

  GetBuilder<HomeController> buildRecipes() {
    return GetBuilder<HomeController>(
      id: 'recipes',
      init: HomeController(),
      initState: (_) {},
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () => _.filterRecipes(_.selectedCategoryIndex),
            color: AppColors.primary,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.7,
                mainAxisSpacing: Get.width * 0.012,
                crossAxisSpacing: Get.height * 0.01,
              ),
              itemCount: _.recipesList.length,
              itemBuilder: (context, index) {
                final RecipesModel recipe = _.recipesList[index];

                return RecipeCard(
                  id: recipe.id!,
                  name: recipe.name!,
                  image: recipe.image!,
                  instructions: recipe.instructions!,
                  onTap: () {},
                );
              },
            ),
          ),
        );
      },
    );
  }
}
