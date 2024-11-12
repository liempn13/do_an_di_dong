import 'package:do_an_di_dong/models/users.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:do_an_di_dong/homePage.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/forgot_password_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _anHienPass = true;
  String? _errorEmail;
  String? _errorPass;
  Users? user;
  // TextEditingController để điều khiển các trường nhập liệu
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usersViewModel = Provider.of<UsersViewModel>(context);
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
                text: 'Đăng nhập ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            const SizedBox(height: 40.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email hoặc số điện thoại',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.person),
                errorText: _errorEmail,
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
                onPressed: () async {
                  // setState(() {
                  //   if (_emailController.text.isEmpty) {
                  //     _errorEmail = 'Không được để trống tên email/sđt';
                  //   } else {
                  //     _errorEmail = null;
                  //   }

                  //   if (_passwordController.text.isEmpty) {
                  //     _errorPass = 'Không được để trống mật khẩu';
                  //   } else {
                  //     _errorPass = null;
                  //   }
                  // });
                  try {
                    if (isEmail(_emailController.text)) {
                      // Đăng nhập bằng email
                      user = await usersViewModel.loginEmail(
                          _emailController.text, _passwordController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => HomePage(
                            user: user,
                          ),
                        ),
                      );
                    } else if (SPUtill.isPhoneNumber(_emailController.text)) {
                      // Đăng nhập bằng số điện thoại
                      user = await usersViewModel.loginPhone(
                          _emailController.text, _passwordController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => HomePage(
                            user: user,
                          ),
                        ),
                      );
                    } else {
                      throw Exception(
                          'Vui lòng nhập email hoặc số điện thoại hợp lệ');
                    }
                  } catch (e) {
                    print('Error: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lỗi kết nối')),
                    );
                  }
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
                          builder: (context) => const ForgePasswordScreen()));
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

class SPUtill {
  // Hàm kiểm tra số điện thoại hợp lệ
  static bool isPhoneNumber(String input) {
    // Kiểm tra nếu chuỗi là số và có độ dài hợp lệ
    return input.length == 10 && isNumeric(input);
  }
}
