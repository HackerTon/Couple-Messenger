import 'package:couple_messaging/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Couple Messaging',
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
