import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  static void signIn() {
    
  }

  static Future<UserCredential> signInFirebase(
      {required String email, required String password}) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> signUpFirebase({
    required String email,
    required String password,
  }) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
