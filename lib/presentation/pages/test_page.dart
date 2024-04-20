import 'package:diana_proyect/domain/entities/messages.dart';
import 'package:diana_proyect/infrastructure/datasources/diana_predictions_datasource.dart';
import 'package:flutter/material.dart';

List<Message> normalDialog = [
  Message(
      emotion: "Happiness",
      isPositive: true,
      message: "I'm doing well, thanks. I'm just enjoying this beautiful day.",
      person: "Other"),
  Message(
      message: "I'm just relaxing at home. I'm planning to read a book later.",
      person: "Me"),
  Message(
      message: "That sounds like fun! I love going for walks in the park.",
      person: "Other"),
  Message(
      message: "Great! I'll meet you at the park entrance in 15 minutes.",
      person: "Me"),
  Message(message: "Do you want to join me?", person: "Other"),
  Message(
      message: "Great! I'll meet you at the park entrance in 15 minutes.",
      person: "Me"),
  Message(
      message: "I'm doing well, thanks. I'm just enjoying this beautiful day.",
      person: "Other"),
  Message(
      message: "I'm just relaxing at home. I'm planning to read a book later.",
      person: "Me"),
  Message(
      message: "That sounds like fun! I love going for walks in the park.",
      person: "Other"),
];

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: IconButton(
          onPressed: () {
            DianaPredictions().getEmotionPrediction("I am so happy to see you");
          },
          icon: const Icon(Icons.access_alarm_outlined)),
    ));
  }
}
