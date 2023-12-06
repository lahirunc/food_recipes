import 'package:flutter/material.dart';
import 'package:food_recipes/screens/allenamento/allenamento_screen.dart';
import 'package:food_recipes/screens/home/home_screen.dart';
import 'package:food_recipes/screens/nutrizione/nutrizione_screen.dart';
import 'package:food_recipes/screens/profilo/profilo_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/app_strings.dart';

class NavbarController extends GetxController {
  //? variables
  // selected index
  int selectedIndex = 2;

  // screen list
  List<Widget> screenList = [
    const HomeScreen(),
    const AllenamentoScreen(),
    const NutrizioneScreen(),
    const ProfiloScreen(),
  ];

  // list of screen names and icons
  List<Map<String, IconData>> screenNameAndIconList = [
    {AppStrings.homeString: Ionicons.home_outline},
    {AppStrings.allenamentoString: Icons.fitness_center_outlined},
    {AppStrings.nutrizioneString: Icons.apple},
    {AppStrings.profiloString: Ionicons.person_circle_outline},
  ];

  // updates the selected index
  void updateSelectedIndex(int i) {
    selectedIndex = i;
    update(['navbar']);
  }
}
