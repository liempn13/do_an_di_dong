import 'package:do_an_di_dong/inGame.dart';
import 'package:do_an_di_dong/models/topics.dart';
import 'package:do_an_di_dong/notification.dart';
import 'package:do_an_di_dong/setting_homePage.dart';
import 'package:do_an_di_dong/view_models/topics_view_model.dart';
import 'package:do_an_di_dong/views/ranked_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:do_an_di_dong/views/topics_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  Topics? selectedTopic;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Trang chủ')),
    Center(child: Text('Bảng xếp hạng')),
    Center(child: Text('Lịch sử đấu')),
    settingHomepage(),
  ];
  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => settingHomepage()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Screen()));
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
        backgroundColor: Colors.purple,
        // Ở giữa appbar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        // Bên phải appbar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              // Bay sang trang thông báo
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const notification()),
              );
            },
          ),
        ],
      ),
      //phần thân------
      body: Container(
        decoration: BoxDecoration(
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
                              builder: (context) => TopicsListScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 32.0),
                    ),
                    child: const Text(
                      'Luyện tập',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 64.0, vertical: 32.0),
                    ),
                    child: const Text(
                      'Thi đấu',
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_column), label: 'Bảng xếp hạng'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Lịch sử đấu'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
