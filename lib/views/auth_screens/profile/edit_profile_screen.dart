import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sửa thông tin cá nhân',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/8631270/pexels-photo-8631270.jpeg',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.purple,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: 'dienFake'),
              decoration: InputDecoration(
                labelText: 'Tên:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: Icon(Icons.edit, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: 'dien@gmail.com'),
              decoration: InputDecoration(
                labelText: 'Email: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: Icon(Icons.edit, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: '0123456789'),
              decoration: InputDecoration(
                labelText: 'Số điện thoại:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: Icon(Icons.edit, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'Lưu',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}