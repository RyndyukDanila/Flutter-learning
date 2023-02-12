import 'dart:convert';

import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/chats/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final searchChats = await _loadSearchList();
  final chats = await _loadChatList(searchChats);

  runApp(App(chats: chats));
}

Future<List<Chat>> _loadSearchList() async {
  final result = <Chat>[];
  final rawData =
      jsonDecode(await rootBundle.loadString('lib/assets/data/bootcamp.json'));
  for (final item in rawData['data']) {
    result.add(Chat.fromJson(item));
  }
  return result;
}

Future<List<Chat>> _loadChatList(List<Chat> chats) async {
  final result = <Chat>[];

  for (final item in chats) {
    if (item.lastMessage != null) {
      result.add(item);
    }
  }

  return result;
}
