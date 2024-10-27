import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _anHienPass = true;
  bool _anHienPass2 = true;
  //đk usname
  String? _errorUsername;
  bool isValidUsername(String username) {
    final usernameRegex =
        RegExp(r'^[a-zA-Z0-9_]+$'); // Chỉ cho phép chữ cái, số và dấu gạch dưới
    return usernameRegex.hasMatch(username);
  }

  //đk email
  String? __errorEmail;
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  //đk mk
  String? _errorPass;
  String? _errorPass2;
  bool isValidPassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  // TextEditingController để điều khiển các trường nhập liệu
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 100.0),
            Center(
              child: RichText(
                  text: const TextSpan(
                text: 'Đăng ký ',
                style: const TextStyle(
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
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp(r'[\p{Mn}]')), // loại bỏ tất cả các dấu kết hợp
                FilteringTextInputFormatter.deny(
                  RegExp(r'\s'), // loại bỏ khoảng trắng
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Tên đăng nhập',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.person),
                errorText: _errorUsername, // Hiển thị thông báo lỗi
              ),
              onChanged: (value) {
                setState(() {
                  _errorUsername = value.isNotEmpty && !isValidUsername(value)
                      ? 'Tên đăng nhập chỉ được phép chứa chữ cái, số và dấu gạch dưới'
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            // Mật khẩu
            TextField(
              controller: _passwordController,
              obscureText: _anHienPass,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    RegExp(r'[\p{Mn}]')), //loại bỏ tất cả các dấu kết hợp
                FilteringTextInputFormatter.deny(
                  RegExp(r'\s'), // loại bỏ khoảng trắng
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
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
                errorText: _errorPass,
              ),
              onChanged: (value) {
                setState(() {
                  _errorPass = value.isNotEmpty && !isValidPassword(value)
                      ? '''
                      Mật khẩu phải có ít nhất
                      1 chữ thường, 1 chữ hoa,
                      1 số và 1 ký tự đặc biệt'''
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            // Lặp lại mật khẩu
            TextField(
              controller: _confirmPasswordController,
              obscureText: _anHienPass2,
              decoration: InputDecoration(
                labelText: 'Lặp lại mật khẩu',
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
                errorText: _errorPass2,
              ),
              onChanged: (value) {
                setState(() {
                  _errorPass2 =
                      value.isNotEmpty && value != _passwordController.text
                          ? 'Mật khẩu không khớp với mật khẩu chính'
                          : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            // Email
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.email),
                errorText: __errorEmail,
              ),
              onChanged: (value) {
                setState(() {
                  __errorEmail = value.isNotEmpty && !isValidEmail(value)
                      ? 'Email không hợp lệ'
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            // Số điện thoại
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 30.0),
            // Nút Đăng ký
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
                    // Kiểm tra tên đăng nhập
                    if (_usernameController.text.isEmpty) {
                      _errorUsername = 'Tên đăng nhập không được bỏ trống';
                    } else if (!isValidUsername(_usernameController.text)) {
                      _errorUsername =
                          'Tên đăng nhập chỉ được phép chứa chữ cái, số và dấu gạch dưới';
                    } else {
                      _errorUsername = null;
                    }

                    // Kiểm tra mật khẩu
                    if (_passwordController.text.isEmpty) {
                      _errorPass = 'Mật khẩu không được bỏ trống';
                    } else if (!isValidPassword(_passwordController.text)) {
                      _errorPass =
                          'Mật khẩu phải có ít nhất 1 chữ thường, 1 chữ hoa, 1 số và 1 ký tự đặc biệt';
                    } else {
                      _errorPass = null;
                    }

                    // Kiểm tra lặp lại mật khẩu
                    if (_confirmPasswordController.text.isEmpty) {
                      _errorPass2 = 'Lặp lại mật khẩu không được bỏ trống';
                    } else if (_confirmPasswordController.text !=
                        _passwordController.text) {
                      _errorPass2 = 'Mật khẩu không khớp với mật khẩu chính';
                    } else {
                      _errorPass2 = null;
                    }

                    // Kiểm tra email
                    if (_emailController.text.isEmpty) {
                      __errorEmail = 'Email không được bỏ trống';
                    } else if (!isValidEmail(_emailController.text)) {
                      __errorEmail = 'Email không hợp lệ';
                    } else {
                      __errorEmail = null;
                    }

                    if (_phoneController.text.isEmpty) {}

                    if (_errorUsername == null &&
                        _errorPass == null &&
                        _errorPass2 == null &&
                        __errorEmail == null) {
                      print('Đã nhấn Đăng ký');
                    }
                  });
                },
                child: const Text(
                  'Đăng ký',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Đăng nhập nếu đã có tài khoản
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Nếu bạn đã có tài khoản!, ',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'Đăng nhập',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false,
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
