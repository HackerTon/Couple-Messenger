import '../../../configuration/translation.dart';
import '../../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: ThemeData.light(),
        defaultTransition: Transition.cupertino,
        home: HomeScreen(),
        translations: Language(),
        locale: const Locale('en'),
      ),
    );
  }
}
