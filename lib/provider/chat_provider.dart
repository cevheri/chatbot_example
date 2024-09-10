import 'package:dnext_chatbot_3/constants/app_session.dart';
import 'package:dnext_chatbot_3/models/chat_message.dart';
import 'package:dnext_chatbot_3/repositories/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {

  final ChatRepository chatRepository;
  ChatProvider({required this.chatRepository});

  List<ChatMessage> _chatHistory = [];
  List<ChatMessage> get chatHistory => _chatHistory;
  String _currentMessage = '';
  String get currentMessage => _currentMessage;



  /// Fetch the chat history from the server
  Future<void> fetchChatHistory() async {
    try {
      List<ChatMessage> chatHistory = await chatRepository.fetchChatHistory();
      _chatHistory.addAll(chatHistory);
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to fetch chat history: $e');
      throw Exception('Failed to load chat history: $e');
    }
  }

  /// Add a message to the chat history
  void addMessage(String message) {
    String title = message.substring(0, message.length > 10 ? 10 : message.length);
    _chatHistory.add(ChatMessage(
      title: title,
      message: message,
      sender: AppSession.username!,
      time: DateTime.now(),
    ));
    notifyListeners();
  }

  /// Update the current message
  void updateCurrentMessage(String message) {
    _currentMessage = message;
    notifyListeners();
  }

  /// Send the current message and add it to the chat history and clear the message box
  Future<void> sendMessage() async {
    if (_currentMessage.isNotEmpty) {
      String title = _currentMessage.substring(0, _currentMessage.length > 10 ? 10 : _currentMessage.length);
      final newMessage = ChatMessage(
        title: title,
        sender: AppSession.username!,
        message: _currentMessage,
        time: DateTime.now(),
      );

      await chatRepository.sendMessage(newMessage);
      _chatHistory.add(newMessage);
      _currentMessage = '';
      notifyListeners();
    }
  }
}
