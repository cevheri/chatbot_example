import 'package:dnext_chatbot_3/models/chat_message.dart';
import 'package:dnext_chatbot_3/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Row(
        children: [
          // Sol panel - Chat History
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder<void>(
                      future: chatProvider.fetchChatHistory(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          debugPrint("Waiting for chat history");
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          debugPrint("Error: ${snapshot.error}");
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else {
                          debugPrint("Chat history loaded");
                          return chatProvider.chatHistory.isEmpty
                              ? Center(child: Text('No chat history available', style: TextStyle(color: Colors.grey)))
                              : ListView.builder(
                                  itemCount: chatProvider.chatHistory.length,
                                  itemBuilder: (context, index) {
                                    ChatMessage message = chatProvider.chatHistory[index];
                                    return ListTile(
                                      title: Text(message.sender),
                                      subtitle: Text(message.message),
                                    );
                                  },
                                );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Sağ panel - Chat message gönderme ekranı
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text('Chat messages will appear here'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text) {
                            chatProvider.updateCurrentMessage(text);
                          },
                          controller: TextEditingController(text: chatProvider.currentMessage),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          chatProvider.sendMessage();
                        },
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
