import 'package:firebase_database/firebase_database.dart';

import '../model/chat_message.dart';

class ChatRespository {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  ChatMessageModel toChatMessage(Object chatMessageObject) {
    Map<Object?, Object?> chatMessageMap = chatMessageObject as Map<Object?, Object?>;
    return ChatMessageModel(chatMessageMap['uid'].toString(), chatMessageMap['message'].toString());
  }

  Future<List<ChatMessageModel>> getMessages() async {
    DatabaseEvent event = await _firebaseDatabase.ref().once();
    return event.snapshot.children.map((e) => toChatMessage(e.value!)).toList();
  }

  Stream<ChatMessageModel> getMessagesStream() {
    return _firebaseDatabase.ref().onChildAdded.map((event) {
      return toChatMessage(event.snapshot.value!);
    });
  }

  Future<void> sendMessage(String fromwho, String message) async {
    DatabaseReference ref = _firebaseDatabase.ref();
    await ref.push().set({
      'uid': fromwho,
      'message': message,
    });
  }
}
