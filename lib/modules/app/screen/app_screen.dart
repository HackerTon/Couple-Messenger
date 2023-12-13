import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configuration/style.dart';
import '../../../configuration/translation.dart';
import '../../home/home_screen.dart';
import '../viewmodel/app_view_model.dart';

class App extends StatelessWidget {
  App({super.key});
  final AppViewmodel viewModel = Get.put(AppViewmodel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          extensions: themeExtensionLight,
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.white,
          extensions: themeExtensionDark,
        ),
        defaultTransition: Transition.cupertino,
        home: const HomeScreen(),
        translations: Language(),
        locale: const Locale('en'),
      ),
    );
  }
}
