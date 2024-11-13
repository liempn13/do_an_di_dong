import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:do_an_di_dong/homePage.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class settingHomepage extends StatefulWidget {
  Users user;
  settingHomepage({super.key, required this.user});

  @override
  State<settingHomepage> createState() => _settingHomepageState();
}

class _settingHomepageState extends State<settingHomepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UsersViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Cài đặt', style: TextStyle(color: Colors.purple)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Chỉnh sửa thông tin cá nhân
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                            loginUser: widget.user,
                            user: widget.user,
                          )));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    children: [
                      Icon(Icons.face, color: Colors.purple),
                      SizedBox(width: 16.0),
                      Text(
                        'Chỉnh sửa thông tin cá nhân',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.grey),

              // Cài đặt giao diện
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    children: [
                      Icon(Icons.sunny, color: Colors.purple),
                      SizedBox(width: 16.0),
                      Text(
                        'Cài đặt giao diện',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.grey),

              // Đăng xuất
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: Colors.purple),
                    SizedBox(width: 16.0),
                    Text(
                      'Đăng xuất',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ).onInkTap(() {
                userViewModel.logOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              }),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
