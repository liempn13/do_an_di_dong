import 'dart:convert';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<http.Response> getFriends(String token, int id) async {
    return await http
        .get(Uri.parse("${AppStrings.baseUrlApi}user/friends/$id"), headers: {
      'Authorization': 'Bearer $token',
    });
  }

  //Tòa bộ user
  Future<http.Response> getUser(String token) async {
    return await http.get(Uri.parse("${AppStrings.baseUrlApi}users"), headers: {
      'Authorization': 'Bearer $token',
    });
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
  Future<http.Response> updateProfile(Users user) async {
    return await http.put(
      Uri.parse('${AppStrings.baseUrlApi}user/info/update'),
      headers: {
        'Authorization': 'Bearer ${AppStrings.TOKEN}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(user.toJson()),
    );
  }

  Future<http.Response> deleteProfile(Users user) async {
    return await http.put(
      Uri.parse('${AppStrings.baseUrlApi}user/delete/$user'),
      headers: {
        'Authorization': 'Bearer ${AppStrings.TOKEN}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  //đăng xuất
  Future<http.Response> logout(String token) async {
    return await http.post(
      Uri.parse('${AppStrings.baseUrlApi}logout'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  Future<http.Response> emailLogin(String email, String password) async {
    return await http.post(
      Uri.parse('${AppStrings.baseUrlApi}auth/login/email'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode({"email": email, "password": password}),
    );
  }

  Future<http.Response> phoneLogin(String phone, String password) async {
    return await http.post(
      Uri.parse('${AppStrings.baseUrlApi}auth/login/phone'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode({"phone": phone, "password": password}),
    );
  }
}
