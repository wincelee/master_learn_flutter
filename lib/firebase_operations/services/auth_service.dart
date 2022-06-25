import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/firebase_operations/database_manager/database_manager.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signUpWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential _userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email:  email, password: password);
 
      User? _firebaseUser = _userCredential.user;
      
      await DatabaseManager().createUserData(name, "Gender Here", 0, _firebaseUser!.uid);

      return _firebaseUser;

    } catch (e) {
      if (kDebugMode) {
        Logger().i("SignUpException: $e");
      }

      return e;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try{

      UserCredential _userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? _firebaseUser = _userCredential.user;

      return _firebaseUser;

    }catch(e){

      if (kDebugMode) {
        Logger().i("SignInException: $e");
      }

      return e;
    }
  }

  Future signOut() async{
    try{
      return _firebaseAuth.signOut();
    }catch(e){

      if (kDebugMode) {
        Logger().i("SignOutException: $e");
      }

      return e;
    }
  }
}
