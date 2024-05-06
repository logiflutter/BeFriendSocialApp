import 'package:be_friend/common/models/user_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<UserRequestEntity> {
  AuthNotifier() : super(const UserRequestEntity());

  void onChange({String? email, String? password, String? username}) {
    state = state.copyWith(
      email: email,
      password: password,
      username: username,
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, UserRequestEntity>((ref) => AuthNotifier());