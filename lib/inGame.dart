import 'package:flutter/material.dart';

class inGame extends StatelessWidget {
  const inGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            // Gọi hàm showSettingsDialog khi nhấn nút Settings
            showSettingsDialog(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 32.0), // Khoảng cách giữa AppBar đến phần câu hỏi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 231, 231),
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'When was the American declaration of independence signed?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32.0), // Khoảng cách giữa câu hỏi và đáp án
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                OptionButton(option: 'A. July 4th, 1778'),
                OptionButton(option: 'B. July 4th, 1776'),
                OptionButton(option: 'C. August 2nd, 1776'),
                OptionButton(option: 'D. August 6th, 1776'),
              ],
            ),
          ),
          const SizedBox(
              height: 32.0), // Cách đều phần dưới với các câu trả lời
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  // Hàm hiển thị bảng pop-up cài đặt
  void showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settings'),
          content: Text('Choose your action.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng pop-up
              },
              child: Text('Option 1'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng pop-up
              },
              child: Text('Option 2'),
            ),
          ],
        );
      },
    );
  }
}

class OptionButton extends StatelessWidget {
  final String option;
  const OptionButton({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Màu nền của nút
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0, // Loại bỏ đổ bóng cho nút
          ),
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft, // Căn chữ về bên trái
            child: Text(
              option,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
