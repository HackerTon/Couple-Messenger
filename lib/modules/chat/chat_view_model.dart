import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_storage/get_storage.dart';

import '../../configuration/misc_constant.dart';
import '../../model/chat_message.dart';
import '../../repository/chat_repository.dart';

class ChatViewmodel extends GetxController {
  final ChatRespository _chatRespository = ChatRespository();
  final AudioPlayer audioPlayer = AudioPlayer();
  final TextEditingController inputTextEditingController = TextEditingController();
  final ScrollController messageScrollController = ScrollController();
  final RxString textMessageRx = ''.obs;
  final RxList<ChatMessageModel> chatsRx = <ChatMessageModel>[].obs;
  late final String uid;

  @override
  void onInit() {
    super.onInit();
    initializeUid();
    initializeAudioPlayer();
    initializeChatMessageStream();
  }

  void initializeUid() => uid = GetStorage().read('uid');

  Future<void> initializeAudioPlayer() async {
    AudioLogger.logLevel = AudioLogLevel.info;
    await audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    await audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  void initializeChatMessageStream() async {
    // Get existing messages and load it
    final existingMessages = await _chatRespository.getMessages();
    chatsRx.addAll(existingMessages);
    messageJumpToEnd();

    // Attach listener to chatMessages
    _chatRespository.getMessagesStream(existingMessages.last.key).listen((chatMessage) {
      chatsRx.add(chatMessage);
    });
  }

  Future<void> addChatMessage(String fromwho, String message) async {
    await _chatRespository.sendMessage(fromwho, message);
  }

  void cleartextMessage() {
    inputTextEditingController.clear();
    textMessageRx.value = '';
  }

  Future<void> playPopSound() async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource(popNoiseFilePath));
  }

  void messageJumpToEnd() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        messageScrollController.animateTo(
          messageScrollController.position.maxScrollExtent + 150,
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn,
        );
      },
    );
  }

  void actionSend() async {
    if (textMessageRx.trim().isEmpty) return;
    await playPopSound();
    await addChatMessage(uid, textMessageRx.value);
    messageJumpToEnd();
    cleartextMessage();
  }
}
