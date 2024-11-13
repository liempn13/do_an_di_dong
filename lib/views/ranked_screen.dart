import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Color BGEXP = const Color.fromARGB(255, 173, 73, 225);
  Color BGWin = const Color.fromARGB(255, 235, 211, 248);
  Color TextEXP = Colors.white;
  Color TextWin = Colors.black;
  double fsexp = 20;
  double fswin = 15;
  int count = 4;
  int newValue = 0;

  void updateEXP() {
    setState(() {
      BGEXP = const Color.fromARGB(255, 173, 73, 225);
      TextEXP = Colors.white;
      BGWin = const Color.fromARGB(255, 235, 211, 248);
      TextWin = Colors.black;
      fsexp = 20;
      fswin = 15;
    });
  }

  void updateWin() {
    setState(() {
      BGWin = const Color.fromARGB(255, 173, 73, 225);
      TextWin = Colors.white;
      BGEXP = const Color.fromARGB(255, 235, 211, 248);
      TextEXP = Colors.black;
      fsexp = 15;
      fswin = 20;
    });
  }
  void initState() {
    super.initState();

    // Gọi hàm setUsers() khi màn hình được khởi tạo
    final viewModel = Provider.of<UsersViewModel>(context, listen: false);
    viewModel.setUsers();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Gọi setState sau khi build hoàn thành
      setState(() {
        // Cập nhật trạng thái ở đây
        count++;
      });
    });
    return
     Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 28, 172),
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 211, 248),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      updateEXP();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.39,
                      height: 55,
                      decoration: BoxDecoration(
                          color: BGEXP,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          'BXH EXP',
                          style: TextStyle(
                              color: TextEXP,
                              fontSize: fsexp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: updateWin,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 55,
                      decoration: BoxDecoration(
                          color: BGWin,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text('BXH Thắng',
                            style: TextStyle(
                                color: TextWin,
                                fontSize: fswin,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bảng xếp hạng
           Consumer<UsersViewModel>(builder: (context, viewModel, child) {
  if (viewModel.fetchingData) {
    return Center(child: CircularProgressIndicator());
  }

  if (viewModel.users.isEmpty) {
    return Center(child: Center(child: Text('Không có thông tin xếp hạng', style: TextStyle(color: Colors.white),)));
  }

  // Sắp xếp danh sách người chơi theo điểm EXP từ cao xuống thấp và lấy 20 người chơi đầu tiên
  List<Users> sortedUsers = List.from(viewModel.allUsers);
  sortedUsers.sort((a, b) => b.exp.compareTo(a.exp)); // Sắp xếp theo EXP từ cao đến thấp
  List<Users> topUsers = sortedUsers.take(20).toList(); // Lấy top 20 người chơi

  return SingleChildScrollView(
    child: Column(
      children: topUsers.map((user) {
        int index = topUsers.indexOf(user) + 1;

        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 80,  // Điều chỉnh chiều cao cho phù hợp
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/ranked.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Row(
              children: [
                // Vị trí xếp hạng
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color.fromARGB(255, 235, 211, 248),
                    ),
                    child: Center(
                      child: Text(index.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        user.userGameName[0],
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Text(
                          user.userGameName,  // Tên người chơi
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          '${user.exp} EXP',  // Điểm EXP của người chơi
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}),

            // Top >3
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
            //   child:
            //   Container(
            //       width: MediaQuery.of(context).size.width * 1,
            //       height: 350,
            //      // height: MediaQuery.of(context).size.height *1,
            //       decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(50),
            //             topRight: Radius.circular(50)),
            //         color: Color.fromARGB(255, 235, 211, 248),
            //       ),
            //       child: ListView.builder(
            //           itemCount: 18,
            //           itemBuilder: (context, index) {
            //             return Padding(
            //               padding: const EdgeInsets.only(
            //                   top: 10, left: 15, right: 15),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.5,
            //                 height: 80,
            //                 decoration: const BoxDecoration(
            //                   color: Color.fromARGB(255, 173, 73, 255),
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(30)),
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 20),
            //                       child: Container(
            //                           width: 20,
            //                           height: 20,
            //                           decoration: const BoxDecoration(
            //                             borderRadius: BorderRadius.all(
            //                                 Radius.circular(50)),
            //                             color:
            //                                 Color.fromARGB(255, 235, 211, 248),
            //                           ),
            //                           child: Center(
            //                             child: Text((index + 3).toString()),
            //                           )),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 13),
            //                       child: Container(
            //                         width: 50,
            //                         height: 50,
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(50),
            //                           color: Colors.black,
            //                         ),
            //                       ),
            //                     ),
            //                     const Padding(
            //                       padding: EdgeInsets.only(left: 15),
            //                       child: Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Padding(
            //                               padding: EdgeInsets.only(top: 17),
            //                               child: Text(
            //                                 'Tên người dùng',
            //                                 style: TextStyle(fontSize: 20),
            //                               ),
            //                             ),
            //                             Padding(
            //                               padding: EdgeInsets.only(top: 6),
            //                               child: Text(
            //                                 '000 EXP',
            //                                 style: TextStyle(fontSize: 13),
            //                               ),
            //                             )
            //                           ]),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             );
            //           })),
            
            // ),
          ],
        ),
      ),
    );
  }
}
