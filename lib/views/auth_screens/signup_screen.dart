import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/services/users_service.dart';
import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final UsersService _usersService = UsersService();
  bool _anHienPass = true;
  bool _anHienPass2 = true;

  // Validation messages
  String? _errorUsername;
  String? _errorEmail;
  String? _errorPhone;
  String? _errorPass;
  String? _errorPass2;

  bool isValidUsername(String username) {
    final usernameRegex =
        RegExp(r'^[a-zA-Z0-9_]+$'); // Chỉ cho phép chữ cái, số và dấu gạch dưới
    return usernameRegex.hasMatch(username);
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
                  text: 'Đăng ký ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            TextField(
              controller: _usernameController,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[\p{Mn}]')),
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              decoration: InputDecoration(
                labelText: 'Tên in-game',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                prefixIcon: const Icon(Icons.person),
                errorText: _errorUsername,
              ),
              onChanged: (value) {
                setState(() {
                  _errorUsername = value.isNotEmpty && !isValidUsername(value)
                      ? 'Tên in-game chỉ được phép chứa chữ cái, số và dấu gạch dưới'
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: _anHienPass,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[\p{Mn}]')),
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _anHienPass ? Icons.visibility_off : Icons.visibility),
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
                      Mật khẩu phải có 8 chữ số, 
                      ít nhất 1 chữ thường, 1 chữ hoa, 
                      1 số và 1 ký tự đặc biệt'''
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _anHienPass2,
              decoration: InputDecoration(
                labelText: 'Lặp lại mật khẩu',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _anHienPass2 ? Icons.visibility_off : Icons.visibility),
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
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                prefixIcon: const Icon(Icons.email),
                errorText: _errorEmail,
              ),
              onChanged: (value) {
                setState(() {
                  _errorEmail = value.isNotEmpty && !isValidEmail(value)
                      ? 'Email không hợp lệ'
                      : null;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10), // Giới hạn 10 số
              ],
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                prefixIcon: const Icon(Icons.phone),
                errorText: _errorPhone,
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    _errorPhone = 'Số điện thoại không được bỏ trống';
                  } else if (!value.startsWith('0') || value.length != 10) {
                    _errorPhone =
                        'Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 chữ số';
                  } else {
                    _errorPhone = null;
                  }
                });
              },
            ),

            const SizedBox(height: 30.0),
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
                onPressed: () async {
                  setState(() {
                    // Xác thực đầu vào
                    if (_usernameController.text.isEmpty) {
                      _errorUsername = 'Tên đăng nhập không được bỏ trống';
                    } else if (!isValidUsername(_usernameController.text)) {
                      _errorUsername =
                          'Tên đăng nhập chỉ được phép chứa chữ cái, số và dấu gạch dưới';
                    } else {
                      _errorUsername = null;
                    }

                    if (_passwordController.text.isEmpty) {
                      _errorPass = 'Mật khẩu không được bỏ trống';
                    } else if (!isValidPassword(_passwordController.text)) {
                      _errorPass =
                          'Mật khẩu phải có ít nhất 1 chữ thường, 1 chữ hoa, 1 số và 1 ký tự đặc biệt';
                    } else {
                      _errorPass = null;
                    }

                    if (_confirmPasswordController.text.isEmpty) {
                      _errorPass2 = 'Lặp lại mật khẩu không được bỏ trống';
                    } else if (_confirmPasswordController.text !=
                        _passwordController.text) {
                      _errorPass2 = 'Mật khẩu không khớp với mật khẩu chính';
                    } else {
                      _errorPass2 = null;
                    }

                    if (_emailController.text.isEmpty) {
                      _errorEmail = 'Email không được bỏ trống';
                    } else if (!isValidEmail(_emailController.text)) {
                      _errorEmail = 'Email không hợp lệ';
                    } else {
                      _errorEmail = null;
                    }
                  });
                  if (_phoneController.text.length != 10) {
                    _errorPhone = 'Số điện thoại phải có đúng 10 chữ số';
                  }
                  if (_phoneController.text.isEmpty) {
                    _errorPhone = 'Số điện thoại không được bỏ trống';
                  } else if (!_phoneController.text.startsWith('0') ||
                      _phoneController.text.length != 10) {
                    _errorPhone =
                        'Số điện thoại phải bắt đầu bằng số 0 và có đúng 10 chữ số';
                  } else {
                    _errorPhone = null;
                  }

                  if (_errorUsername == null &&
                      _errorPass == null &&
                      _errorPass2 == null &&
                      _errorEmail == null) {
                    try {
                      Users newUser = Users(
                        //userID: 0,
                        userGameName: _usernameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        password: _passwordController.text,
                        isAdmin: false,
                        level: 1,
                        exp: 0,
                        status: 1,
                      );

                      final response = await _usersService.createUser(newUser);
                      print('Status Code: ${response.statusCode}');
                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        print('Đăng ký thành công');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      } else {
                        //
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Lỗi'),
                              content: Text('Đăng ký thất bại}'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Lỗi'),
                            content: Text('Đăng ký thất bại: $e'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: const Text(
                  'Đăng ký',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
