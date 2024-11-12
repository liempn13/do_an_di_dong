import 'package:do_an_di_dong/models/users.dart';
import 'package:do_an_di_dong/view_models/users_view_model.dart';
import 'package:do_an_di_dong/views/shared_layouts/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'invite_list_screen.dart';

class FriendListScreen extends StatefulWidget {
  Users user;
  FriendListScreen({super.key, required this.user});

  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách bạn bè',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "BẠN BÈ"),
              Tab(text: "Lời mời kết bạn"),
            ],
          ),
          if (_tabController.index == 0)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'ID người chơi',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Consumer<UsersViewModel>(builder: (builder, viewModel, child) {
                  Provider.of<UsersViewModel>(context, listen: false)
                      .fetchAllFriends(widget.user.userID!);
                  List<Users> list = viewModel.listFriends;
                  return CustomListView(
                      dataSet: list,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:
                              const CircleAvatar(child: Icon(Icons.person)),
                          title: Text(list[index].userGameName),
                          subtitle: Text("Level: ${list[index].level}"),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                            child: const Text("Thách đấu"),
                          ),
                        );
                      });
                }),
                const InviteListScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
