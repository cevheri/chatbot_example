import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatRepository {
  final String baseUrl;
  final String token;

  ChatRepository({required this.baseUrl, required this.token});

  Future<List<String>> fetchChatHistory() async {
    final response = await http.get(
      Uri.parse('$baseUrl/chat/history'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((message) => message.toString()).toList();
    } else {
      throw Exception('Failed to load chat history');
    }
  }

  Future<void> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chat/send'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'message': message}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send message');
    }
  }
}
