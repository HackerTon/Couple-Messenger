import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_screen.dart';
import '../../configuration/dimenconfig.dart';
import '../../widgets/theme_icon_button.dart';
import '../../widgets/theme_input_field.dart';
import 'chat_view_model.dart';

class ChatScreen extends BaseScreen<ChatViewmodel> {
  const ChatScreen({super.key});

  @override
  Widget body(BuildContext context) {
    Get.put(ChatViewmodel());
    ThemeData themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: DimenConfig.height(20),
              color: Colors.green,
              child: Obx(() {
                if (controller.textMessage.isEmpty) return Container();
                return Text(controller.textMessage());
              }),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.8,
                color: themeData.primaryColor,
              ),
              bottom: BorderSide(
                width: 7.5,
                color: themeData.primaryColor,
              ),
              right: BorderSide(
                width: 7.5,
                color: themeData.primaryColor,
              ),
              left: BorderSide(
                width: 1.8,
                color: themeData.primaryColor,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  onChanged: (String text) => controller.textMessage.value = text,
                ),
              ),
              ThemeIconButton(
                icon: const Icon(Icons.send),
                onPressed: () => Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
