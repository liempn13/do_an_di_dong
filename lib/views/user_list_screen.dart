import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/edit_profile_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class UserListScreen extends StatefulWidget {
  Users? loginAdmin;
  UserListScreen({super.key, required this.loginAdmin});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Provider.of<UsersViewModel>(context, listen: false).fetchAllUsers();
    });
  }

  bool _anHienPass = true;
  bool _anHienPass2 = true;

  // Validation messages
  String? _errorUsername;
  String? _errorEmail;
  String? _errorPhone;
  String? _errorPass;
  String? _errorPass2;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  bool isValidUsername(String username) {
    final usernameRegex =
        RegExp(r'^[a-zA-Z0-9_]+$'); // Chỉ cho phép chữ cái, số và dấu gạch dưới
    return usernameRegex.hasMatch(username);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Danh sách tài khoản"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Consumer<UsersViewModel>(builder: (builder, viewModel, child) {
            Provider.of<UsersViewModel>(context, listen: false).fetchAllUsers();
            List<Users> list = viewModel.listUsers;
            return CustomListView(
                dataSet: list,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Row(
                      children: [
                        Text(list[index].userGameName).px4(),
                        list[index].status == -1
                            ? Icon(Icons.lock)
                            : UiSpacer.emptySpace()
                      ],
                    ),
                    subtitle:
                        Text(list[index].isAdmin ? "ADMIN" : "Người chơi"),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                    loginUser: widget.loginAdmin!,
                                    user: list[index],
                                  )));
                          initState();
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded)),
                  );
                });
          })
        ],
      ),
      fabl: FloatingActionButtonLocation.endFloat,
      fab: SpeedDial(
        child: Icon(Icons.add),
        children: [
          SpeedDialChild(
              label: "Thêm ADMIN",
              onTap: () => showDialog<Widget>(
                  context: context,
                  builder: (context) => Dialog(
                        child: Container(
                          height: 480,
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _usernameController,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[\p{Mn}]')),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Tên',
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    prefixIcon: const Icon(Icons.person),
                                    errorText: _errorUsername,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _errorUsername = value.isNotEmpty &&
                                              !isValidUsername(value)
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
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[\p{Mn}]')),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Mật khẩu',
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(_anHienPass
                                          ? Icons.visibility_off
                                          : Icons.visibility),
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
                                      _errorPass = value.isNotEmpty &&
                                              !isValidPassword(value)
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
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                      icon: Icon(_anHienPass2
                                          ? Icons.visibility_off
                                          : Icons.visibility),
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
                                      _errorPass2 = value.isNotEmpty &&
                                              value != _passwordController.text
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
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    prefixIcon: const Icon(Icons.email),
                                    errorText: _errorEmail,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _errorEmail = value.isNotEmpty &&
                                              !isValidEmail(value)
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
                                    LengthLimitingTextInputFormatter(
                                        10), // Giới hạn 10 số
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Số điện thoại',
                                    labelStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    prefixIcon: const Icon(Icons.phone),
                                    errorText: _errorPhone,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        _errorPhone =
                                            'Số điện thoại không được bỏ trống';
                                      } else if (!value.startsWith('0') ||
                                          value.length != 10) {
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                    ),
                                    onPressed: () {
                                      try {
                                        Users newUser = Users(
                                          //userID: 0,
                                          userGameName:
                                              _usernameController.text,
                                          email: _emailController.text,
                                          phone: _phoneController.text,
                                          password: _passwordController.text,
                                          isAdmin: true,
                                          level: 0,
                                          exp: 0,
                                          status: 0,
                                        );
                                        Provider.of<UsersViewModel>(context,
                                                listen: false)
                                            .addUser(newUser);
                                        Navigator.pop(context);
                                        _usernameController.clear();
                                        _emailController.clear();
                                        _phoneController.clear();
                                        _passwordController.clear();
                                      } catch (e) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Lỗi'),
                                              content:
                                                  Text('Đăng ký thất bại: $e'),
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
                              ],
                            ),
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
