import 'package:do_an_di_dong/custombutton_popup.dart';
import 'package:do_an_di_dong/models/options.dart';
import 'package:do_an_di_dong/models/questions.dart';
import 'package:do_an_di_dong/view_models/options_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class inGame extends StatelessWidget {
  inGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                text: 'Tiếp tục',
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Close the dialog and stay on the current page
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Quay trở lại trang tiêu đề',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                      '/homePage'); // Navigate to the home page
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
