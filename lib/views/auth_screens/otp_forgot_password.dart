import 'package:flutter/material.dart';

class otp_forgot_password_screen extends StatefulWidget {
  const otp_forgot_password_screen({super.key});

  @override
  State<otp_forgot_password_screen> createState() => _otp_forgot_password_screenState();
}

class _otp_forgot_password_screenState extends State<otp_forgot_password_screen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Quên mật khẩu',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                text: const TextSpan(
                  text: 'Mã OTP đã được gửi về điện thoại, ',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: 'vui lòng nhập mã otp  ',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ),
              ]
              
            ),
            const SizedBox(height: 10.0),
            // nhập Email/sđt
            TextField(
              decoration: InputDecoration(
                labelText: 'Nhập mã otp',
                labelStyle: const TextStyle(
                color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.sms),
              ),
            ),
            const SizedBox(height: 16.0),
            
            // Nút Đăng nhập
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  
                  print('Đã nhấn gửi');
                },
                child: const Text(
                  'Gửi',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}