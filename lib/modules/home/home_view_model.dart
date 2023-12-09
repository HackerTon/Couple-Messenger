import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../repository/auth_repository.dart';
import '../chat/chat_screen.dart';

class HomeViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  void actionLogin() async {
    UserCredential userCredential = await _authRepository.login();
    GetStorage().write('uid', userCredential.user!.uid);
    Get.off(() => const ChatScreen());
  }
}
