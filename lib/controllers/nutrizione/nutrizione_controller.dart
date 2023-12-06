import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipes/models/recipes_model.dart';
import 'package:food_recipes/utils/app_strings.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../models/categories_model.dart';

class NutrizioneController extends GetxController with StateMixin {
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
  final superToolTipController = SuperTooltipController();

  //* recipes
  List<RecipesModel> recipesList = [];

  //? functions
  @override
  Future<void> onInit() async {
    // running both the functions in parallel
    await Future.wait([
      getCategories(),
      filterRecipes(selectedCategoryIndex),
    ]).then((value) async {
      // updating category
      update(['category']);
      // updating the recipes list
      change(
        [],
        status: recipesList.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );

      // showing the tooltip
      superToolTipController.showTooltip().then((value) async =>
          await Future.delayed(const Duration(seconds: 5))
              .then((value) => superToolTipController.hideTooltip()));
    });

    super.onInit();
  }

  @override
  void onClose() {
    superToolTipController.dispose();

    super.onClose();
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
      // reading the json as a string from the assests folder
      String? input =
          await rootBundle.loadString('assets/data/categories.json');

      // checking if the read data is not empty.
      if (input.isNotEmpty) {
        final data = CategoriesModel.fromJson(jsonDecode(input));

        // mapping the data into the category list
        for (Categories category in (data.categories ?? [])) {
          if (category.name != null) categoryList.add(category.name!);
        }
      }
    } on Exception catch (e) {
      debugPrint('NutrizioneController[getCategories]: $e');
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
      // reading the json as a string from the assests folder
      String? input = await rootBundle.loadString('assets/data/recipes.json');

      // checking if the read data is not empty.
      if (input.isNotEmpty) {
        // clearing the exisitng data
        recipesList.clear();

        // decoding the data
        final recipes = jsonDecode(input)['recipes'];

        // mapping the data into the recipe list
        for (Map<String, dynamic> recipe in recipes) {
          if (recipe.isNotEmpty) {
            recipesList.add(RecipesModel.fromJson(recipe));
          }
        }
      }
    } on Exception catch (e) {
      change([], status: RxStatus.error());
      debugPrint('NutrizioneController[getRecipes]: $e');
    }
  }

  // read the recipes and then filter according to the given category.
  Future<void> filterRecipes(int categoryIndex) async {
    change([], status: RxStatus.loading());

    // getting the category value
    String catergory = categoryList[categoryIndex];

    // reading the recipes
    await getRecipes();

    // filtering the recipes. if all selected then show everything
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
