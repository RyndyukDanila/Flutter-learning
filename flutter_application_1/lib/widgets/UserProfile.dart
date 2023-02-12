import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final List<MenuRowData> fisrtMenuRowData = [
    MenuRowData(Icons.bookmark, 'Favorite'),
    MenuRowData(Icons.call, 'Calls'),
    MenuRowData(Icons.computer, 'Devices'),
    MenuRowData(Icons.folder, 'Folder with chats'),
  ];

  final List<MenuRowData> secondMenuRowData = [
    MenuRowData(Icons.notifications, 'Notifications'),
    MenuRowData(Icons.lock, 'Confidentiality'),
    MenuRowData(Icons.data_usage, 'Data usage'),
    MenuRowData(Icons.brush, 'Decoration'),
    MenuRowData(Icons.language, 'Language'),
  ];

  final List<MenuRowData> thirdMenuRowData = [
    MenuRowData(Icons.settings, 'Settings'),
    MenuRowData(Icons.person_add, 'Add friends'),
    MenuRowData(Icons.near_me, 'People nearby'),
    MenuRowData(Icons.add, 'Add acount'),
    MenuRowData(Icons.question_mark, 'About Tiligrom'),
  ];

  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              _UserInfoWidget(),
              const SizedBox(height: 20),
              _MenuWidget(menuRowData: fisrtMenuRowData),
              const SizedBox(height: 20),
              _MenuWidget(menuRowData: secondMenuRowData),
              const SizedBox(height: 20),
              _MenuWidget(menuRowData: thirdMenuRowData)
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRowData;

  const _MenuWidget({super.key, required this.menuRowData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children:
            menuRowData.map((data) => _MenuRowWidget(data: data)).toList(),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuRowWidget extends StatelessWidget {
  final MenuRowData data;

  const _MenuRowWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: const <Widget>[
          SizedBox(height: 20),
          _UserAvatarWidget(),
          SizedBox(height: 20),
          _UserNameWidget(),
          SizedBox(height: 10),
          _UserPhoneWidget(),
          SizedBox(height: 10),
          _NickNameWidget(),
        ],
      ),
    );
  }
}

class _NickNameWidget extends StatelessWidget {
  const _NickNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Nickname');
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Phone number');
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Username',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _UserAvatarWidget extends StatelessWidget {
  const _UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
    );
  }
}
