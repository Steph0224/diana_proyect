import 'dart:convert';

class Message {
  final String message;
  final String person;
  final String? emotion;
  final bool? isPositive;

  Message({
    required this.message,
    required this.person,
    this.emotion,
    this.isPositive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'person': person,
      'emotion': emotion,
      'isPositive': isPositive,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] as String,
      person: map['person'] as String,
      emotion: map['emotion'] != null ? map['emotion'] as String : null,
      isPositive: map['isPositive'] != null ? map['isPositive'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(message: $message, person: $person, emotion: $emotion, isPositive: $isPositive)';
  }
}
