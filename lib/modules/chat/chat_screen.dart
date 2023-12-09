import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base_screen.dart';
import '../../configuration/colorconfig.dart';
import '../../model/chat_message.dart';
import '../../widgets/theme_icon_button.dart';
import '../../widgets/theme_input_field.dart';
import 'chat_view_model.dart';

class ChatScreen extends BaseScreen<ChatViewmodel> {
  const ChatScreen({super.key});

  @override
  Widget body(BuildContext context) {
    Get.put(ChatViewmodel());
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MessagesWidget(viewmodel: controller),
        MessageInputWidget(viewmodel: controller),
      ],
    );
  }
}

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key, required this.viewmodel});
  final ChatViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    Widget? listBuilder(BuildContext context, int index) {
      ChatMessageModel chatMessage = viewmodel.chatsRx[index];
      bool isMyself = chatMessage.uid == 'somebody';
      if (isMyself) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                child: Text(chatMessage.uid.characters.toList()[0]),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: ColorConfig.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  chatMessage.message,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: ColorConfig.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                chatMessage.message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              child: Text(chatMessage.uid.characters.toList()[0]),
            ),
          ),
        ],
      );
    }

    Widget separatorBuilder(BuildContext context, int index) => const SizedBox(height: 10);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return ListView.separated(
            controller: viewmodel.messageScrollController,
            itemBuilder: listBuilder,
            itemCount: viewmodel.chatsRx.length,
            separatorBuilder: separatorBuilder,
          );
        }),
      ),
    );
  }
}

class MessageInputWidget extends StatelessWidget {
  const MessageInputWidget({super.key, required this.viewmodel});
  final ChatViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
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
              textInputController: viewmodel.inputTextEditingController,
              onChanged: (String text) => viewmodel.textMessageRx.value = text,
            ),
          ),
          ThemeIconButton(
            icon: const Icon(Icons.send),
            onPressed: viewmodel.actionSend,
          ),
        ],
      ),
    );
  }
}
