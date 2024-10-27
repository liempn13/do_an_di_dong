import 'package:do_an_di_dong/views/auth_screens/otp_forgot_password.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:flutter/material.dart';

class ForgePasswordScreen extends StatefulWidget {
  const ForgePasswordScreen({super.key});

  @override
  State<ForgePasswordScreen> createState() => _ForgePasswordScreenState();
}

class _ForgePasswordScreenState extends State<ForgePasswordScreen> {
  String? _errorQmk;
  final TextEditingController _qmkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      showLeadingAction: true,
      backgroundColor: Colors.white,
      appBarColor: Colors.white,
      title: 'Quên mật khẩu',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            // nhập Email/sđt
            TextField(
              controller: _qmkController,
              decoration: InputDecoration(
                  labelText: 'Số điện thoại/ email',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  errorText: _errorQmk),
            ),
            const SizedBox(height: 16.0),

            // Nút gửi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  setState(() {
                    if (_qmkController.text.isEmpty)
                      _errorQmk = 'Vui lòng nhập SĐT hoặc email';
                    else
                      _errorQmk = null;
                    if (_errorQmk == null) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           const OtpForgotPasswordScreen()),
                      // );
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
