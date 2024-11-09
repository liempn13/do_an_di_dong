import 'dart:convert';
import 'dart:developer';
import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/services/users_service.dart';

class UsersRepository {
  final UsersService service = UsersService();

  Future<List<Users>> getUserList() async {
    final response = await service.getUser();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<Users>.from(
          json.decode(response.body).map((x) => Users.fromJson(x)));
    } else {
      throw Exception("Lấy danh sách người dùng thất bại");
    }
  }

  Future<bool> addUser(Users user) async {
    final response = await service.createUser(user);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Thêm người dùng thành công. Response body: ${response.body}");
      return true;
    } else {
      print("Thêm người dùng thất bại: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception('Thêm người dùng thất bại: ${response.statusCode}');
    }
  }

  Future<bool> updateUser(Users user) async {
    try {
      final response = await service.updateUser(user);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(
            "Cập nhật thông tin người dùng thành công. Response body: ${response.body}");
        return true;
      } else {
        print("Cập nhật thông tin người dùng thất bại: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Cập nhật thông tin người dùng thất bại');
      }
    } catch (error) {
      print("Đã xảy ra lỗi: $error");
      throw Exception('Cập nhật thông tin người dùng thất bại');
    }
  }

  Future<Users> emailLogin(String email, String password) async {
    final response = await service.emailLogin(email, password);
    if (response.statusCode == 200 || response.statusCode == 201) {
      //save on the shared preferences that the user is logged in
      print(Users.fromJson(json.decode(response.body)));
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Không thể đăng nhập: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Users> phoneNumberLogin(String phone, String password) async {
    final response = await service.phoneNumberLogin(phone, password);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Không thể đăng nhập: ${response.statusCode} - ${response.body}');
    }
  }

  Future<bool> logOut() async {
    final response = await service.logoutUser();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Đăng xuất thất bại: ${response.statusCode}');
    }
  }

  Future<Users> getUserByID(int profileID) async {
    final response = await service.getUserByID(profileID);
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Không thể tải thông tin hồ sơ: ${response.statusCode} - ${response.body}');
    }
  }

  fetchAllUsers() {}
}
