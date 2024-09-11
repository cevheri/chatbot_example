import 'package:dnext_chatbot_3/screens/chat_screen.dart';
import 'package:dnext_chatbot_3/screens/login_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String home = '/';
  static const String login = '/login';
  static const String chat = '/chat';

  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: '/', page: () =>  LoginScreen(), transition: Transition.cupertino),
      GetPage(name: '/login', page: () =>  LoginScreen(), transition: Transition.cupertino),
      GetPage(name: '/chat', page: () =>  ChatScreen(), transition: Transition.cupertino),
    ];
  }

}
