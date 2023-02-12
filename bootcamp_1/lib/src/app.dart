import 'package:flutter_application_1/src/chats/models/chat.dart';
import 'package:flutter_application_1/src/chats/ui/chats_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final List<Chat> chats;

  const App({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ChatsPage(
        chats: chats,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
