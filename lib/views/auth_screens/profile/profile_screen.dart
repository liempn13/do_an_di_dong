import 'package:do_an_di_dong/models/Users.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  Users user;
  ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  @override
  void initState() {
    txtEmail.text = widget.user.email;
    txtPhone.text = widget.user.phone;
    txtName.text = widget.user.userGameName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/settingHomepage');
          },
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/8631270/pexels-photo-8631270.jpeg'),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Tên:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              readOnly: true,
              controller: TextEditingController(text: widget.user.userGameName),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              readOnly: true,
              controller: TextEditingController(text: widget.user.email),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Số điện thoại:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              readOnly: true,
              controller: TextEditingController(text: widget.user.phone),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      user: widget.user,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "Chỉnh sửa",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
