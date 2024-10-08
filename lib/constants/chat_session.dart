import 'package:get/get.dart';
import '../models/chat_question.dart';
import '../repositories/chat_repository.dart';

enum AnswerApiStateControl { initial, loading, success, error }

class ChatSession extends GetxController {
  final chatHistory = <ChatQuestion>[].obs;

  var answerMessageScreen = "".obs;
  var questionMessageScreen = "".obs;

  var state = AnswerApiStateControl.initial.obs;
}

//TODO ...
class AnswerApiDataControl extends GetxController {
  final ChatSession chatSession = Get.put(ChatSession());

  var answer = ''.obs;
  var state = AnswerApiStateControl.initial.obs;

  Future<void> fetchData() async {
    state.value = AnswerApiStateControl.loading;
    try {
      answer.value = await ChatRepository().mockGetMessageService(sendMessage: chatSession.questionMessageScreen.toString());
      state.value = AnswerApiStateControl.success;
    } catch (e) {
      state.value = AnswerApiStateControl.error;
    }
  }
}
