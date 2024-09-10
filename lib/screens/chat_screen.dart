import 'package:dnext_chatbot_3/constants/chat_session.dart';
import 'package:dnext_chatbot_3/repositories/chat_repository.dart';
import 'package:dnext_chatbot_3/widgets/chat_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _chatSession = Get.put(ChatSession());
    _chatSession.message.value.text = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Row(
        children: [
          ChatHistoryWidget(),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('Chat messages will appear here'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: TextField(
                              decoration: const InputDecoration(labelText: 'Type a message'),
                              controller: _chatSession.message.value),
                        ),
                        IconButton(icon: const Icon(Icons.send), onPressed: () => ChatRepository().sendMessage()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
