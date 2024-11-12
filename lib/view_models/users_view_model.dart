import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/repository/users_repository.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  final UsersRepository repository = UsersRepository();

  List<Users> allUsers = [];
  bool fetchingData = false;
  List<Users> get listUsers => allUsers;
  bool _isLoad = false;

  List<Users> _users = [];
  List<Users> get users => _users;

  Users? selectedUser;

  Future<void> fetchAllUsers() async {
    fetchingData = true;
    try {
      allUsers = await repository.getUserList();
      notifyListeners();
    } catch (e) {
      throw Exception('Lấy dữ liệu thất bại: $e');
    }
    fetchingData = false;
  }

  Future<void> addUser(Users user) async {
    try {
      await repository.addUser(user);
    } catch (e) {
      throw Exception('Thêm người dùng thất bại: $e');
    }
  }

  Future<void> updateUser(Users user) async {
    try {
      await repository.updateProfile(user);
    } catch (e) {
      throw Exception('Cập nhật thông tin người dùng thất bại: $e');
    }
  }

  Future<void> logOut() async {
    try {
      await repository.logOut();
    } catch (e) {
      throw Exception('Đăng xuất thất bại: $e');
    }
  }

  Future<Users> loginEmail(String email, String password) async {
    try {
      return await repository.emailLogin(email, password);
    } catch (e) {
      throw Exception('Đăng nhập thất bại: $e');
    }
  }

  Future<Users> loginPhone(String phone, String password) async {
    try {
      return await repository.phoneNumberLogin(phone, password);
    } catch (e) {
      throw Exception('Đăng nhập thất bại: $e');
    }
  }

  // Future<void> getUserByID(int profileID) async {
  //   try {
  //     selectedUser = await repository.getUserByID(profileID);
  //     notifyListeners();
  //   } catch (e) {
  //     throw Exception('Không thể tải thông tin hồ sơ: $e');
  //   }
  // }


  //====================== Xếp hạng ======================== Huỳnh Gia Bảo
  // Cập nhật danh sách người dùng
Future<void> setUsers() async {
  fetchingData = true; 
  notifyListeners();

  try {
    _users = await repository.getUserList(); 
    sortUsersByExp();
    notifyListeners();
  } catch (e) {
    throw Exception('Lấy dữ liệu thất bại: $e');
  } finally {
    fetchingData = false; 
    notifyListeners();
  }
}

  // Hàm sắp xếp theo EXP
  void sortUsersByExp(){
    _users.sort((a, b) => b.exp.compareTo(a.exp));
  }
}
