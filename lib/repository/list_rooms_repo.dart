import 'dart:convert';

import 'package:do_an_di_dong/models/Rooms.dart';
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
}