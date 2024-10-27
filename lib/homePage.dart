import 'package:do_an_di_dong/notification.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // Bên trái appbar
        leading: PopupMenuButton<String>(
          icon: CircleAvatar(
            radius: 30,
            // Link hình ảnh cần sửa lại
            backgroundImage: NetworkImage(
              'https://example.com/your-avatar-image.jpg',
            ),
          ),
          onSelected: (value) {
            if (value == 'logout') {
              print('Đăng xuất');
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'logout',
              child: Text('Đăng xuất'),
            ),
          ],
        ),
        // Ở giữa appbar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              child: Text(
                '3',
              ),
            )
          ],
        ),
        // Bên phải appbar
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Bay sang trang thông báo
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
            },
          ),
        ],
      ),
      //phần thân------
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: selectedValue1,
                hint: Text("Chọn chủ đề"),
                isExpanded: true, // Giúp DropdownButton rộng ra hết chiều ngang
                items: <String>['Chủ đề 1', 'Chủ đề 2', 'Chủ đế 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue1 = newValue;
                  });
                },
                underline: SizedBox(), // Loại bỏ đường kẻ dưới mặc định
              ),
            ),
            //---Sizebox là khoảng cách giữa các thành phần với nhau
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: selectedValue2,
                hint: Text("Chọn bộ đề"),
                isExpanded: true,
                items: <String>['Bộ đề 1', 'Bộ đề 2', 'Bộ đề 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue2 = newValue;
                  });
                },
                underline: SizedBox(), // Loại bỏ đường kẻ dưới mặc định
              ),
            ),
            //----------------------------------------------------------
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: selectedValue3,
                hint: Text("Thời gian mỗi câu / Số câu hỏi của bộ đề"),
                isExpanded: true,
                items: <String>['10', '20', '30'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue3 = newValue;
                  });
                },
                underline: SizedBox(),
              ),
            ),
            //-----------------------------------------------------
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Luyện tập',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Thi đấu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  ),
                ),
              ],
            ),
          ],
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
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Cài đặt')
          ]),
    );
  }
}
