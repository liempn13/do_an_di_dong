import 'package:do_an_di_dong/views/auth_screens/friend.dart/friend_list_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/history/history_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FriendListScreen(),
    );
  }
}
