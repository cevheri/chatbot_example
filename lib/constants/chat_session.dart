
import 'package:dnext_chatbot_3/models/chat_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSession {
  final message = TextEditingController().obs;
  final chatHistory = <ChatQuestion>[].obs;
  final answer = TextEditingController().obs;
}