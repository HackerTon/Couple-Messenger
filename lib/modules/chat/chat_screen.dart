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

  Widget? listBuilder(BuildContext context, int index) {
    ChatMessageModel chatMessage = viewmodel.chatsRx[index];
    bool isMyself = chatMessage.uid == viewmodel.uid;
    bool isEndOfList = index + 1 == viewmodel.chatsRx.length;
    if (isMyself) {
      return Padding(
        padding: isEndOfList ? const EdgeInsets.only(bottom: 32) : const EdgeInsets.only(),
        child: Row(
          children: [
            const SizedBox(width: 45),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: ColorConfig.primaryColor,
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(15), right: Radius.circular(10)),
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
        ),
      );
    }
    return Padding(
      padding: isEndOfList ? const EdgeInsets.only(bottom: 32) : const EdgeInsets.only(),
      child: Row(
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
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: ColorConfig.primaryColor,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(15), left: Radius.circular(10)),
              ),
              child: Text(
                chatMessage.message,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 45),
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    if (index + 1 > viewmodel.chatsRx.length) {
      return const SizedBox(height: 10);
    }

    if (viewmodel.chatsRx[index + 1].uid != viewmodel.chatsRx[index].uid) {
      return const SizedBox(height: 25);
    }

    return const SizedBox(height: 10);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
      // padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
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
