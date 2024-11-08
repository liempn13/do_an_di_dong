import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/repository/list_rooms_repo.dart';
import 'package:flutter/material.dart';

class ListRoomsViewModel extends ChangeNotifier {
  // Làm việc với giao diện và repo
  final ListRoomsRepo listroomsRepo = ListRoomsRepo();

  List<Rooms> list = [];
  List<Rooms> get roomsList => list;
  bool fetchData = false;

  // Future<void> getListRooms(int roomID) async {
  //   fetchData = true;
  //   notifyListeners();

  //   try {
  //     list = await listroomsRepo.getListRooms(roomID);
  //     notifyListeners();
  //   } catch (e) {
  //     throw Exception("Failed to Get List Rooms: $e");
  //   } finally {
  //     fetchData = false;
  //     notifyListeners();
  //   }
  // }
  Future<void> getCreator(int userID) async {
    fetchData = true;
    notifyListeners();
    try{
      await  listroomsRepo.getCreator(userID);
      notifyListeners();
    } catch (e) {
      throw Exception("Failed to Get Rooms List: $e");
    } finally {
      fetchData = false;
      notifyListeners();
    }
  }
  Future<void> getRoomsList() async {
    print("Toi vao duoc roi");
    fetchData = true;
    notifyListeners();

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

}