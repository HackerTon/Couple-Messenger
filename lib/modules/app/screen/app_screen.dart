import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configuration/style.dart';
import '../../../configuration/translation.dart';
import '../../home/home_screen.dart';
import '../viewmodel/app_viewmodel.dart';

class App extends StatelessWidget {
  final AppViewmodel viewModel = Get.put(AppViewmodel());

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: ThemeData(
          extensions: themeExtension,
        ),
        defaultTransition: Transition.cupertino,
        home: HomeScreen(),
        translations: Language(),
        locale: const Locale('en'),
      ),
    );
  }
}
