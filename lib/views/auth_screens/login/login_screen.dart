import 'package:do_an_di_dong/views/auth_screens/forgot_password_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/signup_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _anHienPass = true;
  String? _errorUsername;
  String? _errorPass;
  // TextEditingController để điều khiển các trường nhập liệu
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 100.0),
            Center(
              child: RichText(
                  text: const TextSpan(
                text: 'Đăng nhập ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            const SizedBox(height: 40.0),
            // Tên đăng nhập
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Tên đăng nhập',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.person),
                errorText: _errorUsername,
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16.0),
            // Mật khẩu
            TextField(
              controller: _passwordController,
              obscureText: _anHienPass,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.lock),
                errorText: _errorPass,
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
              ),
            ),
            const SizedBox(height: 30.0),
            // Nút Đăng nhập
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
                    if (_usernameController.text.isEmpty) {
                      _errorUsername = 'Không được để trống tên đăng nhập';
                    } else {
                      _errorUsername = null;
                    }

                    if (_passwordController.text.isEmpty) {
                      _errorPass = 'Không được để trống mật khẩu';
                    } else {
                      _errorPass = null;
                    }
                    if (_errorUsername == null && _errorPass == null) {
                      print('Đăng nhập thành công');
                    }
                  });
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // quên mk
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgePasswordScreen()));
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Quên mật khẩu?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 221, 221, 222),
                      fontSize: 14.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            // Đăng ký nếu chưa có tài khoản
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Nếu bạn chưa có tài khoản?, ',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'Đăng ký',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
