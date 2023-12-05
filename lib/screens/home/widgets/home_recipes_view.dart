import 'package:flutter/material.dart';
import 'package:food_recipes/controllers/home/home_controller.dart';
import 'package:food_recipes/models/recipes_model.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../widgets/recipe_card.dart';

class HomeRecipesView extends StatelessWidget {
  const HomeRecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.7,
                mainAxisSpacing: 8.0, // spacing between rows
                crossAxisSpacing: 8.0, // spacing between columns
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
          );
        },
      ),
    );
  }
}
