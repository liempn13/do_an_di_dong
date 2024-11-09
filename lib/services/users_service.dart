import 'dart:convert';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/Users.dart';
import 'package:http/http.dart' as http;

class UsersService {
  //Tòa bộ user
  Future<http.Response> getUser() async {
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}users"),
    );
  }

  // lấy 1 user
  Future<http.Response> getUserByID(int userID) async {
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}user/info/$userID"),
    );
  }

  // Thêm dữ liệu vào api(đk)
  Future<http.Response> createUser(Users user) async {
    return await http.post(
        Uri.parse("${AppStrings.baseUrlApi}user/auth/register"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(user.toJson()));
  }

  //Cập nhật
  Future<http.Response> updateUser(Users user) async {
    return await http.put(Uri.parse("${AppStrings.baseUrlApi}user/info/update"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(user.toJson()));
  }

  //đăng xuất
  Future<http.Response> logoutUser() async {
    return await http.get(
      Uri.parse("${AppStrings.baseUrlApi}logout"),
    );
  }

  // kiểm tra email trong đn
  Future<http.Response> emailLogin(String email, String password) async {
    return await http.put(
      Uri.parse("${AppStrings.baseUrlApi}auth/login/email"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({"email": email, "password": password}),
    );
  }

  // kiểm tra sđt trong dn
  Future<http.Response> phoneNumberLogin(String phone, String password) async {
    return await http.put(
      Uri.parse("${AppStrings.baseUrlApi}auth/login/phone"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({"phone": phone, "password": password}),
    );
  }
}
