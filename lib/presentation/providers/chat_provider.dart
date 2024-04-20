import 'package:diana_proyect/presentation/providers/chat_summary_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personProvider = StateProvider<String>((ref) => "Other");

final loadingProvider = StateProvider<bool>((ref) => false);

final chatScrollController = ScrollController();

final chatProvider =
    StateNotifierProvider<ChatProviderNotifier, List<dynamic>>((ref) {
  final person = ref.watch(personProvider.notifier);
  final resetSummary = ref.read(summaryProvider.notifier).resetSummary;
  return ChatProviderNotifier(person: person, resetSummary: resetSummary);
});

class ChatProviderNotifier extends StateNotifier<List<dynamic>> {
  final StateController<String> person;
  final dynamic resetSummary;

  ChatProviderNotifier({required this.person, required this.resetSummary})
      : super([]);

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 150));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  addMessage(dynamic message) {
    state = [...state, message];
    person.update((state) => (state == "Me") ? state = "Other" : "Me");
    moveScrollToBottom();
  }

  setMessages(List<dynamic> messages) {
    state = [...messages];
    resetSummary();
  }
}
