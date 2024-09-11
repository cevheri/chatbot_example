import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/chat_session.dart';

class ChatAnswerWidget extends StatelessWidget {
  const ChatAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatSession chatSession = Get.find<ChatSession>();

    return Obx(() {
      if (chatSession.questionMessageScreen.value.isEmpty) {
        return const Expanded(
          child: Center(
            child: Text('No message'),
          ),
        );
      }

      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
              child: Card(
                elevation: 10,
                color: Colors.blueGrey.shade200,
                child: ListTile(
                  title: const Text('Chatbot'),
                  subtitle: Obx(
                    () => SelectableText('Answered at ${chatSession.questionMessageScreen.value}'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: Card(
                elevation: 10,
                color: Colors.blueGrey.shade200,
                child: ListTile(
                  title: const Text('Chatbot'),
                  subtitle: Obx(
                    () => SelectableText('Answer message: ${chatSession.answer.value.toString()}'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
