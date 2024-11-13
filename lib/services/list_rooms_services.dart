import 'dart:convert';

import 'package:do_an_di_dong/constant/app_strings.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:http/http.dart' as http;

class ListRoomsServices {
  Future<http.Response> getRoomsList() async {
    return await http.get(Uri.parse("${AppStrings.baseUrlApi}rooms"),
        headers: {'Authorization': 'Bearer ${AppStrings.TOKEN}'});
  }

  Future<http.Response> getListRooms(int roomID) async {
    return await http.get(Uri.parse("${AppStrings.baseUrlApi}"));
  }

  Future<http.Response> getCreator(int userID) async {
    return await http.get(Uri.parse("${AppStrings.baseUrlApi}user/user_id"));
  }

// ------------------- Tìm phòng bằng roomCode -----------------------
  Future<http.Response> findRoomByCode(int roomID) async {
    return await http.get(Uri.parse(
            "${AppStrings.baseUrlApi}rooms/room_code = $roomID") //.replace(queryParameters: {'room_code': roomID.toString()})
        );
  }
}
