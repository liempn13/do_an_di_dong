import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/setting_homePage.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/profile_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  Users? loginUser;
  Users user;
  EditProfileScreen({super.key, required this.user, this.loginUser});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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

  void _updateProfile() async {
    final updatedUser = Users(
      userID: widget.user.userID,
      userGameName: txtName.text,
      phone: txtPhone.text,
      email: txtEmail.text,
      password: widget.user.password,
      status: widget.user.status,
      level: widget.user.level,
      exp: widget.user.exp,
    );
    try {
      await Provider.of<UsersViewModel>(context, listen: false)
          .updateUser(updatedUser);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Updated successfully!')),
      );
      // Navigator.pop(context, updatedUser);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Update: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sửa thông tin cá nhân',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/settingHomepage');
          },
        ),
        actions: [
          widget.loginUser!.isAdmin
              ? IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<UsersViewModel>(context)
                        .deleteUser(widget.user);
                  },
                )
              : UiSpacer.emptySpace(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Stack(
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
            const SizedBox(height: 20),
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                labelText: 'Tên:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: const Icon(Icons.edit, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                labelText: 'Email: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: const Icon(Icons.edit, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: txtPhone,
              decoration: InputDecoration(
                labelText: 'Số điện thoại:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                suffixIcon: const Icon(Icons.edit, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                            user: widget.user,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Lưu',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
