import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/userProfile.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: UserProfile(),
    );
  }
}
