import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_screen.dart';
import '../../configuration/dimenconfig.dart';
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
        InputField(
          textInputController: messageInputController,
          onChanged: (String text) => controller.textMessage.value = messageInputController.text,
        ),
      ],
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController textInputController;
  final void Function(String text)? onChanged;
  final String hint = 'write_message_here'.tr;

  InputField({
    super.key,
    required this.textInputController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(hint);
    return Container(
      padding: const EdgeInsets.all(DimenConfig.standardSize),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        autocorrect: true,
        scribbleEnabled: true,
        textCapitalization: TextCapitalization.sentences,
        controller: textInputController,
        onChanged: onChanged,
        cursorOpacityAnimates: true,
        cursorRadius: const Radius.circular(20),
        cursorWidth: 5,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration.collapsed(
          hintText: hint,
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
