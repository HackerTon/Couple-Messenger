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
        theme: ThemeData(
          extensions: const <ThemeExtension<dynamic>>[
            TextFieldStyle(backgroundColor: Colors.black),
          ],
        ),
        defaultTransition: Transition.cupertino,
        home: HomeScreen(),
        translations: Language(),
        locale: const Locale('en'),
      ),
    );
  }
}

class TextFieldStyle extends ThemeExtension<TextFieldStyle> {
  final Color backgroundColor;

  const TextFieldStyle({required this.backgroundColor});

  @override
  ThemeExtension<TextFieldStyle> copyWith({Color? backgroundColor}) => TextFieldStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  ThemeExtension<TextFieldStyle> lerp(covariant ThemeExtension<TextFieldStyle>? other, double t) {
    if (other is! TextFieldStyle) {
      return this;
    }

    return TextFieldStyle(backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor);
  }
}
