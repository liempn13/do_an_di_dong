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
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Phần câu hỏi
            Expanded(
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
            // Phần đáp án
            OptionButton(option: 'July 4th, 1778'),
            OptionButton(option: 'July 4th, 1776'),
            OptionButton(option: 'August 2nd, 1776'),
            OptionButton(option: 'August 6th, 1776'),
          ],
        ),
      ),
      backgroundColor: Colors.white,
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade700,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Xử lý khi chọn đáp án
        },
        child: Text(
          option,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
