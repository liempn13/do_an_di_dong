import 'dart:async';
import 'package:do_an_di_dong/custombutton_popup.dart';
import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class inGame extends StatefulWidget {
  inGame({super.key});

  @override
  State<inGame> createState() => _inGameState();
}

class _inGameState extends State<inGame> {
  int _remainingTime = 10;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$_remainingTime s',
          style: const TextStyle(
            fontSize: 24, // Thay đổi kích thước chữ
            fontWeight: FontWeight.bold, // Tùy chỉnh độ đậm
            color: Colors.white, // Thay đổi màu sắc của chữ
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
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
              child: const Center(
                child: Text(
                  "huuhg",
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),

            child: SizedBox(
                height: 32.0), // Cách đều phần dưới với các câu trả lời
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

// Hàm hiển thị bảng pop-up cài đặt
void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.7, // Điều chỉnh độ rộng hộp thoại
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    text: 'Tiếp tục',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Quay trở lại trang tiêu đề',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/homePage');
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
