import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AppViewmodel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeFirebaseAuthListener();
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      if (kReleaseMode) exit(1);
    };
  }

  void initializeFirebaseAuthListener() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        debugPrint('${user?.displayName} signout!');
      } else {
        debugPrint('${user.displayName} signin!');
      }
    });
  }
}
