class ChatAnswer {
  final String question;
  final String answer;
  final String sender;
  final DateTime time;

  ChatAnswer({
    required this.question,
    required this.answer,
    required this.sender,
    required this.time,
  });

  factory ChatAnswer.fromJson(Map<String, dynamic> json) {
    return ChatAnswer(
      question: json['question'],
      answer: json['answer'],
      sender: json['sender'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
        'sender': sender,
        'time': time.toIso8601String(),
      };
}
