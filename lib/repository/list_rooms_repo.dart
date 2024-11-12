import 'dart:convert';

import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/models/room_details.dart';
import 'package:do_an_di_dong/services/list_rooms_services.dart';

class ListRoomsRepo {
  final ListRoomsServices service = ListRoomsServices();
  Future<List<Rooms>> getRoomList() async {
    final reponse = await service.getRoomsList();
    if (reponse.statusCode == 200) {
      return List<Rooms>.from(
          json.decode(reponse.body).map((x) => Rooms.fromJson(x)));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<Rooms> getListRooms(int roomID) async {
    final reponse = await service.getListRooms(roomID);
    if (reponse.statusCode == 200) {
      return Rooms.fromJson(json.decode(reponse.body));
    } else {
      throw Exception("Failed code");
    }
  }

  Future<Users?> getCreator(int userID) async {
    final reponse = await service.getCreator(userID);
    if (reponse.statusCode == 200) {
      return Users.fromJson(json.decode(reponse.body));
    } else {
      return null;
    }
  }

  // -------------------------- Repo tìm phòng bằng roomCode ----------------------------
  Future<Rooms?> findRoomByCode(int roomCode) async {
    final reponse = await service.findRoomByCode(roomCode);
    if(reponse.statusCode == 200) {
       final data = jsonDecode(reponse.body);
       if(data != null && data['rooms'] != null){
        return Rooms.fromJson(json.decode(reponse.body));
       }  
    } else {
      return null; //Phòng không tồn tại
    }
  }
}
