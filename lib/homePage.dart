import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/notification.dart';
import 'package:do_an_di_dong/setting_homePage.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/friend.dart/friend_list_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/login/login_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/history/history_screen.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:do_an_di_dong/views/ranked_screen.dart';
import 'package:do_an_di_dong/views/room_screen/list_rooms.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:do_an_di_dong/views/topics_list_screen.dart';
import 'package:do_an_di_dong/views/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  Users? user;
  HomePage({super.key, this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Topics? selectedTopic;

  // Danh sách các trang mà bạn muốn điều hướng

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => settingHomepage(user: widget.user!)));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Screen()));
    } else if (index == 2) {
      //Truyền page lịch sử đấu
      //  Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => settingHomepage()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: Text(
          "Walnut Quizzes",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.group_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widget.user!.isAdmin
                        ? UserListScreen(
                            loginAdmin: widget.user,
                          )
                        : FriendListScreen(
                            user: widget.user!,
                          )),
              );
            },
          ),
          widget.user!.isAdmin
              ? IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    Provider.of<UsersViewModel>(context, listen: false)
                        .logOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined))
        ],
      ),
      //phần thân------
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/img/anh_do_vui.jpg"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //---Sizebox là khoảng cách giữa các thành phần với nhau
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TopicsListScreen(
                                    users: widget.user,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                    child: Text(
                      widget.user!.isAdmin ? 'Quản lí dữ liệu' : 'Luyện tập',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // widget.user!.isAdmin ?
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListRoomScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                    ),
                    child: Text(
                      'Phòng đấu',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.user!.isAdmin
          ? UiSpacer.emptySpace()
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: 'Trang chủ'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.view_column), label: 'Bảng xếp hạng'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: 'Lịch sử đấu'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Cài đặt')
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
    );
  }
}
