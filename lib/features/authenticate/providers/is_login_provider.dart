import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsLoginNotifier extends StateNotifier<bool> {
  IsLoginNotifier() : super(true);

  void isSignIn(bool isSignIn) {
    state = isSignIn;
  }
}

final isLoginProvider = StateNotifierProvider<IsLoginNotifier, bool>((ref) {
  return IsLoginNotifier();
});