import 'package:dnext_chatbot_3/routes.dart';
import 'package:dnext_chatbot_3/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/chat_session.dart';

void main() {
  runApp(const ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  const ChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatSession());

    return GetMaterialApp(
        title: 'DNext Chatbot',
        initialRoute: AppRoute.login,
        getPages: AppRoute.getPages(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen());
  }
}
