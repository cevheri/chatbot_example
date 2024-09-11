import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/chat_session.dart';
import '../repositories/chat_repository.dart';

class SendButtonWidget extends StatelessWidget {
  const SendButtonWidget({
    super.key,
    required this.messageController,
  });

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(labelText: 'Type a message'),
              controller: messageController,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              ChatRepository().sendMessage(message: messageController.text);
              final ChatSession chatSession = Get.find<ChatSession>();
              chatSession.questionMessageScreen.value = messageController.text;
            },
          ),
        ],
      ),
    );
  }
}
