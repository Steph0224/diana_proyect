import 'package:diana_proyect/infrastructure/datasources/chatgpt_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final summaryProvider = StateNotifierProvider<SummaryProviderNotifier, String>(
    (ref) => SummaryProviderNotifier());

class SummaryProviderNotifier extends StateNotifier<String> {
  SummaryProviderNotifier() : super("");

  final gemini = GeminiModel();

  getSummary(String message) async {
    state = await gemini.geminiSummarize(
        """"summarise this dialog between two persons (maximum two paragraphs) that is presented in a list of message objects. You dont do sentiment analysis... be concise, precise and don't introduct.

$message
""");
  }

  void resetSummary() {
    state = "";
  }
}
