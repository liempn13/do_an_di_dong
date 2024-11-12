import 'package:flutter/material.dart';

class DetailRooms extends StatefulWidget {
  final int roomCode;
  //Rooms? rooms;
 // Users? user;

  const DetailRooms({super.key, required this.roomCode}) ;//, required this.rooms, required this.user});

  @override
  State<DetailRooms> createState() => _DetailRoomsState();
}

class _DetailRoomsState extends State<DetailRooms> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){
                // Nếu người chơi là chủ phòng
                
                //Nếu người chơi không là chủ phòng

              }, icon: Icon(Icons.exit_to_app_outlined, color: Colors.white,))
            ],
          )
        ],
      ),
    );
  }
}