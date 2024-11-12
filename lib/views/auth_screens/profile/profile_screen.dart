import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/auth_screens/profile/edit_profile_screen.dart';
import 'package:do_an_di_dong/views/shared_layouts/ui_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  Users? loginUser;
  Users? user;
  ProfileScreen({super.key, required this.user, this.loginUser});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      txtEmail.text = widget.user?.email ?? widget.loginUser!.email;
      txtPhone.text = widget.user?.phone ?? widget.loginUser!.phone;
      txtName.text =
          widget.user?.userGameName ?? widget.loginUser!.userGameName;
    });
  }

  @override
  void dispose() {
    txtEmail.text = "";
    txtPhone.text = "";
    txtName.text = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          widget.loginUser!.isAdmin
              ? IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<UsersViewModel>(context)
                        .deleteUser(widget.user!);
                  },
                )
              : UiSpacer.emptySpace(),
        ],
        // leading: IconButton(
        //   color: Colors.white,
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.popAndPushNamed(context, '/settingHomepage');
        //   },
        // ),
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
              controller: TextEditingController(
                  text: widget.user?.userGameName ??
                      widget.loginUser!.userGameName),
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
              controller: TextEditingController(
                  text: widget.user?.email ?? widget.loginUser!.email),
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
              controller: TextEditingController(
                  text: widget.user?.phone ?? widget.loginUser!.phone),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      user: widget.user ?? widget.loginUser!,
                      loginUser: widget.loginUser,
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
