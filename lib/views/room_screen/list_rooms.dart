import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/view_models/list_rooms_view_model.dart';
import 'package:do_an_di_dong/services/list_rooms_services.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/ranked_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ListRoomScreen extends StatefulWidget {
  const ListRoomScreen({super.key});

  @override
  State<ListRoomScreen> createState() => _ListRoomScreenState();
}

class _ListRoomScreenState extends State<ListRoomScreen> {
  int creator_id = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ListRoomsViewModel>(context, listen: false).getRoomsList();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<ListRoomsViewModel>(context, listen: false)
      // .findUserById(creator_id);
    });
  }

  Widget build(BuildContext context) {
    final lstViewModel = Provider.of<ListRoomsViewModel>(context);
    final TextEditingController _roomCode = TextEditingController();
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
                // ------------------ Tìm kiếm bằng ID phòng ------------------
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 50,
                  child: TextField(
                    controller: _roomCode,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'ID',
                      suffixIcon: IconButton(
                          onPressed: () async {
                            int roomCode = int.parse(_roomCode.text);
                            await lstViewModel.searchRoom(roomCode);
                            if (lstViewModel.rooms != null &&
                                lstViewModel.errMess == null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Screen(), //RoomDetailPage(
                                  //roomID: viewModel.roomDetails!.roomID,
                                ),
                              );
                            } else if (lstViewModel.rooms == null) {
                              print(lstViewModel.errMess);
                              // Hiển thị thông báo nếu không tìm thấy phòng hoặc phòng không hoạt động
                              _showErr(context, lstViewModel.errMess as String);
                            }
                          },
                          icon: Icon(Icons.search)),
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
                //-------------------- Nút tạo phòng ----------------------
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
            //------------------- Danh sách phòng đang hoạt động -------------------
            Expanded(child: Consumer<ListRoomsViewModel>(
                builder: (context, viewModel, child) {
              if (viewModel.fetchData) {
                return Center(child: CircularProgressIndicator());
              } else {
                //print(viewModel);
                //print("2");
                List<Rooms> listRooms = viewModel.roomsList;
                // print(listRooms);
                return CustomListView(
                  dataSet: listRooms,
                  itemBuilder: (context, index) {
                    creator_id = listRooms[index].creatorID;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/img/bgroom.jpg'), // Backgroud room
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        // Padding(
                                        //     //--------------- Người tạo phòng ---------------
                                        //     padding: EdgeInsets.only(top: 5),
                                        //     child: Consumer<ListRoomsViewModel>(
                                        //         builder:
                                        //             (context, userView, child) {
                                        //       if (userView.isLoading) {
                                        //         return Center(
                                        //             child:
                                        //                 CircularProgressIndicator());
                                        //       } else {
                                        //         Users? user = userView.findUserById(creator_id);
                                        //         Container(
                                        //           width: 50,
                                        //           height: 50,
                                        //           decoration: BoxDecoration(
                                        //             border: Border.all(
                                        //                 width: 4,
                                        //                 color: Colors.white),
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     5),
                                        //           ),
                                        //           child: const Center(
                                        //               child: Text('Avatar')),
                                        //         );
                                        //       }
                                        //     })
                                        //     ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Center(
                                            child: lstViewModel.isLoading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : lstViewModel.user != null
                                                    ? Text(
                                                        "",
                                                        //user.userGameName,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : Text(
                                                        'User not found',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                          ),
                                        ),
                                      ]),
                                      Row(
                                        children:
                                            List.generate(3, (playerIndex) {
                                          // ------------ Hoạt ảnh + tên người chơi -------------
                                          print(
                                              "Thong tin user: $lstViewModel");
                                          print(creator_id);
                                          return Column(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: playerIndex == 2
                                                      ? 5
                                                      : 50),
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 4,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Center(
                                                    child: Text('Avatar')),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 7),
                                              child: Center(
                                                // child: userViewModel.isLoading? Center(child: CircularProgressIndicator(),) :
                                                // userViewModel.user != null ? Text(userViewModel.user!.userGameName, style: TextStyle(color: Colors.white),) :
                                                child: Text(
                                                  '',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ]);
                                        }),
                                      )
                                    ]),
                                Padding(
                                  padding: EdgeInsets.only(top: 17),
                                  child: Center(
                                    child: Text(
                                      listRooms[index]
                                          .roomName, // Sử dụng thuộc tính room_name của room
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // Thêm hành động vào phòng
                                      },
                                      icon: Icon(Icons.join_inner_outlined),
                                      label: Text('Vào Phòng'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            })),
          ],
        ),
      ),
    );
  }
}

Future<void> _showErr(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(message),
    ),
  );

  // Tự động đóng dialog sau 3 giây
  await Future.delayed(Duration(seconds: 3));
  Navigator.of(context).pop();
}
