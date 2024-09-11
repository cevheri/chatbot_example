import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/chat_session.dart';

class ChatAnswerWidget extends StatelessWidget {
  const ChatAnswerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatSession chatSession = Get.put(ChatSession());
    final AnswerApiDataControl controller = Get.put(AnswerApiDataControl());

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
                  title: const Text('User question'),
                  subtitle: Obx(
                    () => SelectableText('Answered at ${chatSession.questionMessageScreen}'),
                  ),
                ),
              ),
            ),
            Obx(() {
              switch (controller.state.value) {
                case AnswerApiStateControl.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case AnswerApiStateControl.error:
                  return Center(
                    child: Text('An error occurred!'),
                  );
                case AnswerApiStateControl.success:
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: Card(
                      elevation: 10,
                      color: Colors.blueGrey.shade200,
                      child: ListTile(
                        title: const Text('Chatbot'),
                        subtitle: Obx(
                          () => SelectableText('Answer message: ${controller.answer.value.toString()}'),
                        ),
                      ),
                    ),
                  );
                case AnswerApiStateControl.initial:
                default:
                  return Center(
                    child: Text('No data available.'),
                  );
              }
            }),
          ],
        ),
      );
    });
  }
}
