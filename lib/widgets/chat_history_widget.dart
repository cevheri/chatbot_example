import 'package:dnext_chatbot_3/constants/chat_session.dart';
import 'package:dnext_chatbot_3/models/chat_question.dart';
import 'package:dnext_chatbot_3/repositories/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHistoryWidget extends StatelessWidget {
  ChatHistoryWidget({super.key});

  final _chatSession = Get.put(ChatSession());

  @override
  Widget build(BuildContext context) {
    ChatRepository().fetchChatHistory();
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _chatSession.chatHistory.length,
                  itemBuilder: (context, index) {
                    ChatQuestion message = _chatSession.chatHistory[index];
                    return ListTile(
                      title: Text(message.sender),
                      subtitle: Text(message.message),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
