import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuSelectedProvider =
    StateNotifierProvider<SelectedProviderNotifier, int>(
        (ref) => SelectedProviderNotifier());

class SelectedProviderNotifier extends StateNotifier<int> {
  SelectedProviderNotifier() : super(0);

  changeSelected(int menuOpt) {
    state = menuOpt;
  }
}
