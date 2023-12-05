import 'package:food_recipes/utils/app_strings.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  //* main selector
  // keep track of the selected index
  int selectedMainIndex = 0;
  // main selector string list
  List<String> mainSelectorList = [
    AppStrings.pianoString,
    AppStrings.listaDellaSpesaString,
    AppStrings.ricetteString,
  ];

  //* main selector
  // updates the main selector's selected index
  void selectedMainIndexUpdate(int index) {
    selectedMainIndex = index;
    update(['mainSelector']);
  }
}
