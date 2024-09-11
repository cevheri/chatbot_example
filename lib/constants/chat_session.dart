import 'package:get/get.dart';
import '../models/chat_question.dart';

class ChatSession extends GetxController {
  final chatHistory = <ChatQuestion>[].obs;
  final answer = "".obs;

  var answerMessageScreen = "".obs;
  var questionMessageScreen = "".obs;
}

