import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<UserCredential> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      return userCredential;
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }
}
