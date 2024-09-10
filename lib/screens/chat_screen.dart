import 'package:dnext_chatbot_3/repositories/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String token;

  const ChatScreen({required this.token});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];
  late ChatRepository _chatRepository;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _chatRepository = ChatRepository(
      baseUrl: 'https://your-flask-api-url',
      token: widget.token,
    );
    _loadChatHistory();
  }

  Future<void> _loadChatHistory() async {
    try {
      final messages = await _chatRepository.fetchChatHistory();
      setState(() {
        _messages = messages;
        _isLoading = false;
      });
    } catch (error) {
      print('Error loading chat history: $error');
    }
  }

  Future<void> _sendMessage() async {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
      });
      _messageController.clear();
      try {
        await _chatRepository.sendMessage(message);
      } catch (error) {
        print('Error sending message: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Row(
        children: [
          // left panel: Chat history
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index]),
                  );
                },
              ),
            ),
          ),
          // right panel: send message
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              _messages[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // type your message
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _sendMessage,
                        child: Text('Send'),
                      ),
                    ],
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
