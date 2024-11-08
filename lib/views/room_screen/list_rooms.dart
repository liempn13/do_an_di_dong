import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/view_models/list_rooms_view_model.dart';
import 'package:do_an_di_dong/services/list_rooms_services.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListRoomScreen extends StatefulWidget {
  const ListRoomScreen({super.key});

  @override
  State<ListRoomScreen> createState() => _ListRoomScreenState();
}

class _ListRoomScreenState extends State<ListRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 28, 172),
      appBar: AppBar(
        title: const Text("Room Screen"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'ID',
                      suffixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Thêm hành động khi nhấn vào nút "Tạo phòng"
                    print('Tạo phòng được nhấn');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 235, 211, 248),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Tạo phòng',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(child: Consumer<ListRoomsViewModel>(builder: (context, viewModel, child) {
              if(viewModel.fetchData && viewModel.roomsList.isEmpty){
                 Provider.of<ListRoomsViewModel>(context, listen: false).getRoomsList();
                }
                if(
                  viewModel.fetchData
                ){
                  return Center(child: CircularProgressIndicator());
                }
                else{
                  List<Rooms> listRooms = viewModel.roomsList;
                 print(viewModel.roomsList);
                 return CustomListView(dataSet: listRooms, itemBuilder: (context,index){
                      return Text(listRooms[index].roomCode);
                 });
                }
            })
            )
            ,
            // Expanded(
            //   child: Consumer<ListRoomsViewModel>(
              
            //     builder: (context, listRoomsViewModel, child){
            //       // Lấy danh sách các phòng từ ViewModel và xác nhận kiểu dữ liệu là List
            //     if(listRoomsViewModel.fetchData && listRoomsViewModel.roomsList.isEmpty){
            //      Provider.of<ListRoomsViewModel>(context, listen: false).getRoomsList();
            //     }
            //     else{
            //      List<Rooms> listRooms = listRoomsViewModel.roomsList;
            //      print(listRoomsViewModel.roomsList);
            //       return CustomListView(
            //         dataSet: listRooms,
            //         itemBuilder: (context, index) {
            //           // Truy cập phòng hiện tại trong danh sách
            //           print(listRooms[index].roomName);
            //           return Text(listRooms[index].roomCode);
            //         }
            //           // return Padding(
            //           //   padding: const EdgeInsets.symmetric(vertical: 10),
            //           //   child: Container(
            //           //     width: double.infinity,
            //           //     height: 230,
            //           //     decoration: BoxDecoration(
            //           //       borderRadius: BorderRadius.circular(10),
            //           //       image: const DecorationImage(
            //           //         image: AssetImage('assets/img/bgroom.jpg'),
            //           //         fit: BoxFit.cover,
            //           //       ),
            //           //     ),
            //           //     child: Stack(
            //           //       children: [
            //           //         Container(
            //           //           decoration: BoxDecoration(
            //           //             color: Colors.black.withOpacity(0.5),
            //           //             borderRadius: BorderRadius.circular(10),
            //           //           ),
            //           //         ),
            //           //         Column(
            //           //           children: [
            //           //             Row(
            //           //               mainAxisAlignment:
            //           //                   MainAxisAlignment.spaceBetween,
            //           //               children: List.generate(4, (playerIndex) {
            //           //                 return Column(children: [
            //           //                   Padding(
            //           //                     padding: EdgeInsets.only(
            //           //                         top: playerIndex == 0 ? 5 : 50),
            //           //                     child: Container(
            //           //                       width: 50,
            //           //                       height: 50,
            //           //                       decoration: BoxDecoration(
            //           //                         border: Border.all(
            //           //                             width: 4,
            //           //                             color: Colors.white),
            //           //                         borderRadius:
            //           //                             BorderRadius.circular(5),
            //           //                       ),
            //           //                       child:
            //           //                           Center(child: Text('Avatar')),
            //           //                     ),
            //           //                   ),
            //           //                   Padding(
            //           //                     padding: EdgeInsets.only(top: 7),
            //           //                     child: Center(
            //           //                       child: Text(
            //           //                         'Tên người chơi',
            //           //                         style: TextStyle(
            //           //                             color: Colors.white),
            //           //                       ),
            //           //                     ),
            //           //                   ),
            //           //                 ]);
            //           //               }),
            //           //             ),
            //           //             Padding(
            //           //               padding: EdgeInsets.only(top: 17),
            //           //               child: Center(
            //           //                 child: Text(
            //           //                   listRooms[index].roomName, // Sử dụng thuộc tính room_name của room
            //           //                   style: TextStyle(
            //           //                       fontSize: 25, color: Colors.white),
            //           //                 ),
            //           //               ),
            //           //             ),
            //           //             Row(
            //           //               mainAxisAlignment: MainAxisAlignment.end,
            //           //               children: [
            //           //                 ElevatedButton.icon(
            //           //                   onPressed: () {
            //           //                     // Thêm hành động vào phòng
            //           //                   },
            //           //                   icon: Icon(Icons.join_inner_outlined),
            //           //                   label: Text('Vào Phòng'),
            //           //                 ),
            //           //               ],
            //           //             ),
            //           //           ],
            //           //         ),
            //           //       ],
            //           //     ),
            //           //   ),
            //           // );
            //         //},
            //       );
            //     }
            //     }
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
