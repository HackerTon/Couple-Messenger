import 'package:couple_messaging/base_screen.dart';
import 'package:couple_messaging/modules/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends BaseScreen {
  final HomeViewModel viewModel = Get.put(HomeViewModel());

  ChatScreen({super.key});

  @override
  Widget? body(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.amber[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/splashscreen.png',
                  fit: BoxFit.contain,
                ),
                const Positioned(child: Text("Couple Messaging"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
