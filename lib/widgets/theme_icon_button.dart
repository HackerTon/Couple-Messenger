import 'package:flutter/material.dart';

class ThemeIconButton extends StatelessWidget {
  final Icon icon;
  final Widget? label;

  const ThemeIconButton({
    super.key,
    required this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: icon,
    );
  }
}
