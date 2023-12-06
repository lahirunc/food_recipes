import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipes/utils/app_colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/home/home_screen.dart';
import 'utils/app_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Recipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.white,
        useMaterial3: true,
        fontFamily: AppFonts.lato,
      ),
      home: const HomeScreen(),
    );
  }
}
