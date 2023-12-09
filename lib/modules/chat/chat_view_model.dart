import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../configuration/misc_constant.dart';
import '../../model/chat_message.dart';

class ChatViewmodel extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final TextEditingController inputTextEditingController = TextEditingController();
  final ScrollController messageScrollController = ScrollController();
  final RxString textMessageRx = ''.obs;
  final RxList<ChatMessageModel> chatsRx = <ChatMessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeAudioPlayer();
  }

  Future<void> initializeAudioPlayer() async {
    AudioLogger.logLevel = AudioLogLevel.info;
    await audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    await audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  void addChatMessage(String fromWho, String message) => chatsRx.add(ChatMessageModel(fromWho, message));
  void cleartextMessage() {
    inputTextEditingController.clear();
    textMessageRx.value = '';
  }

  Future<void> playPopSound() async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource(popNoiseFilePath));
  }

  void messageJumpToEnd() {
    messageScrollController.animateTo(
      messageScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void actionSend() async {
    if (textMessageRx.isEmpty) return;
    await playPopSound();
    addChatMessage('somebody', textMessageRx.value);
    cleartextMessage();
    messageJumpToEnd();
  }
}
