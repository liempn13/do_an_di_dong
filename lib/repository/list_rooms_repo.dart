import 'dart:convert';

import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/models/room_details.dart';
import 'package:do_an_di_dong/services/list_rooms_services.dart';

class RoomsRepo {
  final RoomsServices service = RoomsServices();
  Future<List<Rooms>> getRoomList() async {
    final reponse = await service.getRoomsList();
    if (reponse.statusCode == 200) {
      return List<Rooms>.from(
        json
            .decode(reponse.body)
            .map((x) => Rooms.fromJson(x)), // Lọc các phòng có status khác 0
      );
    } else {
      throw Exception("Failed code");
    }
  }

  Future<bool> addRoom(Rooms room) async {
    final response = await service.createRoom(room);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Thêm phòng thành công. Response body: ${response.body}");
      return true;
    } else {
      print("Response body: ${response.body}");
      throw Exception('Thêm người dùng thất bại: ${response.statusCode}');
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
    if (reponse.statusCode == 200) {
      final data = jsonDecode(reponse.body);
      if (data != null && data['rooms'] != null) {
        return Rooms.fromJson(json.decode(reponse.body));
      }
    } else {
      return null; //Phòng không tồn tại
    }
    return null;
  }
}
