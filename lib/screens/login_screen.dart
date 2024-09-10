import 'package:dnext_chatbot_3/constants/app_session.dart';
import 'package:dnext_chatbot_3/models/user_info.dart';
import 'package:dnext_chatbot_3/repositories/auth_repository.dart';
import 'package:dnext_chatbot_3/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final AuthRepository _authRepository = AuthRepository(
    baseUrl: 'http://localhost:8080',
    realm: 'myrealm',
    clientId: 'myclient',
    clientSecret: 'mOJEypbHcLI66jS8J63eVWYxACd4uZi8',
  );

  String? _token;

  Future<void> _login() async {
    _isLoading = true;
    final username = _usernameController.text;
    final password = _passwordController.text;

    final token = await _authRepository.login(username, password);
    setState(() {
      _token = token;
      print('Token: $_token');
      _isLoading = false;
      AppSession.token = token;
      Get.off(() => ChatScreen());
    });
  }

  Future<void> _loadUserInformation() async {
    UserInfo userInformation = await _authRepository.getAccount();
    AppSession.username = userInformation.preferredUsername;
    print('User Information: $userInformation');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            if (_token != null) ...[
              SizedBox(height: 20),
              Text('Token: $_token'),
            ]
          ],
        ),
      ),
    );
  }
}
