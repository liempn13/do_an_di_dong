import 'package:do_an_di_dong/models/Rooms.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/view_models/rooms_view_model.dart';
import 'package:do_an_di_dong/services/list_rooms_services.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/ranked_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:do_an_di_dong/views/topics_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class ListRoomScreen extends StatefulWidget {
  Users user;
  ListRoomScreen({super.key, required this.user});

  @override
  State<ListRoomScreen> createState() => _ListRoomScreenState();
}

class _ListRoomScreenState extends State<ListRoomScreen> {
  List<Topics> topicList = [];
  Topics? selectedTopic;
  bool isEditing = true;

  void _loadtopics() async {
    try {
      await Provider.of<TopicsViewModel>(context, listen: false)
          .getTopicsList();
      setState(() {
        topicList =
            Provider.of<TopicsViewModel>(context, listen: false).listTopics;
        // if (topicList.isNotEmpty) {
        //   selectedTopic = topicList.firstWhere(
        //     (topic) =>
        //         topic.topicID == widget.,
        //   );
        // }
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load departments')),
      );
    }
  }

  String generateRandomString(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();

    return List.generate(
            length, (index) => characters[random.nextInt(characters.length)])
        .join();
  }

  @override
  void initState() {
    super.initState();
    _loadtopics();
    Provider.of<RoomsViewModel>(context, listen: false).getRoomsList();
  }

  Widget build(BuildContext context) {
    final lstViewModel = Provider.of<RoomsViewModel>(context);
    TextEditingController _roomCode = TextEditingController();
    TextEditingController _roomName = TextEditingController();

    TextEditingController _password = TextEditingController();
    String? _errorPass;
    bool _anHienPass = true;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 28, 172),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
        title: const Text(
          "Danh sách phòng chơi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
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
                    setState(() {
                      _roomCode.text = generateRandomString(6);
                    });
                    showDialog<Widget>(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                              maxHeight: 400), // Đặt giới hạn chiều cao tối đa
                          child: SingleChildScrollView(
                            // Thêm SingleChildScrollView để cuộn nội dung nếu cần
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Cho phép co giãn chiều cao
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Mã phòng',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    readOnly: true,
                                    controller: _roomCode,
                                  ),
                                  SizedBox(
                                      height:
                                          10), // Khoảng cách giữa các TextField
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Tên phòng',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    controller: _roomName,
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                      labelText: 'Mật khẩu',
                                      labelStyle:
                                          const TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      prefixIcon: const Icon(Icons.lock),
                                      errorText: _errorPass,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  DropdownButtonFormField<Topics>(
                                    value: selectedTopic,
                                    onChanged: isEditing
                                        ? (Topics? newValue) {
                                            setState(() {
                                              selectedTopic = newValue;
                                            });
                                          }
                                        : null, // Khi không cho phép chọn, onChanged = null để vô hiệu hóa
                                    items: topicList.map((Topics topic) {
                                      return DropdownMenuItem<Topics>(
                                        value: topic,
                                        child: Text(topic.topicName),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabled:
                                          isEditing, // Vô hiệu hóa cả dropdown nếu _isEditing là false
                                    ),
                                  ),

                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Rooms room = Rooms(
                                        roomCode: _roomCode.text,
                                        roomName: _roomName.text,
                                        creatorID: widget.user.userID!,
                                        password: _password.text,
                                        roomStatus: 1,
                                        topicID: selectedTopic!.topicID!,
                                      );
                                      Provider.of<RoomsViewModel>(context,
                                              listen: false)
                                          .addUser(room);
                                    },
                                    child: Text("Tạo"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
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
            Expanded(child:
                Consumer<RoomsViewModel>(builder: (context, viewModel, child) {
              Provider.of<RoomsViewModel>(context, listen: false).getRoomsList();
              if (viewModel.list.isEmpty) {
                return Center(
                  child: Text(
                    "Hiện tại không có phòng chơi nào.",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              if (viewModel.fetchData) {
                return Center(child: CircularProgressIndicator());
              } else {
                List<Rooms> listRooms = viewModel.roomsList;
                return CustomListView(
                  dataSet: listRooms,
                  itemBuilder: (context, index) {
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

void showDialogCreateRoom(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          //width: 100,
          //height: 100,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
        );
      });
}
