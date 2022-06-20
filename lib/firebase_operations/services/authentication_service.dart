import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future createNewUser(String email, String password) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? _firebaseUser = _userCredential.user;

      return _firebaseUser;

    } catch (e) {
      if (kDebugMode) {
        Logger().i("CreateNewUserException: $e");
      }

      return e;
    }
  }
}
