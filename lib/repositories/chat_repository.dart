import 'package:dnext_chatbot_3/constants/api_constant.dart';
import 'package:dnext_chatbot_3/constants/app_session.dart';
import 'package:dnext_chatbot_3/constants/chat_session.dart';
import 'package:dnext_chatbot_3/models/chat_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRepository {
  final String? baseUrl = ApiConstant.API_BASE_URL;
  final String? token = AppSession.token;
  final _chatSession = Get.put(ChatSession());

  //load mock data
  List<ChatQuestion> loadMockData() {
    return [
      ChatQuestion(
        title: 'Hello',
        message: 'Hello, how can I help you?',
        sender: 'Chatbot',
        time: DateTime.now(),
      ),
      ChatQuestion(
        title: 'How are you?',
        message: 'I am fine, thank you. How are you?',
        sender: 'Chatbot',
        time: DateTime.now(),
      ),
      ChatQuestion(
        title: 'I am fine',
        message: 'I am fine too. How can I help you?',
        sender: 'Chatbot',
        time: DateTime.now(),
      ),
    ];
  }

  Future<void> fetchChatHistory() async {
    _chatSession.chatHistory.value = loadMockData();
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

  Future<void> sendMessage() async {
    debugPrint("ChatRepository.sendMessage: ${_chatSession.message.value.text}");
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
    await addHistory(_chatSession.message.value.text);
  }

  Future<void> addHistory(String message) async {
    String title = message.substring(0, message.length > 10 ? 10 : message.length);
    ChatQuestion chatMessage = ChatQuestion(
      title: title,
      message: message,
      sender: AppSession.userInfo!.username!,
      time: DateTime.now(),
    );
    _chatSession.chatHistory.add(chatMessage);
    debugPrint("ChatRepository.addHistory: ${_chatSession.chatHistory.length}");
  }
}
