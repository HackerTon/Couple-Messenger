import 'package:flutter/material.dart';

class ThemeIconButton extends StatelessWidget {
  final Icon icon;
  final Widget? label;
  final Function()? onPressed;

  const ThemeIconButton({
    super.key,
    required this.icon,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
    );
  }
}
