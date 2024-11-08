import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/repository/list_rooms_repo.dart';
import 'package:flutter/material.dart';

class ListRoomsViewModel extends ChangeNotifier {
  //lam viec voi giao dien va repo
  final ListRoomsRepo listroomsRepo = ListRoomsRepo();
  
  List<Rooms> list = [];
  List<Rooms> get roomsList => list;
  bool fetchData = false;

  Future<void> getListRooms(int roomID) async {
    try {
      await listroomsRepo.getListRooms(roomID);
    } catch (e) {
      throw Exception("Failed Get List Rooms: $e");
    }
  }

Future<void> getRoomsList() async {
  fetchData = true;
  try {
    list = await listroomsRepo.getRoomList();
    notifyListeners();
    print(list);
     // Trả về danh sách roomsList
  } catch (e) {
    throw Exception("Failed Get Rooms List: $e");
  }
  fetchData = false;
}
 
}