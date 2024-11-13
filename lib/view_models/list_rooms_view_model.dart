import 'dart:convert';

import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/models/room_details.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/repository/list_rooms_repo.dart';
import 'package:flutter/material.dart';

class ListRoomsViewModel extends ChangeNotifier {
  // Làm việc với giao diện và repo
  final ListRoomsRepo listroomsRepo = ListRoomsRepo();
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
      user = await listroomsRepo.getCreator(userID);
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
    rooms = await listroomsRepo.findRoomByCode(roomCode);
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

  // -------------------- Lấy tất cả các phòng --------------------
  Future<void> getRoomsList() async {
    print("Lấy ds phòng");
    fetchData = true;
    try {
      list = await listroomsRepo.getRoomList();
         print(list);
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to Get Rooms List: $e");
    } finally {
      fetchData = false;
      notifyListeners();
    }

  }


  Users? findOpponent(List<Users> users, int opponentID, int roomID, List<RoomDetails>  room_details) {
  // Tìm người chơi có opponentID và roomID khớp
  return users.firstWhere(
    (user) => user.userID == opponentID );
}
}
