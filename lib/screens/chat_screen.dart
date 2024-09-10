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
                const ChatAnswer(), // Burada dinlemeyi ayrı bir widget'ta yapıyoruz
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(labelText: 'Type a message'),
                            controller: _chatSession.message.value,
                            onChanged: (value) {
                              _chatSession.message.refresh(); // TextField girdisini dinlemek için refresh
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            ChatRepository().sendMessage();
                            _chatSession.message.refresh(); // Mesaj gönderiminden sonra yenile
                            _chatSession.answer.refresh(); // Cevap kısmını da yenile
                          },
                        ),
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

class ChatAnswer extends StatelessWidget {
  const ChatAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    final _chatSession = Get.put(ChatSession());
    if (_chatSession.message.value.text.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text('No message'),
        ),
      );
    }
    return Expanded(
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: ListTile(
                  title: const Text('Chatbot'),
                  subtitle: SelectableText('Answered at ${_chatSession.message.value.text}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ListTile(
                  title: const Text('Chatbot'),
                  subtitle: SelectableText('Answered at ${_chatSession.answer.value.text}'),
                ),
              ),
            ],
          )),
    );
  }
}
