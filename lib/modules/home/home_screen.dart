import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_screen.dart';
import 'home_view_model.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget body(BuildContext context) {
    Get.put(HomeViewModel());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: controller.actionLogin,
              child: Image.asset(
                key: const Key('image'),
                'assets/image/splashscreen.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
