import 'package:flutter/material.dart';
import 'package:dnext_chatbot_3/widgets/chat_history_widget.dart';

import '../widgets/chat_answer_widget.dart';
import '../widgets/send_button_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: ChatHistoryWidget(),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const ChatAnswerWidget(),
                SendButtonWidget(messageController: messageController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

