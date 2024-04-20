import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiModel {
  Future<String> geminiSummarize(String message) async {
    final model = GenerativeModel(
        model: 'gemini-pro', apiKey: "AIzaSyBpjwnBk4WN2ErHtzkTpP_uEKgIzBhtZr0");
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    print(response.text);
    return response.text ?? "";
  }
}
