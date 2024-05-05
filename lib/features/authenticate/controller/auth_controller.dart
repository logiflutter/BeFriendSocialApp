import 'package:be_friend/common/models/user_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends ConsumerWidget {
  const AuthController({super.key});
  @override
  Widget build(context, ref) {
    return Container();
  }
}

//control email, password, user name.
class AuthControllerNotifier extends StateNotifier<UserRequestEntity> {
  AuthControllerNotifier() : super(const UserRequestEntity());

  void onChange({String? email, String? password, String? username}) {
    state = state.copyWith(
      email: email,
      password: password,
      username: username,
    );
  }

  //signIn handel
  void signIn() {
    final String? email = state.email;
    final String? password = state.password;

  }
}

final authControllerProvider = StateNotifierProvider<AuthControllerNotifier, UserRequestEntity>((ref) => AuthControllerNotifier());

//switch login - signup
class IsLoginNotifier extends StateNotifier<bool> {
  IsLoginNotifier() : super(true);

  void isSignIn(bool isSignIn) {
    state = isSignIn;
  }
}

final isLoginProvider = StateNotifierProvider<IsLoginNotifier, bool>((ref) {
  return IsLoginNotifier();
});
