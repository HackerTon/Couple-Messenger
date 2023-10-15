import 'package:flutter/material.dart';

const List<ThemeExtension<dynamic>> themeExtensionLight = [
  TextFieldStyle(
    backgroundColor: Colors.black,
  ),
];

const List<ThemeExtension<dynamic>> themeExtensionDark = [
  TextFieldStyle(
    backgroundColor: Colors.white,
  ),
];

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
