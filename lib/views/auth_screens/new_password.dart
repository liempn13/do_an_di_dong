import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:flutter/material.dart';

class Newpasswordscreen extends StatefulWidget {
  const Newpasswordscreen({super.key});

  @override
  State<Newpasswordscreen> createState() => _NewpasswordscreenState();
}

class _NewpasswordscreenState extends State<Newpasswordscreen> {
  bool _anHienPass = true;
  bool _anHienPass2 = true;
  String? _errorMk;
  String? _errorMk2;
  bool isValidPassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  final TextEditingController _matkhaumoiController = TextEditingController();
  final TextEditingController _matkhaumoi2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BasePage(
      backgroundColor: Colors.white,
      showAppBar: true,
      showLeadingAction: true,
      appBarColor: Colors.purple,
      title: 'Tạo mật khẩu mới',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            // nhập mk
            TextField(
              //controller: ,
              obscureText: _anHienPass,
              controller: _matkhaumoiController,
              decoration: InputDecoration(
                  labelText: 'Mật khẩu mới',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _anHienPass ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _anHienPass = !_anHienPass;
                      });
                    },
                  ),
                  errorText: _errorMk),
              onChanged: (value) {
                setState(() {
                  _errorMk = value.isNotEmpty && !isValidPassword(value)
                      ? '''
                      Mật khẩu phải có ít nhất
                      1 chữ thường, 1 chữ hoa,
                      1 số và 1 ký tự đặc biệt'''
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              //controller: ,
              obscureText: _anHienPass2,
              controller: _matkhaumoi2Controller,
              decoration: InputDecoration(
                  labelText: 'Lặp lại mật khẩu mới',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _anHienPass2 ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _anHienPass2 = !_anHienPass2;
                      });
                    },
                  ),
                  errorText: _errorMk2),
              onChanged: (value) {
                setState(() {
                  _errorMk2 =
                      value.isNotEmpty && value != _matkhaumoiController.text
                          ? 'Mật khẩu không khớp với mật khẩu chính'
                          : null;
                });
              },
            ),
            const SizedBox(height: 30.0),
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
                  // Kiểm tra mật khẩu
                  setState(() {
                    if (_matkhaumoiController.text.isEmpty) {
                      _errorMk = 'Mật khẩu không được bỏ trống';
                    } else if (!isValidPassword(_matkhaumoiController.text)) {
                      _errorMk =
                          'Mật khẩu phải có ít nhất 1 chữ thường, 1 chữ hoa, 1 số và 1 ký tự đặc biệt';
                    } else {
                      _errorMk = null; // Không có lỗi
                    }

                    // Kiểm tra lặp lại mật khẩu
                    if (_matkhaumoi2Controller.text.isEmpty) {
                      _errorMk2 = 'Lặp lại mật khẩu không được bỏ trống';
                    } else if (_matkhaumoi2Controller.text !=
                        _matkhaumoi2Controller.text) {
                      _errorMk2 = 'Mật khẩu không khớp với mật khẩu chính';
                    } else {
                      _errorMk2 = null; // Không có lỗi
                    }
                    if (_errorMk == null && _errorMk2 == null) {
                      print('Đã nhấn Đặt lại mật khẩu');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    }
                  });
                },
                child: const Text(
                  'Đặt lại mật khẩu',
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
