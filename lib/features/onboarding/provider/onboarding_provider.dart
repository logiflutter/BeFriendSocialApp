import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingNotifier extends StateNotifier<int> {
  OnboardingNotifier() : super(0);

  void changIndex(int index) {
    state = index;
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, int>((ref) {
  return OnboardingNotifier();
});