import 'package:dnext_chatbot_3/provider/chat_provider.dart';
import 'package:dnext_chatbot_3/repositories/chat_repository.dart';
import 'package:dnext_chatbot_3/routes.dart';
import 'package:dnext_chatbot_3/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(chatRepository: ChatRepository()),
        ),
      ],
      child: ChatbotApp(),
    ),
  );
}

class ChatbotApp extends StatelessWidget {
  const ChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DNext Chatbot',
      initialRoute: AppRoute.login,
      getPages: AppRoute.getPages(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
