import 'package:flutter_application_1/src/chats/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatsPage extends StatelessWidget {
  final List<Chat> chats;

  const ChatsPage({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return {'Settings', 'Exit'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
        title: const Text("Chats"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Scaffold())),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: chats.length,
        itemBuilder: (context, index) => Conversation(chat: chats[index]),
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

class Conversation extends StatelessWidget {
  final Chat chat;

  const Conversation({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    String lastDate = '';
    if (chat.date != null) {
      final date = DateTime.now().difference(chat.date!);
      if (date.inHours < 24) {
        lastDate = DateFormat(DateFormat.HOUR24_MINUTE).format(chat.date!);
      } else if (date.inDays < 7) {
        lastDate = DateFormat(DateFormat.ABBR_WEEKDAY).format(chat.date!);
      } else {
        lastDate = DateFormat(DateFormat.ABBR_MONTH_DAY).format(chat.date!);
      }
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            chat.userAvatar != null ? AssetImage(chat.userAvatar!) : null,
        child: chat.userAvatar == null ? Text(chat.userName[0]) : null,
      ),
      title: Text(
        chat.userName,
      ),
      subtitle: Text(
        chat.lastMessage ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(lastDate),
    );
  }
}
