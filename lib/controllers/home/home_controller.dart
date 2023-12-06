import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipes/models/recipes_model.dart';
import 'package:food_recipes/utils/app_strings.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/categories_model.dart';

class HomeController extends GetxController with StateMixin {
  //? variables
  //* main selector
  // keep track of the selected index
  int selectedMainIndex = 0;
  // main selector string list
  List<String> mainSelectorList = [
    AppStrings.pianoString,
    AppStrings.listaDellaSpesaString,
    AppStrings.ricetteString,
  ];

  //* category selector
  // keep track of the selected index
  int selectedCategoryIndex = 0;
  // category string list
  List<String> categoryList = [AppStrings.allString];

  //* recipes
  List<RecipesModel> recipesList = [];

  //? functions
  @override
  Future<void> onInit() async {
    await Future.wait([
      getCategories(),
      filterRecipes(selectedCategoryIndex),
    ]).then((value) => {
          update(['category']),
          change(
            [],
            status:
                recipesList.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
          ),
        });

    super.onInit();
  }

  //* main selector
  // updates the main selector's selected index
  void updateSelectedMainIndex(int index) {
    selectedMainIndex = index;
    update(['mainSelector']);
  }

  //* category selector
  // read the categories json and populate the data into category list
  Future<void> getCategories() async {
    try {
      String? input =
          await rootBundle.loadString('assets/data/categories.json');

      if (input.isNotEmpty) {
        final data = CategoriesModel.fromJson(jsonDecode(input));

        for (Categories category in (data.categories ?? [])) {
          if (category.name != null) categoryList.add(category.name!);
        }
      }
    } on Exception catch (e) {
      debugPrint('HomeController[getCategories]: $e');
    }
  }

  // update the selected category index
  void updateSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update(['category']);

    filterRecipes(index);
  }

  //* recipes
  // read the recipes json and populate the data into recipes list
  Future<void> getRecipes() async {
    try {
      String? input = await rootBundle.loadString('assets/data/recipes.json');

      if (input.isNotEmpty) {
        final recipes = jsonDecode(input)['recipes'];

        recipesList.clear();

        for (Map<String, dynamic> recipe in recipes) {
          if (recipe.isNotEmpty) {
            recipesList.add(RecipesModel.fromJson(recipe));
          }
        }
      }
    } on Exception catch (e) {
      change([], status: RxStatus.error());
      debugPrint('HomeController[getRecipes]: $e');
    }
  }

  Future<void> filterRecipes(int categoryIndex) async {
    change([], status: RxStatus.loading());

    String catergory = categoryList[categoryIndex];

    await getRecipes();

    if (catergory.toLowerCase() != 'all') {
      recipesList = recipesList
          .where((element) =>
              element.category?.toLowerCase() == catergory.toLowerCase())
          .toList();
    }

    change(
      [],
      status: recipesList.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
    );
  }
}
