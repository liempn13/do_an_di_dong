import 'dart:convert';
import 'dart:developer';
import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/services/users_service.dart';

class UsersRepository {
  final UsersService service = UsersService();

  Future<List<Users>> getUserList() async {
    final response = await service.getUser(AppStrings.TOKEN);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<Users>.from(
          json.decode(response.body).map((x) => Users.fromJson(x)));
    } else {
      throw Exception("Lấy danh sách người dùng thất bại");
    }
  }

  Future<List<Users>> getFriendsList(int id) async {
    final response = await service.getFriends(AppStrings.TOKEN, id);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List<Users>.from(
          json.decode(response.body).map((x) => Users.fromJson(x)));
    } else {
      throw Exception("Lấy danh sách thất bại");
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

  Future<bool> updateProfile(Users user) async {
    try {
      final response = await service.updateProfile(user);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (error) {
      print("An error occurred: $error");
      throw Exception('Failed to update profile');
    }
  }

  Future<bool> deleteUser(int user) async {
    try {
      final response = await service.deleteProfile(user);
      if (response.statusCode == 200) {
        return true;
      } else {
        print("Response body: ${response.body}");
        throw Exception('Failed to update profile');
      }
    } catch (error) {
      throw Exception('Failed to delete profile');
    }
  }

  Future<bool> unlockUser(int user) async {
    try {
      final response = await service.unlockProfile(user);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to unlock profile');
      }
    } catch (error) {
      throw Exception('Failed to unlock profile');
    }
  }

  Future<Users> emailLogin(String email, String password) async {
    final response = await service.emailLogin(email, password);
    if (response.statusCode == 200 || response.statusCode == 201) {
      AppStrings.TOKEN = json.decode(response.body)['token']; // CHUỖI TOKEN
      return Users.fromJson(json.decode(response.body)['user']);
    } else {
      throw Exception(
          'Không thể đăng nhập: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Users> phoneNumberLogin(String phone, String password) async {
    final response = await service.phoneLogin(phone, password);
    if (response.statusCode == 200 || response.statusCode == 201) {
      AppStrings.TOKEN = json.decode(response.body)['token']; // CHUỖI TOKEN
      return Users.fromJson(json.decode(response.body)['user']);
    } else {
      throw Exception(
          'Không thể đăng nhập: ${response.statusCode} - ${response.body}');
    }
  }

  Future<bool> logOut() async {
    final response = await service.logout(AppStrings.TOKEN);
    if (response.statusCode == 200 || response.statusCode == 201) {
      AppStrings.TOKEN = "";
      return true;
    } else {
      throw Exception('Failed to logout: ${response.statusCode}');
    }
  }

  // Future<Users> getUserByID(int profileID) async {
  //   final response = await service.getUserByID(profileID);
  //   if (response.statusCode == 200) {
  //     return Users.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(
  //         'Không thể tải thông tin hồ sơ: ${response.statusCode} - ${response.body}');
  //   }
  // }
  // ---------------------- Xếp hạng theo exp --------------------------
  Future<List<Users>> fetchUsers() async {
    try {
      final response = await service.getUser(AppStrings.TOKEN);

      // Kiểm tra nếu yêu cầu thành công
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        // Chuyển đổi danh sách JSON thành danh sách đối tượng User
        return data.map((json) => Users.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Failed to load users");
    }
  }
}
