import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final String token;

  ChatScreen({required this.token});

  // Simulated chat history list
  final List<String> chatHistory = []; // Şu anda boş, dolu olduğunda güncelleyebilirsiniz

  @override
  Widget build(BuildContext context) {
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
                    child: chatHistory.isEmpty
                        ? Center(
                      child: Text(
                        'No chat history available',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                        : ListView.builder(
                      itemCount: chatHistory.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(chatHistory[index]),
                          onTap: () {
                            // Chat'i seçince olacak işlemler
                            print('Chat ${chatHistory[index]} selected');
                          },
                        );
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
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Mesaj gönderme işlemi
                          print('Send message');
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
