import 'dart:convert';

import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/models/room_details.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/repository/list_rooms_repo.dart';
import 'package:flutter/material.dart';

class RoomsViewModel extends ChangeNotifier {
  // Làm việc với giao diện và repo
  final RoomsRepo roomsRepo = RoomsRepo();
  List<Users> lstUser = [];
  List<Rooms> list = [];
  List<Rooms> get roomsList => list;
  bool fetchData = false;
  bool isLoading = false;
  Users? user;
  Rooms? rooms;
  String? errMess;
  List<RoomDetails> roomDetails = [];

  Future<void> getCreator(int userID) async {
    print("Đa vao getCreator");
    isLoading = true;
    notifyListeners();

    try {
      user = await roomsRepo.getCreator(userID);
      print(user);
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to Get Rooms List: $e");
    } finally {
      fetchData = false;
      notifyListeners();
    }
  }
  // ---------------------- Tìm phòng bằng roomCode --------------------

  Future<void> searchRoom(int roomCode) async {
    rooms = await roomsRepo.findRoomByCode(roomCode);
    print(roomCode);
    print(rooms);

    if (rooms == null) {
      errMess = "Phòng không tồn tại";
    } else if (rooms!.roomStatus != 1) {
      errMess = "Phòng không hoạt động";
      rooms = null;
      // } else if (rooms!.occupancy >= rooms!.maxOccupancy) {
      //   errMess = "Phòng đã đạt số lượng tối đa";
      //   rooms = null;
    } else {
      errMess = null;
    }
    notifyListeners();
    print(errMess);
  }

  Future<void> addUser(Rooms room) async {
    try {
      await roomsRepo.addRoom(room);
    } catch (e) {
      throw Exception('Thêm người dùng thất bại: $e');
    }
  }

  // -------------------- Lấy tất cả các phòng --------------------
  Future<void> getRoomsList() async {
    fetchData = true;
    try {
      list = await roomsRepo.getRoomList();
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to Get Rooms List: $e");
    } finally {
      fetchData = false;
      notifyListeners();
    }
  }

  Users? findOpponent(List<Users> users, int opponentID, int roomID,
      List<RoomDetails> room_details) {
    // Tìm người chơi có opponentID và roomID khớp
    return users.firstWhere((user) => user.userID == opponentID);
  }
}
