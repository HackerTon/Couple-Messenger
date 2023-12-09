import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_screen.dart';
import '../chat/chat_screen.dart';
import 'home_view_model.dart';

class HomeScreen extends BaseScreen {
  final HomeViewModel viewModel = Get.put(HomeViewModel());

  HomeScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () => Get.to(() => const ChatScreen()),
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
