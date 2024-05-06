import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalLoaderNotifier extends StateNotifier<bool>{
  GlobalLoaderNotifier() : super(false);

  void changeState() {
    state = !state;
  }
}

final globalLoaderProvider = StateNotifierProvider<GlobalLoaderNotifier, bool>((ref) => GlobalLoaderNotifier());