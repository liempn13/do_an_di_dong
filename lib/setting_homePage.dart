import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:do_an_di_dong/homePage.dart';

class settingHomepage extends StatelessWidget {
  const settingHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Cài đặt', style: TextStyle(color: Colors.blue)),
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
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Chỉnh sửa thông tin cá nhân
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    children: [
                      Icon(Icons.face, color: Colors.blue),
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
                      Icon(Icons.sunny, color: Colors.blue),
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
              GestureDetector(
                onTap: () {
                  // Navigate to the login page
                  Navigator.pushReplacementNamed(context, '/loginPage');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Row(
                    children: [
                      Icon(Icons.logout, color: Colors.blue),
                      SizedBox(width: 16.0),
                      Text(
                        'Đăng xuất',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
