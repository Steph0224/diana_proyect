import 'package:dio/dio.dart';

class DianaPredictions {
  final dio = Dio();

  Future<String> getEmotionPrediction(String text) async {
    final String url = "http://127.0.0.1:5000/emotion/$text";

    try {
      final response = await dio.get(url);
      final String prediction = response.data;
      return prediction;
    } catch (e) {
      print("Error al obtener la predicción de emoción: $e");
      return "Neutral";
    }
  }

  Future<String> getPositivityPrediction(String text) async {
    final String url = "http://127.0.0.1:5000/positivity/$text";

    try {
      final response = await dio.get(url);
      final String prediction = response.data;
      return prediction;
    } catch (e) {
      print("Error al obtener la predicción de emoción: $e");
      return "Neutral";
    }
  }
}
