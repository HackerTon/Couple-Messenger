import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  Widget? body(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }
}
