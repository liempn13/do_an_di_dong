import 'package:do_an_di_dong/views/auth_screens/new_password.dart';
import 'package:flutter/material.dart';

class OtpForgotPasswordScreen extends StatefulWidget {
  const OtpForgotPasswordScreen({super.key});

  @override
  State<OtpForgotPasswordScreen> createState() =>
      _OtpForgotPasswordScreenState();
}

class _OtpForgotPasswordScreenState extends State<OtpForgotPasswordScreen> {
  String? _errorotp;
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Quên mật khẩu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            ]),
            const SizedBox(height: 10.0),
            // nhập Email/sđt
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                  labelText: 'Nhập mã otp',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.sms),
                  errorText: _errorotp),
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
                  setState(() {
                    if (_otpController.text.isEmpty) {
                      _errorotp = 'Vui lòng nhập mã otp';
                    } else {
                      _errorotp = null;
                    }
                    if (_errorotp == null) {
                      print('Đã nhấn gửi');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Newpasswordscreen()),
                        (route) => false,
                      );
                    }
                  });
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
