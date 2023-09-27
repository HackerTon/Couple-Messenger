import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_screen.dart';
import '../../configuration/dimenconfig.dart';
import '../../widgets/theme_icon_button.dart';
import '../../widgets/theme_input_field.dart';
import 'chat_view_model.dart';

class ChatScreen extends BaseScreen<ChatViewmodel> {
  final TextEditingController messageInputController = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget body(BuildContext context) {
    Get.put(ChatViewmodel());
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
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(),
              horizontal: BorderSide(),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  textInputController: messageInputController,
                  onChanged: (String text) => controller.textMessage.value = messageInputController.text,
                ),
              ),
              const ThemeIconButton(icon: Icon(Icons.send)),
            ],
          ),
        ),
      ],
    );
  }
}
