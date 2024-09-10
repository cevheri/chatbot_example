class ChatQuestion {
  final String title;
  final String message;
  final String sender;
  final DateTime time;

  ChatQuestion({
    required this.title,
    required this.message,
    required this.sender,
    required this.time,
  });

  factory ChatQuestion.fromJson(Map<String, dynamic> json) {
    return ChatQuestion(
      title: json['title'],
      message: json['message'],
      sender: json['sender'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'message': message,
        'sender': sender,
        'time': time.toIso8601String(),
      };
}
