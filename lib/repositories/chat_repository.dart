import 'package:dnext_chatbot_3/constants/api_constant.dart';
import 'package:dnext_chatbot_3/constants/app_session.dart';
import 'package:dnext_chatbot_3/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatRepository {
  final String? baseUrl = ApiConstant.API_BASE_URL;
  final String? token = AppSession.token;

  //load mock data
  List<ChatMessage> loadMockData() {
    return [
      ChatMessage(
        title: 'Hello',
        message: 'Hello, how can I help you?',
        sender: 'Chatbot',
        time: DateTime.now(),
      ),
      ChatMessage(
        title: 'How are you?',
        message: 'I am fine, thank you. How are you?',
        sender: 'Chatbot',
        time: DateTime.now(),
      ),
      ChatMessage(
        title: 'I am fine',
        message: 'I am fine too. How can I help you?',
        sender: 'Chatbot',
        time: DateTime.now(),
      ),
    ];
  }

  Future<List<ChatMessage>> fetchChatHistory() async {
    return loadMockData();
    //
    //   final response = await http.get(
    //     Uri.parse('$baseUrl/chat/history'),
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //     },
    //   );
    //
    //   if (response.statusCode == 200) {
    //     final List<dynamic> data = json.decode(response.body);
    //     return data.map((message) => ChatMessage.fromJson(message)).toList();
    //   } else {
    //     throw Exception('Failed to fetch chat history');
    //   }
    //
    // Future<void> sendMessage(String message) async {
    //   final response = await http.post(
    //     Uri.parse('$baseUrl/chat/send'),
    //     headers: {
    //       'Authorization': 'Bearer $token',
    //       'Content-Type': 'application/json',
    //     },
    //     body: json.encode({'message': message}),
    //   );
    //
    //   if (response.statusCode != 200) {
    //     throw Exception('Failed to send message');
    //   }
  }

  Future<void> sendMessage(ChatMessage chatMessage) async {
    debugPrint("ChatRepository.sendMessage: ${chatMessage.message}");
    // final response = await http.post(
    //   Uri.parse('$baseUrl/send'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode(
    //     chatMessage.toJson(),
    //   ),
    // );

    // if (response.statusCode != 200) {
    //   throw Exception('Failed to send message');
    // }
  }
}
