import 'package:be_friend/common/global_loader_provider/global_loader_provider.dart';
import 'package:be_friend/common/widgets/app_alert.dart';
import 'package:be_friend/features/authenticate/providers/auth_provider.dart';
import 'package:be_friend/features/authenticate/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  final WidgetRef ref;
  const AuthController({required this.ref});

  void handelSignIn() async {
    final userState = ref.watch(authProvider);

    final email = userState.email;
    final password = userState.password;
    if (!_checkEmailPassword(email, password)) return;

    try {
      final UserCredential userCredential = await AuthRepo.signInFirebase(email: email!, password: password!);
      


    } on FirebaseAuthException catch (e) {
      switch(e.code) {
        case 'invalid-email' :
          AppAlert.showToast('Email is not valid');
          break;
        case 'user-disabled' :
          AppAlert.showToast('The email has been disable');
          break;
        case 'user-not-found' :
          AppAlert.showToast('User not found');
          break;
        case 'wrong-password' : 
          AppAlert.showToast('Please check the password');
          break;
        default:
         AppAlert.showToast('Something error');
      }
    }
  }

  void handelSignUp() async {
    final userState = ref.watch(authProvider);

    final email = userState.email;
    final password = userState.password;
    final username = userState.username;

    if (!_checkEmailPassword(email, password)) return;

    try {
      ref.read(globalLoaderProvider.notifier).changeState();

      final UserCredential userCredential = await AuthRepo.signUpFirebase(email: email!, password: password!);

      await userCredential.user!.sendEmailVerification();
      AppAlert.showToast('An email was sent for verify your account, please check');
      String photoURL = 'uploads/default.png';
      await userCredential.user!.updatePhotoURL(photoURL);
      await userCredential.user!.updateDisplayName(username);

      ref.read(globalLoaderProvider.notifier).changeState();
    } on FirebaseAuthException catch (e) {
      switch(e.code) {
        case 'email-already-in-use' : 
          AppAlert.showToast('Email already be used');
          break;
        case 'invalid-email' :
          AppAlert.showToast('Email is not valid');
          break;
        case 'weak-password' : 
          AppAlert.showToast('The password is not strong enugh');
          break;
        case 'operation-not-allowed':
          AppAlert.showToast('Please check email again');
          break;
        default: 
          AppAlert.showToast('Some thing error');
      }
    }
  }

  bool _checkEmailPassword(String? email, String? password) {
    if (email == null ||
        password == null ||
        !email.contains('@') ||
        password.length < 6 ||
        email.trim().isEmpty ||
        password.trim().isEmpty) {
      AppAlert.showSnackbarCupertino(
          ref.context, 'Please Check', 'The info is not valid', 'Okay', () {
        Navigator.of(ref.context).pop();
      });
      return false;
    }
    return true;
  }
}
